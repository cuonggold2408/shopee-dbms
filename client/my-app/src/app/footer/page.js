import Image from "next/image";
import Link from "next/link";
import { Fragment } from "react";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faFacebook } from '@fortawesome/free-brands-svg-icons'
import { faInstagram } from "@fortawesome/free-brands-svg-icons";
import { faLinkedin } from "@fortawesome/free-brands-svg-icons";
import Visa from "../../../public/image/payment/img01.png";
import Pay2 from "../../../public/image/payment/img02.png";
import Pay4 from "../../../public/image/payment/img04.png";
import Pay5 from "../../../public/image/payment/img05.png";
import Pay6 from "../../../public/image/payment/img06.png";
import ShoppeePay from "../../../public/image/payment/img07.png";
import SPayLater from "../../../public/image/payment/img08.png";
import JCBPay from "../../../public/image/payment/img03.png";
import QRIcon from "../../../public/image/qr-icon.png";
import style from "../../../public/css/styles.module.css";
import clsx from "clsx";
import FooterImg1 from "../../../public/image/footer01.png";
import FooterImg2 from "../../../public/image/footer02.png";
export const metadata = {
    title: "Footer",
    description: "Footer",
};


export default function Footer() {
    return (
        <Fragment>
            <footer style={{
                background: "#f5f5f5",
            }}>
                <div
                    style={
                        {
                            // backgroundColor: "#f5f5f5",
                            padding: "50px 0",
                            fontSize: "14px",
                            width: "80vw",
                            color: "rgba(0,0,0,.65)",
                            margin: "0 auto"
                        }
                    }
                >
                    <div className="flex gap-10 justify-between">
                        <div className={clsx(style.boxItem, "flex", "flex-col")}>
                            <h2 className={clsx(style.title)}>Về shopee</h2>
                            <ul>
                                <li>Trung tâm trợ giúp</li>
                                <li>Shopee Blog</li>
                                <li>Shopee Mall</li>
                                <li>Hướng dẫn mua hàng</li>
                                <li>Hướng dẫn bán hàng</li>
                                <li>Thanh toán</li>
                                <li>Shopee Xu</li>
                                <li>Vận chuyển</li>
                                <li>Trả hàng & Hoàn tiền</li>
                                <li>Chăm sóc khách hàng</li>
                                <li>Chính sách bảo hành</li>
                            </ul>
                        </div>

                        <div className={clsx(style.boxItem, 'flex', 'flex-col')}>
                            <h2 className={clsx(style.title)} >Thông tin về chúng tôi</h2>
                            <ul>
                                <li>Giới thiệu</li>
                                <li>Tuyển dụng</li>
                                <li>Điều khoản Shopee</li>
                                <li>Chính sách bảo mật</li>
                                <li>Chính sách bán hàng</li>
                                <li>Trung tâm trợ giúp</li>
                                <li>Liên hệ với chúng tôi</li>
                            </ul>
                        </div>
                        <div className={clsx(style['box-item'], "flex", "flex-col")}>
                            <h2 className={clsx(style.title)} >Thanh toán</h2>
                            <div className="flex flex-wrap gap-3">
                                <div className={clsx('p-1', 'bg-white')}>
                                    <Image src={Visa} alt="visa" />
                                </div>
                                <div className={clsx('p-1', 'bg-white')}>
                                    <Image src={Pay2} alt="visa" />
                                </div>
                                <div className={clsx('p-1', 'bg-white')}>
                                    <Image src={JCBPay} alt="visa" />
                                </div>
                                <div className={clsx('p-1', 'bg-white')}>
                                    <Image src={Pay4} alt="visa" />
                                </div>
                                <div className={clsx('p-1', 'bg-white')}>
                                    <Image src={Pay5} alt="visa" />
                                </div>
                                <div className={clsx('p-1', 'bg-white')}>
                                    <Image src={Pay6} alt="visa" />
                                </div>
                                <div className={clsx('p-1', 'bg-white')}>
                                    <Image src={ShoppeePay} alt="visa" />
                                </div>
                                <div className={clsx('p-1', 'bg-white')}>
                                    <Image src={SPayLater} alt="visa" />
                                </div>

                            </div>
                            <h2 className={clsx(style.title)} >Đơn vị vân chuyển</h2>
                            <div className="flex flex-wrap gap-3">
                                <div
                                    style={{
                                        overflow: "hidden",
                                        padding: "5px",
                                    }}
                                    className="bg-white">
                                    <Image src={Visa} alt="visa" />
                                </div>
                                <div
                                    style={{
                                        overflow: "hidden",
                                        padding: "5px",
                                    }}
                                    className="bg-white">
                                    <Image src={Pay2} alt="visa" />
                                </div>
                                <div
                                    style={{
                                        overflow: "hidden",
                                        padding: "5px",
                                    }}
                                    className="bg-white">
                                    <Image src={JCBPay} alt="visa" />
                                </div>
                                <div
                                    style={{
                                        overflow: "hidden",
                                        padding: "5px",
                                    }}
                                    className="bg-white">
                                    <Image src={Pay4} alt="visa" />
                                </div>
                                <div
                                    style={{
                                        overflow: "hidden",
                                        padding: "5px",
                                    }}
                                    className="bg-white">
                                    <Image src={Pay5} alt="visa" />
                                </div>
                                <div
                                    style={{
                                        overflow: "hidden",
                                        padding: "5px",
                                    }}
                                    className="bg-white">
                                    <Image src={Pay6} alt="visa" />
                                </div>
                                <div
                                    style={{
                                        overflow: "hidden",
                                        padding: "5px",
                                    }}
                                    className="bg-white">
                                    <Image src={ShoppeePay} alt="visa" />
                                </div>
                                <div
                                    style={{
                                        overflow: "hidden",
                                        padding: "5px",
                                    }}
                                    className="bg-white">
                                    <Image src={SPayLater} alt="visa" />
                                </div>


                            </div>
                        </div>

                        <div className={clsx("flex", "flex-col", "box-item")}>
                            <h2 className={clsx(style.title)} >Theo dõi chúng tôi</h2>
                            <div className="flex items-center mb-1">
                                <FontAwesomeIcon width="20px" icon={faFacebook} className="mr-1" />
                                <span>Facebook</span>
                            </div>
                            <div className="flex items-center mt-1">
                                <FontAwesomeIcon width="20px" icon={faInstagram} className="mr-1" />
                                <span>Instagram</span>
                            </div>

                            <div className="flex items-center mt-1">
                                <FontAwesomeIcon width="20px" icon={faLinkedin} className="mr-1" />
                                <span>LinkedIn</span>
                            </div>
                        </div>

                        <div
                            style={
                                {

                                    width: "20%",
                                    color: "rgba(0,0,0,.65)",
                                    overflow: "hidden",
                                    fontSize: "14px",
                                }
                            }
                            className="flex flex-col">
                            <h2 className={clsx(style.title)} >Tải ứng dụng Shopee ngay thôi nào</h2>
                            <Image src={QRIcon} alt="visa" />
                        </div>

                    </div>
                    <div
                        style={{
                            borderTop: "1px solid rgba(0,0,0,.26)",
                        }}
                        className="flex justify-between mt-7 pt-7 pb-7 ">
                        <div style={{
                            width: "33%",
                        }}>
                            <p style={{
                                fontSize: "14px",
                                color: "rgba(0,0,0,.65)",
                            }}>© 2024 Shopee. Tất cả các quyền được bảo lưu.</p>
                        </div>
                        <div
                            style={{
                                width: "67%",
                                display: "flex",
                            }}>
                            <span>Quốc gia và khu vực:</span>
                            <ul className="flex justify-between">
                                <li className={clsx(style['text-footer'], style['country-item'])}>Singapore</li>
                                <li className={clsx(style['text-footer'], style['country-item'])}>Indonesia</li>
                                <li className={clsx(style['text-footer'], style['country-item'])}>Thái Lan</li>
                                <li className={clsx(style['text-footer'], style['country-item'])}>Malaysia</li>
                                <li className={clsx(style['text-footer'], style['country-item'])}>Việt Nam</li>
                                <li className={clsx(style['text-footer'], style['country-item'])}>Phillipines</li>
                                <li className={clsx(style['text-footer'], style['country-item'])}>Brazil</li>
                                <li className={clsx(style['text-footer'], style['country-item'])}>Mexico</li>
                                <li className={clsx(style['text-footer'], style['country-item'])}>Colombia</li>
                                <li className={clsx(style['text-footer'], style['country-item'])}>Chile</li>
                                <li className={clsx(style['text-footer'], style['country-item'])}>Đài Loan</li>

                            </ul>
                        </div>
                    </div>

                    <div
                        style={{
                            width: "80%",
                            margin: "0 auto",
                        }}>
                        <ul className="flex justify-center items-center">
                            <li className={clsx('p-3', style['security-item'])}>Chính sách bảo mật</li>
                            <li className={clsx('p-3', style['security-item'])}>Quy chế hoạt động</li>
                            <li className={clsx('p-3', style['security-item'])}>Chính sách vận hành</li>
                            <li className={clsx('p-3', style['security-item'])}>Chính sách trả hàng và hoàn tiền</li>
                        </ul>
                    </div>
                    <div
                        style={
                            {
                                width: "20%",
                                margin: "20px auto",
                            }
                        }
                        className="flex justify-center">
                        <Image className={clsx(style['img-item'])} src={FooterImg1} alt="footer" />
                        <Image className={clsx(style['img-item'])} src={FooterImg1} alt="footer" />
                        <Image className={clsx(style['img-item'])} src={FooterImg2} alt="footer" />
                    </div>
                </div>

            </footer>
        </Fragment >
    );
}
