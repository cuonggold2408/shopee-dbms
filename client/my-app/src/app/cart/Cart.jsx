"use client";

import React, { useCallback, useEffect, useState } from "react";
import Image from "next/image";
import { Fragment } from "react";
import clsx from "clsx";
import Footer from "../footer/Footer";
import styles from "./cart.module.css";
import FreeShipping from "../../../public/image/free-ship.png";
import Header from "../(home)/header/Header";
import { getToken } from "../actions/gettoken.action";
import { client } from "../helpers/fetch_api/client";
import Checkbox from "@mui/material/Checkbox";
import showToast from "../helpers/Toastify";
import Loading from "../Loading/Loading";
import { ToastContainer } from "react-toastify";

function formatCurrency(value) {
  return value
    .toLocaleString("vi-VN", {
      maximumFractionDigits: 0, // Không hiển thị phần thập phân
    })
    .replace(/,/g, "."); // Đổi dấu phẩy thành dấu chấm
}

function calculateTotalPrice(quantity, price) {
  return quantity * price;
}

export default function Cart() {
  const [cart, setCart] = useState([]);
  const [userId, setUserId] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [timer, setTimer] = useState(null);
  const [allChecked, setAllChecked] = useState(false);
  const [totalPrice, setTotalPrice] = useState(0);
  const [totalQuantity, setTotalQuantity] = useState(0);

  const increaseQuantity = (index) => {
    updateCart(index, cart[index].quantity + 1);
  };

  const decreaseQuantity = (index) => {
    if (cart[index].quantity > 1) {
      updateCart(index, cart[index].quantity - 1);
    }
  };

  const updateCart = useCallback(
    (index, newQuantity) => {
      setCart((prevCart) => {
        const newCart = [...prevCart];
        newCart[index].quantity = newQuantity;
        newCart[index].total_price = calculateTotalPrice(
          newCart[index].quantity,
          newCart[index].product_price
        );
        return newCart;
      });

      if (timer) clearTimeout(timer);

      const newTimer = setTimeout(async () => {
        const productIndex = cart[index];
        const product_id = productIndex.product_id;
        const classify = productIndex.classify;
        const quantity = newQuantity;
        const id = productIndex.cart_id;

        const response = await client.post("/products/cart", {
          id,
          product_id,
          classify,
          quantity,
        });
        console.log("response: ", response.data);
      }, 400);

      setTimer(newTimer);
    },
    [timer, cart]
  );

  // const handleChange = useCallback(event) => {
  //   setChecked(event.target.checked);
  // };
  const handleChange = useCallback(
    (event, index) => {
      // setCart((prevCart) => {
      //   setAllChecked(newCart.every((item) => item.isChecked));
      //   return prevCart.map((item, idx) => {
      //     if (idx === index) {
      //       return { ...item, isChecked: !item.isChecked };
      //     }
      //     return item;
      //   });
      // });

      setCart((prevCart) => {
        const newCart = prevCart.map((item, idx) => {
          if (idx === index) {
            return { ...item, isChecked: !item.isChecked };
          }
          return item;
        });
        setAllChecked(newCart.every((item) => item.isChecked));
        return newCart;
      });

      if (timer) clearTimeout(timer);

      const newTimer = setTimeout(async () => {
        const productIndex = cart[index];
        console.log("productIndex: ", productIndex);
        const product_id = productIndex.product_id;
        const classify = productIndex.classify;
        const id = productIndex.cart_id;

        const response = await client.post("/products/selected/cart", {
          id,
          product_id,
          classify,
          isChecked: !productIndex.isChecked,
        });
        console.log("response: ", response.data);
      }, 400);

      setTimer(newTimer);
    },
    [timer, cart]
  );

  const handleSelectAll = useCallback(
    (event, index) => {
      const isChecked = event.target.checked;
      setAllChecked(isChecked);
      setCart((prevCart) => {
        return prevCart.map((item) => ({
          ...item,
          isChecked: isChecked,
        }));
      });

      if (timer) clearTimeout(timer);

      const newTimer = setTimeout(async () => {
        const response = await client.post("/products/selected-all/cart", {
          id: userId,
          isChecked: isChecked,
        });
        console.log("response: ", response.data);
      }, 400);

      setTimer(newTimer);
    },
    [timer]
  );

  const handleDeleteProduct = (index) => {
    const productDelete = cart[index];
    showToast(
      "confirm",
      "Bạn có chắc chắn muốn xóa sản phẩm này?",
      async () => {
        try {
          setIsLoading(true);
          const product_id = productDelete.product_id;
          const classify = productDelete.classify;
          const response = await client.delete(
            `/auth/products/cart/${userId}/${product_id}/${classify}`
          );
          console.log("response: ", response.data);
          const responseData = await client.get(
            `/auth/products/cart/${userId}`
          );
          console.log("responseData: ", responseData.data);
          const cartWithTotal = responseData.data.data.cart.map((item) => ({
            ...item,
            totalPrice: calculateTotalPrice(item.quantity, item.product_price),
            isChecked: item.is_selected,
          }));
          setCart(cartWithTotal);
        } catch (e) {
          console.log(e);
        } finally {
          setIsLoading(false);
        }
      }
    );
  };


  useEffect(() => {
    async function fetchProductToCart() {
      try {
        const dataToken = await getToken();
        setUserId(dataToken.userId);
        const response = await client.get(
          `/auth/products/cart/${dataToken.userId}`
        );
        const cartWithTotal = response.data.data.cart.map((item) => {
          return {
            ...item,
            total_price: calculateTotalPrice(
              item.quantity,
              +item.product_price
            ),
            isChecked: item.is_selected,
          };
        });
        setCart(cartWithTotal);
      } catch (e) {
        console.log(e);
      }
    }
    fetchProductToCart();
  }, []);

  useEffect(() => {
    console.log("cart 204: ", cart);
    const allSelected = cart.every((item) => item.isChecked);
    setAllChecked(allSelected);
  }, [cart]);

  useEffect(() => {
    let total = 0;
    let quantity = 0;

    cart.forEach((item) => {
      if (item.isChecked) {
        total += item.quantity * item.product_price;
        quantity++;
      }
    });

    setTotalPrice(total);
    setTotalQuantity(quantity);
  }, [cart]);

  return (
    <Fragment>
      {isLoading && <Loading />}
      <Header />
      <div className={styles.main}>
        <div className={styles.container}>
          <div
            className={clsx(
              "flex items-center gap-1 p-2 mt-5",
              styles.box__freeship
            )}
          >
            <Image src={FreeShipping} alt="free-ship" width={30} height={30} />
            <p>
              Nhấn vào mục Mã giảm giá ở cuối trang để hưởng miễn phí vận chuyển
              bạn nhé!
            </p>
          </div>
          <div className={clsx(styles.box__cart)}>
            <div
              className={clsx(
                styles.cart__title,
                "flex items-center px-5 py-3 mt-3"
              )}
            >
              <div className={clsx(styles.checkbox, "flex items-center gap-2")}>
                <Checkbox
                  checked={allChecked}
                  onChange={handleSelectAll}
                  sx={{
                    color: "#ee4d2d",
                    "&.Mui-checked": {
                      color: "#ee4d2d",
                    },
                  }}
                />
                <div>Sản phẩm</div>
              </div>
              <div className={clsx(styles.unit__price, "flex justify-center")}>
                Đơn giá
              </div>
              <div
                className={clsx(styles.title__quantity, "flex justify-center")}
              >
                Số lượng
              </div>
              <div className={clsx(styles.total, "flex justify-center")}>
                Thành tiền
              </div>
              <div className={clsx(styles.operation, "flex justify-center")}>
                Thao tác
              </div>
            </div>

            <div className={clsx(styles.list__product)}>
              {/* Đổ product */}
              {cart.map((product, index) => {
                {
                  /* console.log("product: ", product); */
                }
                return (
                  <div
                    className={clsx(
                      styles.product__item,
                      "flex items-center py-5 px-5 mt-3"
                    )}
                    key={product?.id}
                  >
                    <div
                      className={clsx(
                        styles.checkbox,
                        "flex items-center gap-2"
                      )}
                    >
                      <Checkbox
                        checked={product?.isChecked}
                        onChange={(event) => handleChange(event, index)}
                        sx={{
                          color: "#ee4d2d",
                          "&.Mui-checked": {
                            color: "#ee4d2d",
                          },
                        }}
                      />
                      <Image
                        src={product?.image_product}
                        alt="test-cart"
                        width={80}
                        height={80}
                      />
                      <p className={clsx(styles.title__product)}>
                        {product?.product_name}
                      </p>
                      <div
                        style={{
                          color: "rgb(182,182,182)",
                          fontSize: "0.9rem",
                        }}
                        className="flex flex-col  justify-center"
                      >
                        <h3>Phân loại hàng: </h3>
                        <h4
                          style={{
                            textTransform: "Capitalize",
                          }}
                        >
                          {product?.classify}
                        </h4>
                        {/* Test */}
                      </div>
                    </div>
                    <div
                      className={clsx(
                        styles.unit__price,
                        "flex justify-center"
                      )}
                    >
                      <div className="flex items-center justify-center gap-3">
                        <div className={clsx(styles.price__old)}>₫69.000</div>
                        <div className={clsx(styles.price__new)}>
                          ₫{formatCurrency(+product?.product_price)}
                        </div>
                      </div>
                    </div>
                    <div
                      className={clsx(
                        styles.title__quantity,
                        "flex justify-center"
                      )}
                    >
                      <div className="flex items-center">
                        <div className="flex items-center justify-center ">
                          <button
                            className={styles.btn__quantity}
                            onClick={() => decreaseQuantity(index)}
                          >
                            -
                          </button>
                          <input
                            type="text"
                            value={product?.quantity}
                            className={styles.quantity}
                          />
                          <button
                            className={styles.btn__quantity}
                            onClick={() => increaseQuantity(index)}
                          >
                            +
                          </button>
                        </div>
                      </div>
                    </div>
                    <div className={clsx(styles.total, "flex justify-center")}>
                      ₫{formatCurrency(+product?.total_price)}
                    </div>
                    <div
                      className={clsx(styles.operation, "flex justify-center")}
                    >
                      <button onClick={() => handleDeleteProduct(index)}>
                        Xóa
                      </button>
                    </div>
                  </div>
                );
              })}

              <div
                className={clsx(
                  "flex items-center justify-between bg-white mt-5 p-5"
                )}
              >
                <div className="flex gap-2 items-center">
                  <Checkbox
                    checked={allChecked}
                    onChange={handleSelectAll}
                    sx={{
                      color: "#ee4d2d",
                      "&.Mui-checked": {
                        color: "#ee4d2d",
                      },
                    }}
                  />
                  <span>Chọn tất cả ({cart.length} sản phẩm)</span>
                </div>
                <div className="flex justify-center gap-3 items-center">
                  <div>
                    Tổng thanh toán(
                    <span>{totalQuantity}</span>
                    Sản phẩm)
                  </div>
                  <div
                    style={{
                      color: "#ee4d2d",
                      fontSize: "1.5rem",
                    }}
                  >
                    ₫{formatCurrency(totalPrice)}
                  </div>
                  <button className={styles.btn__buy}>Mua hàng</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <Footer />
      <ToastContainer />
    </Fragment>
  );
}
