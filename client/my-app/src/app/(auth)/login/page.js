import Image from "next/image";
import Link from "next/link";
import { Fragment } from "react";
import logoImage from "../../../../public/image/logo.png";
import logoShopee from "../../../../public/image/shopee-logo.png";

export const metadata = {
  title: "Login",
  description: "Trang đăng nhập",
};

export default function Login() {
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
              href="/login"
              style={{ width: "123px", height: "30px" }}
              className="inline-block"
            >
              <Image src={logoImage} alt="logo shopee" />
            </Link>
            <h1 className="text-2xl text-center">Đăng nhập</h1>
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
                  top: "200px",
                  padding: "20px",
                }}
                className="bg-white absolute"
              >
                <h2 className="text-2xl text-center">Đăng nhập</h2>
                <div className="mt-3">
                  <input
                    type="text"
                    placeholder="Tên đăng nhập..."
                    className="border-gray-500 w-full border-2 p-2"
                  />
                  <input
                    type="password"
                    placeholder="Mật khẩu..."
                    className="border-gray-500 w-full border-2 mt-3 p-2"
                  />
                  <button className="bg-red-500 w-full mt-3 p-3 text-white text-xl ">
                    Đăng nhập
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </Fragment>
  );
}
