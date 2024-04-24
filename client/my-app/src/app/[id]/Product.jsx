"use client";

import React, { useEffect, useState } from "react";
import Image from "next/image";
import { Fragment } from "react";
import style from "./product.module.css";
import clsx from "clsx";
import Header from "../(home)/header/Header";
import Link from "next/link";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faStar } from "@fortawesome/free-solid-svg-icons";
import SliderComponent from "./slider/Slider";
import { faCartPlus } from "@fortawesome/free-solid-svg-icons";
import Footer from "../footer/Footer";
import { client } from "../helpers/fetch_api/client";
import Loading from "../Loading/Loading";
import showToast from "../helpers/Toastify";
import { useRouter } from "next/navigation";

import Admin from "../../../public/image/admin2.jpg";
import { getToken } from "../actions/gettoken.action";

// Hàm để định dạng số tiền
function formatCurrency(value) {
  return value
    .toLocaleString("vi-VN", {
      maximumFractionDigits: 0, // Không hiển thị phần thập phân
    })
    .replace(/,/g, "."); // Đổi dấu phẩy thành dấu chấm
}

export default function Product({ id }) {
  const [isLoading, setIsLoading] = useState(true);
  const [mainImage, setMainImage] = useState();
  const [quantity, setQuantity] = useState(1);
  const [product, setProduct] = useState([]);
  const [selectedClassify, setSelectedClassify] = useState([]);

  const [evaluates, setEvaluates] = useState([]);

  const [productToCart, setProductToCart] = useState();

  const router = useRouter();

  const increaseQuantity = () => {
    setQuantity(quantity + 1);
  };
  const decreaseQuantity = () => {
    if (quantity > 1) {
      setQuantity(quantity - 1);
    }
  };

  const handleColorHover = (imageLink) => {
    setMainImage(imageLink);
  };
  const handleClassifyClick = (categoryIndex, optionIndex) => {
    setSelectedClassify((prev) => {
      const newSelected = [...prev];
      const existingIndex = newSelected.findIndex(
        (item) => item.category === categoryIndex && item.option === optionIndex
      );
      if (existingIndex !== -1) {
        newSelected.splice(existingIndex, 1);
      } else {
        const categoryIndexInSelected = newSelected.findIndex(
          (item) => item.category === categoryIndex
        );
        if (categoryIndexInSelected !== -1) {
          newSelected[categoryIndexInSelected] = {
            category: categoryIndex,
            option: optionIndex,
          };
        } else {
          newSelected.push({ category: categoryIndex, option: optionIndex });
        }
      }
      return newSelected;
    });
  };

  const handleAddToCart = async () => {
    const token = await getToken();
    console.log(token);
    if (!token) {
      router.push("/login");
      return;
    }
    try {
      const response = await client.post("/auth/products/cart", productToCart);
      if (!response.data.status === 201) {
        showToast("error", response.data.message);
      }
      showToast("success", response.data.message);
      window.location.reload();
    } catch (e) {
      console.log(e);
      showToast("error", "Có lỗi xảy ra");
    }
  };

  useEffect(() => {
    async function getProductById() {
      try {
        const response = await client.get(`/products/${id}`);
        if (response.data.status !== 200) {
          router.push("/not-found");
          showToast("error", response.data.message);
        }
        const data = response.data.data;
        setMainImage(
          data.ProductClassifies[0].ClassifyOptions[0].ProductImages[0]
            .image_link
        );
        const dataToken = await getToken();
        setProductToCart({
          users_id: dataToken.userId,
          product_id: id,
          image_product:
            data.ProductClassifies[0].ClassifyOptions[0].ProductImages[0]
              .image_link,
          product_name: data.product_name,
          product_price: data.price,
        });

        setProduct(data);
        setIsLoading(false);
      } catch (e) {
        console.log(e);
      } finally {
        setIsLoading(false);
      }
    }
    getProductById();

    async function getOneEvaluated() {
      try {
        const response = await client.get(`/products/get/one/evaluate/${id}`);
        setEvaluates(response.data.data);
      } catch (e) {
        console.log(e);
      }
      finally {
        setIsLoading(false);
      }
    }
    getOneEvaluated();
  }, []);

  return (
    <Fragment>
      {isLoading && <Loading />}
      <Header />
      <div className={clsx(style.main)}>
        <div className={clsx(style.container)}>
          <div className={clsx(style.nav, "flex items-center")}>
            <ul className={clsx(style.breadcrumb, "flex items-center")}>
              <li>
                <Link href={"/"}>Shopee</Link>
              </li>
              {/* <li>
                <Link href={"/"}>Điện thoại và phụ kiện</Link>
              </li> */}
              <li>
                <Link href={"/"}>
                  {product?.Productline?.Category?.category_name}
                </Link>
              </li>
              <li>
                <Link href={"/"}>{product?.Productline?.productline_name}</Link>
              </li>
              <li className={clsx(style.title__product)}>
                {product.product_name}
              </li>
            </ul>
          </div>
          <div className="flex justify-between bg-white px-4 py-4">
            <div className={clsx(style.product__img)}>
              <Image src={mainImage} alt="product" width={450} height={450} />
              {/* <div>
                <SliderComponent onImageHover={setMainImage} />
              </div> */}
            </div>
            <div className={clsx(style.product__desc)}>
              <h2 className="mb-2">{product?.product_name}</h2>
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center gap-5">
                  <div
                    className={clsx(
                      "flex items-center gap-2 flex-wrap",
                      style.rating
                    )}
                  >
                    <span>5.0</span>
                    <div className="flex items-center gap-1">
                      <FontAwesomeIcon icon={faStar} width={15} height={15} />
                      <FontAwesomeIcon icon={faStar} width={15} height={15} />
                      <FontAwesomeIcon icon={faStar} width={15} height={15} />
                      <FontAwesomeIcon icon={faStar} width={15} height={15} />
                      <FontAwesomeIcon icon={faStar} width={15} height={15} />
                    </div>
                  </div>
                  <div>
                    <span className="mr-1">20.7k</span>
                    <span className="text-slate-400">Đã bán</span>
                  </div>
                </div>
                <div className="text-slate-400">Tố cáo</div>
              </div>
              <div
                className="flex items-center gap-3 mt-2 py-3 px-1"
                style={{
                  backgroundColor: "#f5f5f5",
                }}
              >
                <span className={style.price__old}>₫34.999.000</span>
                <span className={style.price__new}>
                  đ{product.price && formatCurrency(+product.price)}
                </span>
                <div className={style.sell__product}>
                  <span>11%</span>
                  Giảm
                </div>
              </div>
              {product?.ProductClassifies?.map((item, classifyIndex) => (
                <Fragment key={classifyIndex}>
                  <div className={clsx("flex mt-5", style.classify__product)}>
                    <h3 className={style.title__item}>{item.classify_name}</h3>
                    <ul
                      style={{
                        width: "80%",
                      }}
                      className="flex items-center flex-wrap gap-2"
                    >
                      {item.ClassifyOptions.map((classify, optionIndex) => (
                        <li
                          key={optionIndex}
                          className={clsx(
                            "flex items-center gap-2 flex-wrap",

                            {
                              [style.selected]: selectedClassify.some(
                                (item) =>
                                  item.category === classifyIndex &&
                                  item.option === optionIndex
                              ),
                            }
                          )}
                        >
                          <button
                            className={style.classify__item}
                            onClick={() =>
                              handleClassifyClick(classifyIndex, optionIndex)
                            }
                            onMouseOver={() =>
                              classifyIndex === 0
                                ? handleColorHover(
                                  classify?.ProductImages[0]?.image_link
                                )
                                : null
                            }
                          >
                            {item.classify_name !== "size" ? (
                              <Image
                                src={classify?.ProductImages[0]?.image_link}
                                alt={classify?.option_name}
                                className={style["icon-product"]}
                                width={24}
                                height={24}
                              />
                            ) : (
                              ""
                            )}
                            <span>{classify.option_name}</span>
                          </button>
                        </li>
                      ))}
                    </ul>
                  </div>
                </Fragment>
              ))}
              <div className="flex mt-5 items-center">
                <h3 className={style.title__item}>Số lượng</h3>
                <div className="flex items-center justify-center mr-4">
                  <button
                    className={style.btn__quantity}
                    onClick={decreaseQuantity}
                  >
                    -
                  </button>
                  <input
                    type="text"
                    value={quantity}
                    className={style.quantity}
                  />
                  <button
                    className={style.btn__quantity}
                    onClick={increaseQuantity}
                  >
                    +
                  </button>
                </div>

                <div className={style.quantity__stock}>
                  {product.quantity_in_stock > 0
                    ? product.quantity_in_stock
                    : "Sản phẩm đã hết hàng"}{" "}
                  sản phẩm có sẵn
                </div>
              </div>

              <div className="flex items-center mt-5 gap-5">
                <button onClick={handleAddToCart} className={style.btn__add}>
                  <FontAwesomeIcon
                    icon={faCartPlus}
                    width={20}
                    height={20}
                    className="mr-2"
                    style={{
                      color: "#D8011B",
                    }}
                  />
                  Thêm vào giỏ hàng
                </button>
                <button className={style.btn__buy}>Mua ngay</button>
              </div>
            </div>
            <div></div>
          </div>
          <div className="flex flex-col bg-white mt-10 px-5 py-5">
            <div
              style={{
                marginBottom: "10px",
                fontSize: "20px",
                fontWeight: "500",
                borderBottom: "1px solid #f5f5f5",
                padding: "2px 0",
              }}
            >
              Mô tả sản phẩm
            </div>
            <div
              dangerouslySetInnerHTML={{
                __html: (product.description || "").replace(/\n/g, "<br />"),
              }}
            />
          </div>

          <div className={clsx("bg-white mt-5 p-5")} >
            <h2 style={{
              textTransform: "uppercase",
              fontWeight: "500",
            }} className="mb-4">Đánh giá sản phẩm</h2>
            <div className="flex items-center" style={{
              color: "#ff4d2d",
              background: "rgb(255, 251, 248)",
            }}>
              <div className="flex flex-col items-center">
                <div className={clsx(style.box__vote)}>
                  <div>
                    <span className={style.voting}>4.8</span>
                    trên 5</div>
                  <div className="flex gap-1">
                    <FontAwesomeIcon icon={faStar} width={20} height={20} className={style.vote__icon} />
                    <FontAwesomeIcon icon={faStar} width={20} height={20} className={style.vote__icon} />
                    <FontAwesomeIcon icon={faStar} width={20} height={20} className={style.vote__icon} />
                    <FontAwesomeIcon icon={faStar} width={20} height={20} className={style.vote__icon} />
                    <FontAwesomeIcon icon={faStar} width={20} height={20} className={style.vote__icon} />
                  </div>
                </div>
              </div>
            </div>

            {evaluates.map((evaluate, index) => (
              <div key={index} className={clsx(style.user__vote, 'p-5')}>
                <div className="p-2 flex">
                  <div className="mr-3">
                    <Image src={Admin} alt="user" width={40} height={40} className={style.avt__user} />
                  </div>
                  <div className="flex flex-col gap-1">
                    <h3>bachnguyen04</h3>
                    <div className="flex gap-1">
                      <FontAwesomeIcon icon={faStar} width={15} height={15} className={style.vote__icon} />
                      <FontAwesomeIcon icon={faStar} width={15} height={15} className={style.vote__icon} />
                      <FontAwesomeIcon icon={faStar} width={15} height={15} className={style.vote__icon} />
                      <FontAwesomeIcon icon={faStar} width={15} height={15} className={style.vote__icon} />
                      <FontAwesomeIcon icon={faStar} width={15} height={15} className={style.vote__icon} />
                    </div>
                    <div className="flex gap-3" style={{
                      color: "rgb(200,200,200)",
                      fontSize: "13px"
                    }}>
                      <div>{evaluate.createdAt}</div>
                      <div>Phân loại hàng: Trắng + Xám,Thùng 300 cái</div>
                    </div>
                    <div className={style.cmt}>
                      {evaluate.commented}
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      <Footer />
    </Fragment>
  );
}
