"use client"

import React, { useState } from "react";
import Image from "next/image";
import { Fragment } from "react";
import style from "./product.module.css"
import clsx from "clsx";
import Header from "../(home)/header/Header";
import Link from "next/link";
import productImg from "../../../public/image/product-img.jpg";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faStar } from "@fortawesome/free-solid-svg-icons";
import SliderComponent from "./slider/Slider";
import { faCartPlus } from "@fortawesome/free-solid-svg-icons";
import Footer from "../footer/Footer";
export default function Product() {
    const [mainImage, setMainImage] = useState(productImg);
    const [quantity, setQuantity] = useState(1);

    const increaseQuantity = () => {
        setQuantity(quantity + 1);
    }
    const decreaseQuantity = () => {
        if (quantity > 1) {
            setQuantity(quantity - 1);
        }

    }

    return (
        <Fragment>
            <Header />
            <div className={clsx(style.main)}>
                <div className={clsx(style.container)}>
                    <div className={clsx(style.nav, "flex items-center")}>
                        <ul className={clsx(style.breadcrumb, "flex items-center")}>
                            <li>
                                <Link href={"/"}>Shopee</Link>
                            </li>
                            <li>
                                <Link href={"/"}>Điện thoại và phụ kiện</Link>
                            </li>
                            <li>
                                <Link href={"/"}>Điện thoại</Link>
                            </li>
                            <li>
                                <Link href={"/"}>Apple</Link>
                            </li>
                            <li className={clsx(style.title__product)}>Điện thoại Apple iPhone 15 Pro Max 256GB</li>
                        </ul>
                    </div>
                    <div className="flex justify-between bg-white px-4 py-4">
                        <div className={clsx(style.product__img)}>
                            <Image src={mainImage} alt="product" width={450} height={450} />
                            <div>
                                <SliderComponent onImageHover={setMainImage} />
                            </div>
                        </div>
                        <div className={clsx(style.product__desc)}>
                            <h2 className="mb-2">Điện thoại Apple iPhone 15 Pro Max 256GB</h2>
                            <div className="flex items-center justify-between mb-2">
                                <div className="flex items-center gap-5">
                                    <div className={clsx("flex items-center gap-2 flex-wrap", style.rating)}>
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
                            <div className="flex items-center gap-3 mt-2 py-3 px-1" style={{
                                backgroundColor: "#f5f5f5",
                            }}>
                                <span className={style.price__old}>₫34.999.000</span>
                                <span className={style.price__new}>₫30.990.000</span>
                                <div className={style.sell__product}>
                                    <span>11%</span>
                                    Giảm
                                </div>
                            </div>
                            <div className={clsx("flex mt-5", style.classify__product)}>
                                <h3 className={style.title__item}>Phân loại</h3>
                                <ul style={{
                                    width: "80%",
                                }} className="flex items-center flex-wrap gap-2">
                                    <li className="flex items-center gap-2 flex-wrap">
                                        <button className={style.classify__item}>
                                            <img src="https://down-vn.img.susercontent.com/file/05ed832c5cdc8a7e5c5d64d1622c351e" alt="" className={style["icon-product"]} />
                                            <span>Titan-Tự nhiên</span>
                                        </button>
                                    </li>
                                    <li className="flex items-center gap-2 flex-wrap">
                                        <button className={style.classify__item}>
                                            <img src="https://down-vn.img.susercontent.com/file/2462df708ce571ba2d78c16d5a5bef07" alt="" className={style["icon-product"]} />
                                            <span>Titan-xanh</span>
                                        </button>
                                    </li>
                                    <li className="flex items-center gap-2 flex-wrap">
                                        <button className={style.classify__item}>
                                            <img src="https://down-vn.img.susercontent.com/file/ed1d8c580ba33a5daba69e3bd15a02e7" alt="" className={style["icon-product"]} />
                                            <span>Titan-trắng</span>
                                        </button>
                                    </li>
                                    <li className="flex items-center gap-2 flex-wrap">
                                        <button className={style.classify__item}>
                                            <img src="https://down-vn.img.susercontent.com/file/2cf11f8f0daa620d54a080132c72563d" alt="" className={style["icon-product"]} />
                                            <span>Titan-đen</span>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                            <div className="flex mt-5 items-center">
                                <h3 className={style.title__item}>Số lượng</h3>
                                <div className="flex items-center justify-center mr-4">
                                    <button className={style.btn__quantity} onClick={decreaseQuantity}>-</button>
                                    <input type="text" value={quantity} className={style.quantity} />
                                    <button className={style.btn__quantity} onClick={increaseQuantity}>+</button>
                                </div>

                                <div className={style.quantity__stock}>439 sản phẩm trong kho</div>
                            </div>

                            <div className="flex items-center mt-5 gap-5">
                                <button className={style.btn__add}>
                                    <FontAwesomeIcon icon={faCartPlus} width={20} height={20} className="mr-2" style={{
                                        color: '#D8011B',
                                    }} />
                                    Thêm vào giỏ hàng</button>
                                <button className={style.btn__buy}>Mua ngay</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <Footer />
        </Fragment>

    )
}
