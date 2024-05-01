"use client";

import Image from "next/image";
import Link from "next/link";
import { Fragment, useEffect, useRef, useState } from "react";
import logoImage from "../../../../public/image/logo.png";
import logoShopee from "../../../../public/image/shopee-logo.png";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faGithub } from "@fortawesome/free-brands-svg-icons";
import googleIcon from "../../../../public/image/google-icon1.png";
import { ToastContainer } from "react-toastify";
import { client } from "@/app/helpers/fetch_api/client";
import showToast from "@/app/helpers/Toastify";

import { useRouter } from "next/navigation";
import Footer from "@/app/footer/footer";
import { setToken } from "@/app/actions/settoken.action";
import { hideEmail } from "@/app/helpers/hidden_email";
import Loading from "@/app/Loading/Loading";
export default function Login() {
  const router = useRouter();
  const [toggle, setToggle] = useState(false); // nhấn ra ngoài để tắt form OTP
  const [emailInput, setEmail] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const handleLogin = async (e) => {
    e.preventDefault();
    const formData = new FormData(e.target);
    if (!formData.get("email") || formData.get("password") === "") {
      showToast("error", "Vui lòng điền đầy đủ thông tin");
      return;
    }

    setEmail(formData.get("email"));
    const userData = {
      email: formData.get("email"),
      password: formData.get("password"),
    };
    try {
      setIsLoading(true);
      const response = await client.post("/auth/login", userData);
      if (response.data.status !== 200 && response.data.status !== 202) {
        showToast("error", response.data.message);
        return;
      } else if (response.data.status === 202) {
        setToggle(true);
        showToast("info", response.data.message);
        return;
      }
      // Cookies.set("access_token", response.data.data.accessToken);
      // Cookies.set("refresh_token", response.data.data.refreshToken);
      await setToken(
        response.data.data.accessToken,
        response.data.data.refreshToken
      );
      showToast("success", response.data.message);
      router.push("/");
    } catch (e) {
      console.log(e);
    } finally {
      setIsLoading(false);
    }
  };

  // Tạo một mảng refs để tham chiếu đến các input
  const inputRefs = useRef([]);

  // Hàm ẩn hiện form OTP
  const handleToggle = () => {
    setToggle(!toggle);
  };

  // Hàm verify OTP
  const handleConfirmOTP = async (e) => {
    e.preventDefault();
    const form = new FormData(e.target);

    const data = {
      box_1: form.get("box_1"),
      box_2: form.get("box_2"),
      box_3: form.get("box_3"),
      box_4: form.get("box_4"),
      email: emailInput,
    };
    try {
      setIsLoading(true);
      const response = await client.post("/auth/verify", { data });
      if (response.data.status !== 200) {
        showToast("error", response.data.message);
        return;
      }
      // Cookies.set("access_token", response.data.data.accessToken);
      // Cookies.set("refresh_token", response.data.data.refreshToken);
      await setToken(
        response.data.data.accessToken,
        response.data.data.refreshToken
      );
      showToast("success", response.data.message, () => {
        setIsLoading(true);
        router.push("/");
      });
    } catch (e) {
      console.log(e);
      showToast("error", "Đã có lỗi xảy ra");
    } finally {
      setIsLoading(false);
    }
  };

  // Hàm gửi lại mã OTP
  const handleResendOTP = async (e) => {
    e.preventDefault();
    const data = {
      email: emailInput,
    };
    try {
      setIsLoading(true);
      const response = await client.post("/auth/resend-otp", data);
      if (response.data.status !== 200) {
        showToast("error", response.data.message);
        return;
      }
      showToast("success", response.data.message);
      showToast("info", "Mã OTP có thời hạn 60s");
    } catch (e) {
      console.log(e);
      showToast("error", "Đã có lỗi xảy ra");
    } finally {
      setIsLoading(false);
    }
  };

  const handleKeyDown = (e, index) => {
    if (
      !/^[0-9]{1}$/.test(e.key) &&
      e.key !== "Backspace" &&
      e.key !== "Delete" &&
      e.key !== "Tab" &&
      !e.metaKey
    ) {
      e.preventDefault();
    }

    if (e.key === "Backspace" || e.key === "Delete") {
      if (index > 0) {
        inputRefs.current[index].value = "";
        inputRefs.current[index - 1].focus();
      }
      e.preventDefault();
    }
  };

  const handleInput = (e) => {
    const index = inputRefs.current.indexOf(e.target);
    if (e.target.value) {
      if (index < 4 - 1) {
        inputRefs.current[index + 1].focus();
      }
    }
  };

  const handleFocus = (e) => {
    e.target.select();
  };

  return (
    <Fragment>
      {isLoading && <Loading />}
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
              href="/"
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
              <form
                style={{
                  maxWidth: "400px",
                  left: "900px",
                  padding: "20px 30px",
                  borderRadius: "5px",
                }}
                className="bg-white absolute"
                onSubmit={handleLogin}
              >
                <h2 className="text-2xl text-center">Đăng nhập</h2>
                <div className="mt-3">
                  <input
                    style={{
                      border: "1px solid rgba(0,0,0,.26)",
                    }}
                    type="email"
                    name="email"
                    placeholder="Email đăng nhập..."
                    className="border-gray-500 w-full border-2 p-2 mb-3"
                  />
                  <input
                    style={{
                      border: "1px solid rgba(0,0,0,.26)",
                    }}
                    type="password"
                    name="password"
                    placeholder="Mật khẩu..."
                    className="border-gray-500 w-full border-2 mt-3 p-2 mb-3"
                  />
                  <button
                    type="submit"
                    className="bg-red-500 w-full mt-3 p-2 mb-2 text-white text-xl "
                  >
                    Đăng nhập
                  </button>
                  <div
                    style={{
                      color: "#05a",
                      fontSize: "13px",
                    }}
                    className="flex justify-between cursor-pointer p-1"
                  >
                    <div>Quên mật khẩu?</div>

                    <div>Đăng nhập bằng SMS</div>
                  </div>
                  <div className="flex justify-center gap-8">
                    <button
                      style={{
                        border: "1px solid rgba(0,0,0,.26)",
                        borderRadius: "2px",
                      }}
                      className="w-full mt-3 p-2 mb-2 flex text-lg justify-center items-center gap-2"
                    >
                      <FontAwesomeIcon icon={faGithub} className="w-7 h-7" />
                      <span
                        style={{
                          fontSize: "18px",
                          color: "#000",
                        }}
                      >
                        Github
                      </span>
                    </button>
                    <button
                      style={{
                        border: "1px solid rgba(0,0,0,.26)",
                        borderRadius: "2px",
                      }}
                      className="bg-white w-full mt-3 p-2 mb-2 text-lg flex justify-center items-center gap-2"
                    >
                      <Image
                        src={googleIcon}
                        className="w-7 h-7"
                        alt="icon google"
                      />
                      <span
                        style={{
                          fontSize: "18px",
                          color: "#000",
                        }}
                      >
                        Google
                      </span>
                    </button>
                  </div>

                  <div>
                    <p className="text-center mt-5 pb-5">
                      <span
                        style={{
                          color: "rgba(0,0,0,.26)",
                        }}
                      >
                        Bạn chưa có tài khoản?
                      </span>
                      <Link href="/register" className="text-red-500 ml-3">
                        Đăng ký
                      </Link>
                    </p>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </main>
      <Footer />
      {toggle && (
        <>
          <div
            style={{ zIndex: "500" }}
            className="  max-w-md mx-auto text-center bg-white px-4 sm:px-8 py-10 rounded-xl shadow absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2    h-max"
          >
            <header className="mb-8">
              <h1 className="text-2xl font-bold mb-1">Xác minh tài khoản</h1>
              <p className="text-[15px] text-slate-500 overflow-hidden">
                Vui lòng vào email <span>{hideEmail(emailInput)} </span>để lấy
                mã xác minh
              </p>
            </header>
            <form id="otp-form" onSubmit={handleConfirmOTP}>
              <div className="flex items-center justify-center gap-3">
                {/* <input
                      type="text"
                      className="w-14 h-14 text-center text-2xl font-extrabold text-slate-900 bg-slate-100 border border-transparent hover:border-slate-200 appearance-none rounded p-4 outline-none focus:bg-white focus:border-indigo-400 focus:ring-2 focus:ring-indigo-100"
                      maxLength="1"
                      name="box_1"
                    />
                    <input
                      type="text"
                      className="w-14 h-14 text-center text-2xl font-extrabold text-slate-900 bg-slate-100 border border-transparent hover:border-slate-200 appearance-none rounded p-4 outline-none focus:bg-white focus:border-indigo-400 focus:ring-2 focus:ring-indigo-100"
                      maxLength="1"
                      name="box_2"
                    />
                    <input
                      type="text"
                      className="w-14 h-14 text-center text-2xl font-extrabold text-slate-900 bg-slate-100 border border-transparent hover:border-slate-200 appearance-none rounded p-4 outline-none focus:bg-white focus:border-indigo-400 focus:ring-2 focus:ring-indigo-100"
                      maxLength="1"
                      name="box_3"
                    />
                    <input
                      type="text"
                      className="w-14 h-14 text-center text-2xl font-extrabold text-slate-900 bg-slate-100 border border-transparent hover:border-slate-200 appearance-none rounded p-4 outline-none focus:bg-white focus:border-indigo-400 focus:ring-2 focus:ring-indigo-100"
                      maxLength="1"
                      name="box_4"
                    /> */}
                {[...Array(4)].map((_, index) => (
                  <input
                    key={index}
                    type="text"
                    className="w-14 h-14 text-center text-2xl font-extrabold text-slate-900 bg-slate-100 border border-transparent hover:border-slate-200 appearance-none rounded p-4 outline-none focus:bg-white focus:border-indigo-400 focus:ring-2 focus:ring-indigo-100"
                    maxLength="1"
                    onKeyDown={(e) => handleKeyDown(e, index)}
                    onInput={handleInput}
                    onFocus={handleFocus}
                    ref={(el) => (inputRefs.current[index] = el)}
                    name={`box_${index + 1}`}
                  />
                ))}
              </div>
              <div className="max-w-[260px] mx-auto mt-4">
                <button
                  type="submit"
                  className="w-full inline-flex justify-center whitespace-nowrap rounded-lg bg-indigo-500 px-3.5 py-2.5 text-sm font-medium text-white shadow-sm shadow-indigo-950/10 hover:bg-indigo-600 focus:outline-none focus:ring focus:ring-indigo-300 focus-visible:outline-none focus-visible:ring focus-visible:ring-indigo-300 transition-colors duration-150"
                >
                  Xác nhận
                </button>
              </div>
            </form>
            <div className="text-sm text-slate-500 mt-4">
              Chưa nhận được mã?{" "}
              <button
                onClick={handleResendOTP}
                className="font-medium text-indigo-500 hover:text-indigo-600"
              >
                Gửi lại mã
              </button>
            </div>
          </div>
          <div
            onClick={handleToggle}
            className="bg-gray-400 opacity-80 w-screen h-screen fixed inset-0"
          ></div>
        </>
      )}
      <ToastContainer />
    </Fragment>
  );
}
