import React from "react";
import { Fragment } from "react";
import Footer from "../footer/Footer";
import style from "./checkout.module.css";
import clsx from "clsx";
import Header from "../(home)/header/Header";
import LocationOnIcon from '@mui/icons-material/LocationOn';
import Image from "next/image";
import TestImg from "../../../public/image/product-img.jpg";

export default function Checkout() {
    return (
        <Fragment>
            <Header />
            <div className={style.main}>
                <div className={style.container}>
                    <div className="">
                        <div style={{
                            backgroundImage: "repeating-linear-gradient(45deg, #6fa6d6, #6fa6d6 33px, transparent 0, transparent 41px, #f18d9b 0, #f18d9b 74px, transparent 0, transparent 82px)",
                            backgroundPositionX: "-30px",
                            backgroundSize: "116px 3px",
                            height: "3px",
                            width: "100%"
                        }}></div>
                        <div className={clsx("flex flex-col p-7 gap-2 bg-white", style.address)} >
                            <div className="flex items-center gap-1" style={{
                                color: "#ee4d2d",
                                fontSize: "20px",
                                textTransform: "capitalize",
                            }}>
                                <LocationOnIcon className="text-2xl" />
                                <h2>Địa chỉ nhận hàng</h2>
                            </div>
                            <div className={clsx("flex items-center gap-2", style.info__user)}>
                                <div className={clsx(style.name__user)}>
                                    Bách Nguyễn
                                    <span>(+84) 325453480</span>
                                </div>
                                <div className={clsx(style.address__user)}>
                                    2c Ngách 15 Ngõ 20 Hồ Tùng Mậu, Phường Mai Dịch, Quận Cầu Giấy, Hà Nội
                                </div>
                                <button className={style.btn__change}>Thay đổi</button>
                            </div>
                        </div>
                    </div>

                    <div className={clsx('mt-3 bg-white p-7', style.list__product)}>
                        <div className={clsx("flex items-center justify-center gap-2", style.title__option)}>
                            <div className={style.product__item} style={{
                                fontSize: "20px",
                            }}>Sản phẩm</div>
                            <div style={{
                                flex: 2,

                            }}></div>
                            <div className={style.price__one}>Đơn giá</div>
                            <div className={style.quantity}>Số lượng</div>
                            <div className={style.price__total}>Thành tiền</div>
                        </div>
                        <div style={{
                            borderBottom: "1px dotted #e0e0e0",
                        }} className="flex items-center gap-2 pb-5 pt-5">
                            <div className={clsx("flex items-center justify-start", style.product__item)}>
                                <div className={style.product__img}>
                                    <Image src={TestImg} alt="product" width={50} height={50} />
                                </div>
                                <span className={style.product__name}>Sách - Kanji Masuta N4 - Chinh Phục Hán Tự JLPT N4 Bản Dịch Tiếng Việt
                                </span>

                            </div>
                            <div style={{
                                flex: 2,
                                color: "#9b9b9b"
                            }}>Loại: Trắng + Xám,Thùng 200 cái
                            </div>
                            <div className={style.price__one}>200.000đ</div>
                            <div className={style.quantity}>1</div>
                            <div className={style.price__total}>200.000đ</div>
                        </div>

                        <div style={{
                            borderBottom: "1px dotted #e0e0e0",
                        }} className="flex items-center gap-2 pb-5 pt-5">
                            <div className={clsx("flex items-center justify-start", style.product__item)}>
                                <div className={style.product__img}>
                                    <Image src={TestImg} alt="product" width={50} height={50} />
                                </div>
                                <span className={style.product__name}>Sách - Kanji Masuta N4 - Chinh Phục Hán Tự JLPT N4 Bản Dịch Tiếng Việt
                                </span>

                            </div>
                            <div style={{
                                flex: 2,
                                color: "#9b9b9b"
                            }}>Loại: Trắng + Xám,Thùng 200 cái
                            </div>
                            <div className={style.price__one}>200.000đ</div>
                            <div className={style.quantity}>1</div>
                            <div className={style.price__total}>200.000đ</div>
                        </div>

                        <div style={{
                            borderBottom: "1px dotted #e0e0e0",
                        }} className="flex items-center gap-2 pb-5 pt-5">
                            <div className={clsx("flex items-center justify-start", style.product__item)}>
                                <div className={style.product__img}>
                                    <Image src={TestImg} alt="product" width={50} height={50} />
                                </div>
                                <span className={style.product__name}>Sách - Kanji Masuta N4 - Chinh Phục Hán Tự JLPT N4 Bản Dịch Tiếng Việt
                                </span>

                            </div>
                            <div style={{
                                flex: 2,
                                color: "#9b9b9b"
                            }}>Loại: Trắng + Xám,Thùng 200 cái
                            </div>
                            <div className={style.price__one}>200.000đ</div>
                            <div className={style.quantity}>1</div>
                            <div className={style.price__total}>200.000đ</div>
                        </div>
                    </div>

                    <div className={style.payment}>
                        <div className={clsx("flex items-center", style["text-coin-1"])}>Tổng tiền hàng</div>
                        <div className={clsx("flex items-center", style.bwwaGp)}>đ27.700.000</div>
                        <div div className={clsx("flex items-center", style["text-coin-1"])} > Phí vật chuyển</div>
                        <div className={clsx("flex items-center", style.vourcher__ship)} >₫0</div>
                        <div className={clsx("flex items-center", style["text-coin-1"], style["total-coins"])}> Tổng thanh toán</div>
                        <div className={clsx("flex items-center", style["payment__item-total"])} >₫27.700.000</div>
                    </div >

                    <div className={style["select-product"]}>
                        <div style={{
                            fontSize: '15px',
                        }}>Nhấn "Đặt hàng" đồng nghĩa với việc bạn đồng ý tuân theo
                            <span style={{ textDecoration: 'none', color: "#0055AD" }} className="ml-1" >Điều khoản Shopee</span>
                        </div>
                        <button className={clsx(style["select__product-item"])}>Đặt hàng</button>
                    </div>

                </div >
            </div >
            <Footer />
        </Fragment >
    )
}
