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

// Hàm để định dạng số tiền
function formatCurrency(value) {
  console.log(value);
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

  const router = useRouter();

  const increaseQuantity = () => {
    setQuantity(quantity + 1);
  };
  const decreaseQuantity = () => {
    if (quantity > 1) {
      setQuantity(quantity - 1);
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
        console.log(data);
        setMainImage(
          data.ProductClassifies[0].ClassifyOptions[0].ProductImages[0]
            .image_link
        );
        setProduct(data);
        setIsLoading(false);
      } catch (e) {
        console.log(e);
      } finally {
        setIsLoading(false);
      }
    }
    getProductById();
  }, []);
  console.log(product);

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
              {product?.ProductClassifies?.length > 1 ? (
                product?.ProductClassifies.map((item, index) => (
                  <Fragment key={index}>
                    <div className={clsx("flex mt-5", style.classify__product)}>
                      <h3 className={style.title__item}>
                        {item.classify_name}
                      </h3>
                      <ul
                        style={{
                          width: "80%",
                        }}
                        className="flex items-center flex-wrap gap-2"
                      >
                        {item.ClassifyOptions.map((classify, index) => (
                          <li
                            key={index}
                            className="flex items-center gap-2 flex-wrap"
                          >
                            <button className={style.classify__item}>
                              {item.classify_name !== "size" ? (
                                <Image
                                  src={classify?.ProductImages[0]?.image_link}
                                  alt=""
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
                ))
              ) : (
                <div className={clsx("flex mt-5", style.classify__product)}>
                  <h3 className={style.title__item}>Phân loại</h3>
                  <ul
                    style={{
                      width: "80%",
                    }}
                    className="flex items-center flex-wrap gap-2"
                  >
                    {product &&
                      product?.ProductClassifies?.[0].ClassifyOptions.map(
                        (classify) => (
                          <li className="flex items-center gap-2 flex-wrap">
                            <button className={style.classify__item}>
                              <Image
                                src={classify.ProductImages[0].image_link}
                                alt={product.product_name}
                                className={style["icon-product"]}
                                width={24}
                                height={24}
                              />
                              <span>{classify.option_name}</span>
                            </button>
                          </li>
                        )
                      )}
                  </ul>
                </div>
              )}
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
                  439 sản phẩm trong kho
                </div>
              </div>

              <div className="flex items-center mt-5 gap-5">
                <button className={style.btn__add}>
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
          </div>
        </div>
      </div>
      <Footer />
    </Fragment>
  );
}
