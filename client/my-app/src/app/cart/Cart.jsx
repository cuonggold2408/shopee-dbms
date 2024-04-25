"use client";

import React, { useEffect, useState } from "react";
import Image from "next/image";
import { Fragment } from "react";
import clsx from "clsx";
import Footer from "../footer/Footer";

import styles from "./cart.module.css";
import FreeShipping from "../../../public/image/free-ship.png";
import TestCart from "../../../public/image/test-cart.jpg";
import Header from "../(home)/header/Header";
import { getToken } from "../actions/gettoken.action";
import { client } from "../helpers/fetch_api/client";

function formatCurrency(value) {
  return value
    .toLocaleString("vi-VN", {
      maximumFractionDigits: 0, // Không hiển thị phần thập phân
    })
    .replace(/,/g, "."); // Đổi dấu phẩy thành dấu chấm
}

export default function Cart() {
  const [quantity, setQuantity] = useState(1);
  const [cart, setCart] = useState([]);


  const increaseQuantity = (index) => {
    setCart((prevCart) => {
      const newCart = [...prevCart];
      newCart[index].quantity += 1;
      return newCart;
    });
  };

  const decreaseQuantity = (index) => {
    setCart((prevCart) => {
      const newCart = [...prevCart];
      if (newCart[index].quantity > 1) {
        newCart[index].quantity -= 1;
      }
      return newCart;
    });
  };
  useEffect(() => {
    async function fetchProductToCart() {
      try {
        const dataToken = await getToken();
        const response = await client.get(
          `/auth/products/cart/${dataToken.userId}`
        );
        console.log("response: ", response.data);
        setCart(response.data.data.cart);
      } catch (e) {
        console.log(e);
      }
    }
    fetchProductToCart();
  }, []);

  return (
    <Fragment>
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
                <input type="checkbox" />
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
              {cart.map((product, index) => (
                console.log("product: ", product),
                <div
                  className={clsx(
                    styles.product__item,
                    "flex items-center py-5 px-5 mt-3"
                  )}
                >
                  <div
                    className={clsx(styles.checkbox, "flex items-center gap-2")}
                  >
                    <input type="checkbox" />
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
                      <h4 style={{
                        textTransform: "Capitalize",
                      }}>{product?.classify}</h4>
                      {/* Test */}

                    </div>
                  </div>
                  <div
                    className={clsx(styles.unit__price, "flex justify-center")}
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
                    ₫{formatCurrency(+product?.product_price)}
                  </div>
                  <div
                    className={clsx(styles.operation, "flex justify-center")}
                  >
                    <button>Xóa</button>
                  </div>
                </div>
              ))}

              <div
                className={clsx(
                  "flex items-center justify-between bg-white mt-5 p-5"
                )}
              >
                <div className="flex gap-2">
                  <input type="checkbox" />
                  <span>Chọn tất cả (2 sản phẩm)</span>
                </div>
                <div className="flex justify-center gap-3 items-center">
                  <div>
                    Tổng thanh toán(
                    <span>0</span>
                    Sản phẩm)
                  </div>
                  <div
                    style={{
                      color: "#ee4d2d",
                      fontSize: "1.5rem",
                    }}
                  >
                    ₫0
                  </div>
                  <button className={styles.btn__buy}>Mua hàng</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </Fragment>
  );
}
