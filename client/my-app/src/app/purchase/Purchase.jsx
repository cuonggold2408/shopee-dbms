import React from "react";
import { Fragment } from "react";
import clsx from "clsx";
import style from "./purchase.module.css";
import Image from "next/image";
import Header from "../(home)/header/Header";
import CarRepairIcon from '@mui/icons-material/CarRepair';
import Shirt from "../../../public/image/product.jpg";
import Footer from "../footer/Footer";
export default function Categories() {
    return (
        <Fragment>
            <Header />
            <div className={style.main}>
                <div className={clsx(style.container, "px-3")}>

                    <div className={clsx(style.product__purchase, 'flex flex-col my-2 p-4 mb-4 bg-white')}>

                        <div style={
                            {
                                borderBottom: "1px solid #ccc",
                                paddingBottom: "10px",
                                marginBottom: "10px"
                            }
                        }
                            className="flex items-center justify-between gap-1 mb-1">
                            <button className={style.cmt}>Bình luận</button>
                            <div className="flex items-center justify-center gap-2">
                                <div className={style.status__purchase}>
                                    <CarRepairIcon style={{ fontSize: 30 }} />
                                    <span>Đơn hàng đã được giao thành công</span>
                                </div>
                                <div className={style.total__price}>Vân chuyển</div>
                            </div>
                        </div>
                        <div className={clsx(style.list__product, 'flex items-center justify-between py-3 mt-2')}>
                            <div className={clsx(style.product__desc, 'flex items-center justify-center gap-2')}>
                                <Image src={Shirt} alt="product" width={80} height={80} />
                                <div className="flex flex-col gap-1">
                                    <h2>Dây sạc chính hãng Baseus Cáp bọc dù dùng cho xsmax x xr 14 13 12 11 6 7 8 ...</h2>
                                    <div>Phân loại hàng:
                                        <span>Dây Bọc dù, 1M</span>
                                    </div>
                                    <div className={style.quantty}>
                                        x
                                        <span>1</span>
                                    </div>
                                </div>
                            </div>
                            <div className={style.total__price}>₫
                                <span>49.000</span>
                            </div>
                        </div>
                    </div>

                    <div className={clsx(style.product__purchase, 'flex flex-col my-2 p-4 mb-4 bg-white')}>

                        <div style={
                            {
                                borderBottom: "1px solid #ccc",
                                paddingBottom: "10px",
                                marginBottom: "10px"
                            }
                        }
                            className="flex items-center justify-between gap-1 mb-1">
                            <div className={style.cmt}>Bình luận</div>
                            <div className="flex items-center justify-center gap-2">
                                <div className={style.status__purchase}>
                                    <CarRepairIcon style={{ fontSize: 30 }} />
                                    <span>Đơn hàng đã được giao thành công</span>
                                </div>
                                <div className={style.total__price}>Vân chuyển</div>
                            </div>
                        </div>
                        <div className={clsx(style.list__product, 'flex items-center justify-between py-3 mt-2')}>
                            <div className={clsx(style.product__desc, 'flex items-center justify-center gap-2')}>
                                <Image src={Shirt} alt="product" width={80} height={80} />
                                <div className="flex flex-col gap-1">
                                    <h2>Dây sạc chính hãng Baseus Cáp bọc dù dùng cho xsmax x xr 14 13 12 11 6 7 8 ...</h2>
                                    <div>Phân loại hàng:
                                        <span>Dây Bọc dù, 1M</span>
                                    </div>
                                    <div className={style.quantty}>
                                        x
                                        <span>1</span>
                                    </div>
                                </div>
                            </div>
                            <div className={style.total__price}>₫
                                <span>49.000</span>
                            </div>
                        </div>
                    </div>

                    <div className={clsx(style.product__purchase, 'flex flex-col my-2 p-4 mb-4 bg-white')}>

                        <div style={
                            {
                                borderBottom: "1px solid #ccc",
                                paddingBottom: "10px",
                                marginBottom: "10px"
                            }
                        }
                            className="flex items-center justify-between gap-1 mb-1">
                            <div className={style.cmt}>Bình luận</div>
                            <div className="flex items-center justify-center gap-2">
                                <div className={style.status__purchase}>
                                    <CarRepairIcon style={{ fontSize: 30 }} />
                                    <span>Đơn hàng đã được giao thành công</span>
                                </div>
                                <div className={style.total__price}>Vân chuyển</div>
                            </div>
                        </div>
                        <div className={clsx(style.list__product, 'flex items-center justify-between py-3 mt-2 ')}>
                            <div className={clsx(style.product__desc, 'flex items-center justify-center gap-2')}>
                                <Image src={Shirt} alt="product" width={80} height={80} />
                                <div className="flex flex-col gap-1">
                                    <h2>Dây sạc chính hãng Baseus Cáp bọc dù dùng cho xsmax x xr 14 13 12 11 6 7 8 ...</h2>
                                    <div>Phân loại hàng:
                                        <span>Dây Bọc dù, 1M</span>
                                    </div>
                                    <div className={style.quantty}>
                                        x
                                        <span>1</span>
                                    </div>
                                </div>
                            </div>
                            <div className={style.total__price}>₫
                                <span>49.000</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <Footer />
        </Fragment>
    )
}