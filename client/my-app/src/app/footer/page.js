import Image from "next/image";
import Link from "next/link";
import { Fragment } from "react";
import Visa from "../../../public/image/payment/img01.png";
import ShoppeePay from "../../../public/image/payment/img07.png";
import SPayLater from "../../../public/image/payment/img08.png";
import JCBPay from "../../../public/image/payment/img03.png";
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
                    className="container">
                    <div className="flex gap-10 justify-between">
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
                            <h2
                                style={{
                                    color: "#000",
                                    fontSize: "14px",
                                    fontWeight: "600",
                                    marginBottom: "10px",
                                    textTransform: "uppercase",
                                }}
                            >Về shopee</h2>
                            <div>Trung tâm trợ giúp</div>
                            <div>Shopee Blog</div>
                            <div>Shopee Mall</div>
                            <div>Hướng dẫn mua hàng</div>
                            <div>Hướng dẫn bán hàng</div>
                            <div>Thanh toán</div>
                            <div>Shopee Xu</div>
                            <div>Vận chuyển</div>
                            <div>Trả hàng & Hoàn tiền</div>
                            <div>Chăm sóc khách hàng</div>
                            <div>Chính sách bảo hành</div>
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
                            <h2
                                style={{
                                    fontSize: "14px",
                                    color: "#000",
                                    fontWeight: "600",
                                    marginBottom: "10px",
                                    textTransform: "uppercase",
                                }}
                            >Thông tin về chúng tôi</h2>
                            <div>Giới thiệu</div>
                            <div>Tuyển dụng</div>
                            <div>Điều khoản Shopee</div>
                            <div>Chính sách bảo mật</div>
                            <div>Chính sách bán hàng</div>
                            <div>Trung tâm trợ giúp</div>
                            <div>Liên hệ với chúng tôi</div>
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
                            <h2
                                style={{
                                    fontSize: "14px",
                                    color: "#000",
                                    fontWeight: "600",
                                    marginBottom: "10px",
                                    textTransform: "uppercase",
                                }}
                            >Thanh toán</h2>
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
                                    <Image src={Visa} alt="visa" />
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
                                    <Image src={Visa} alt="visa" />
                                </div>
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
                                    <Image src={Visa} alt="visa" />
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
                            <h2
                                style={{
                                    fontSize: "14px",
                                    color: "#000",
                                    fontWeight: "600",
                                    marginBottom: "10px",
                                    textTransform: "uppercase",
                                }}
                            >Theo dõi chúng tôi</h2>
                            <div>Facebook</div>
                            <div>Instagram</div>
                            <div>Twitter</div>
                            <div>LinkedIn</div>
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
                            <h2
                                style={{
                                    fontSize: "14px",
                                    color: "#000",
                                    fontWeight: "600",
                                    marginBottom: "10px",
                                    textTransform: "uppercase",
                                }}
                            >Tải ứng dụng Shopee ngay thôi nào</h2>
                            <div>Google Play</div>
                            <div>App Store</div>
                        </div>

                    </div>
                </div>
            </footer>
        </Fragment >
    );
}
