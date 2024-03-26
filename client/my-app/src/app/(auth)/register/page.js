
import Image from "next/image";
import Link from "next/link";
import { Fragment } from "react";
import logoImage from "../../../../public/image/logo.png";
import logoShopee from "../../../../public/image/shopee-logo.png";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faGithub } from '@fortawesome/free-brands-svg-icons'
import googleIcon from "../../../../public/image/google-icon1.png";
import Footer from "../../footer/page";
<<<<<<< HEAD
=======

import Register from "./Register";

>>>>>>> 274ecbd7cd44dfc3f64d9407f49b58ad4fe876f2

export const metadata = {
  title: "Register",
  description: "Trang đăng ký",
};


export default function Register() {
    return (
        <Fragment>
            <header>
                <div
                    style={{ width: "1200px" }}
                    className="flex justify-between items-baseline m-auto mt-5"
                >
                    <div
                        style={{ maxWidth: "300px" }}
                        className="flex  items-baseline gap-3"
                    >
                        <Link
                            href="/register"
                            style={{ width: "123px", height: "30px" }}
                            className="inline-block"
                        >
                            <Image src={logoImage} alt="logo shopee" />
                        </Link>
                        <h1 className="text-2xl text-center">Đăng ký</h1>
                    </div>
                    <div>
                        <Link href="/login" className="text-red-600 text-xl">
                            Bạn cần giúp đỡ?
                        </Link>
                    </div>
                </div>
            </header>
            <main>
                <div
                    className=" w-full mt-5"
                    style={{ height: "600px", backgroundColor: "rgb(238, 77, 45)" }}
                >
                    <div>
                        <div className="flex justify-center items-center">
                            <Image src={logoShopee} alt="shopee logo" className="relative" />
                            <div
                                style={{
                                    maxWidth: "400px",
                                    left: "900px",
                                    padding: "20px 30px",
                                    borderRadius: "5px",
                                }}
                                className="bg-white absolute"
                            >
                                <h2 className="text-2xl text-center">Đăng ký</h2>
                                <div className="mt-3">
                                    <div
                                        style={
                                            {
                                                fontSize: '14px'
                                            }
                                        }>
                                        <div style={{
                                            display: 'flex', justifyContent: 'space-between',
                                            gap: "10px",

                                        }}>

                                            <input
                                                style={{ border: "1px solid rgba(0,0,0,.26)", width: '60%' }}
                                                type="text"
                                                placeholder="Username..."
                                                className="border-gray-500 border-2 mt-3 p-2 mb-3"
                                            />
                                            <input
                                                style={{ border: "1px solid rgba(0,0,0,.26)", width: '40%' }}
                                                type="text"
                                                placeholder="Số điện thoại..."
                                                className="border-gray-500 border-2 mt-3 p-2 mb-3"
                                            />
                                        </div>
                                        <input
                                            style={{ border: "1px solid rgba(0,0,0,.26)" }}
                                            type="email"
                                            placeholder="Email..."
                                            className="border-gray-500 w-full border-2 mt-3 p-2 mb-3"
                                        />
                                        <input
                                            style={{ border: "1px solid rgba(0,0,0,.26)" }}
                                            type="password"
                                            placeholder="Mật khẩu..."
                                            className="border-gray-500 w-full border-2 mt-3 p-2 mb-3"
                                        />
                                        <input
                                            style={{ border: "1px solid rgba(0,0,0,.26)" }}
                                            type="password"
                                            placeholder="Xác nhận mật khẩu..."
                                            className="border-gray-500 w-full border-2 mt-3 p-2 mb-3"
                                        />
                                    </div>
                                    <button className="bg-red-500 w-full mt-3 p-2 mb-2 text-white text-xl ">
                                        Đăng ký
                                    </button>

                                    <div
                                        style={
                                            {
                                                color: "#05a",
                                                fontSize: '13px'
                                            }
                                        }
                                        className="flex justify-between cursor-pointer p-1">
                                        <Link href="/login">
                                            Đã có tài khoản?
                                        </Link>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <Footer />
        </Fragment >
    );
}       
export default function RegisterPage() {
  return <Register />;
}

