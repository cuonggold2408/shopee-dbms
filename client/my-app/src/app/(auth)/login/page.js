import Image from "next/image";
import Link from "next/link";
import { Fragment } from "react";
import logoImage from "../../../../public/image/logo.png";
import logoShopee from "../../../../public/image/shopee-logo.png";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faGithub } from '@fortawesome/free-brands-svg-icons'
import googleIcon from "../../../../public/image/google-icon1.png";
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
                  padding: "20px 30px",
                  borderRadius: "5px",
                }}
                className="bg-white absolute"
              >
                <h2 className="text-2xl text-center">Đăng nhập</h2>
                <div className="mt-3">
                  <input
                    style={
                      {
                        border: "1px solid rgba(0,0,0,.26)",
                      }
                    }
                    type="text"
                    placeholder="Tên đăng nhập..."
                    className="border-gray-500 w-full border-2 p-2 mb-3"
                  />
                  <input
                    style={
                      {
                        border: "1px solid rgba(0,0,0,.26)",
                      }
                    }
                    type="password"
                    placeholder="Mật khẩu..."
                    className="border-gray-500 w-full border-2 mt-3 p-2 mb-3"
                  />
                  <button className="bg-red-500 w-full mt-3 p-2 mb-2 text-white text-xl ">
                    Đăng nhập
                  </button>
                  <div
                    style={
                      {
                        color: "#05a",
                        fontSize: '13px'

                      }
                    }
                    className="flex justify-between cursor-pointer p-1">

                    <div>
                      Quên mật khẩu?
                    </div>

                    <div>
                      Đăng nhập bằng SMS
                    </div>

                  </div>
                  <div className="flex justify-center gap-8">
                    <button
                      style={
                        {
                          border: "1px solid rgba(0,0,0,.26)",
                          borderRadius: "2px",

                        }
                      }
                      className="w-full mt-3 p-2 mb-2 flex text-lg justify-center items-center gap-2">
                      <FontAwesomeIcon icon={faGithub} className="w-7 h-7" />
                      <span
                        style={
                          {
                            fontSize: '18px',
                            color: "#000",
                          }
                        }>
                        Github</span>
                    </button>
                    <button
                      style={
                        {
                          border: "1px solid rgba(0,0,0,.26)",
                          borderRadius: "2px",
                        }
                      }
                      className="bg-white w-full mt-3 p-2 mb-2 text-lg flex justify-center items-center gap-2">
                      <Image src={googleIcon} className="w-7 h-7 " />
                      <span
                        style={
                          {
                            fontSize: '18px',
                            color: "#000",
                          }
                        }
                      >Google</span>
                    </button>

                  </div>

                  <div>
                    <p className="text-center mt-5 pb-5">
                      <span
                        style={{
                          color: "rgba(0,0,0,.26)",
                        }}
                      >Bạn chưa có tài khoản?</span>
                      <Link href="/register" className="text-red-500 ml-3">
                        Đăng ký
                      </Link>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </Fragment >
  );
}
