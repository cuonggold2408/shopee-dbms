"use client";

import Image from "next/image";
import Link from "next/link";
import { Fragment, useState } from "react";
import logoImage from "../../../../public/image/logo.png";
import logoShopee from "../../../../public/image/shopee-logo.png";
import { client } from "@/app/helpers/fetch_api/client";
import { useRouter } from "next/navigation";
import { ToastContainer } from "react-toastify";
import showToast from "../../../app/helpers/Toastify";
import { emailRegex } from "@/app/helpers/matchEmail";
// import Footer from "@/app/footer/page";

export default function Register() {
  const [isLoading, setLoading] = useState(false);
  const [form, setForm] = useState({
    username: "",
    phone_number: "",
    email: "",
    password: "",
    confirm_password: "",
  });
  const router = useRouter();
  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
  };
  const handleRegister = async (e) => {
    e.preventDefault();
    const formData = new FormData(e.target);
    console.log(emailRegex(formData.get("email")));
    if (
      !formData.get("username") ||
      !formData.get("phone_number") ||
      !formData.get("email") ||
      formData.get("password") === "" ||
      formData.get("confirm_password") === ""
    ) {
      showToast("error", "Vui lòng điền đầy đủ thông tin");
      return;
    }
    if (formData.get("password") !== formData.get("confirm_password")) {
      showToast("error", "Mật khẩu không trùng khớp");
      return;
    }
    if (formData.get("password").trim().length < 8) {
      showToast("error", "Mật khẩu phải có ít nhất 8 ký tự");
      return;
    }
    if (!emailRegex(formData.get("email"))) {
      showToast("error", "Email không hợp lệ");
      return;
    }

    const userData = {
      username: formData.get("username"),
      phone_number: formData.get("phone_number"),
      email: formData.get("email"),
      password: formData.get("password"),
    };

    console.log(userData);
    try {
      setLoading(true);
      const response = await client.post("/auth/register", userData);
      if (response.data.status === 201) {
        setLoading(false);
        showToast("success", "Đăng ký thành công");
        setForm({
          username: "",
          phone_number: "",
          email: "",
          password: "",
          confirm_password: "",
        });
      }
    } catch (e) {
      console.log(e);
    } finally {
      setLoading(false);
    }
  };
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
              <form
                style={{
                  maxWidth: "400px",
                  left: "900px",
                  padding: "20px 30px",
                  borderRadius: "5px",
                }}
                className="bg-white absolute"
                onSubmit={handleRegister}
              >
                <h2 className="text-2xl text-center">Đăng ký</h2>
                <div className="mt-3">
                  <div
                    style={{
                      fontSize: "14px",
                    }}
                  >
                    <div
                      style={{
                        display: "flex",
                        justifyContent: "space-between",
                        gap: "10px",
                      }}
                    >
                      <input
                        style={{
                          border: "1px solid rgba(0,0,0,.26)",
                          width: "60%",
                        }}
                        type="text"
                        placeholder="Username..."
                        value={form.username}
                        onChange={handleInputChange}
                        name="username"
                        className="border-gray-500 border-2 mt-3 p-2 mb-3"
                      />
                      <input
                        style={{
                          border: "1px solid rgba(0,0,0,.26)",
                          width: "40%",
                        }}
                        type="text"
                        value={form.phone_number}
                        onChange={handleInputChange}
                        placeholder="Số điện thoại..."
                        name="phone_number"
                        className="border-gray-500 border-2 mt-3 p-2 mb-3"
                      />
                    </div>
                    <input
                      style={{ border: "1px solid rgba(0,0,0,.26)" }}
                      type="email"
                      placeholder="Email..."
                      value={form.email}
                      onChange={handleInputChange}
                      name="email"
                      className="border-gray-500 w-full border-2 mt-3 p-2 mb-3"
                    />
                    <input
                      style={{ border: "1px solid rgba(0,0,0,.26)" }}
                      type="password"
                      name="password"
                      value={form.password}
                      onChange={handleInputChange}
                      placeholder="Mật khẩu..."
                      className="border-gray-500 w-full border-2 mt-3 p-2 mb-3"
                    />
                    <input
                      style={{ border: "1px solid rgba(0,0,0,.26)" }}
                      type="password"
                      value={form.confirm_password}
                      onChange={handleInputChange}
                      name="confirm_password"
                      placeholder="Xác nhận mật khẩu..."
                      className="border-gray-500 w-full border-2 mt-3 p-2 mb-3"
                    />
                  </div>
                  <button
                    type="submit"
                    className="bg-red-500 w-full mt-3 p-2 mb-2 text-white text-xl"
                  >
                    Đăng ký
                  </button>

                  <div
                    style={{
                      color: "#05a",
                      fontSize: "13px",
                    }}
                    className="flex justify-between cursor-pointer p-1"
                  >
                    <Link href="/login">Đã có tài khoản?</Link>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </main>
      {/* <Footer /> */}
      <ToastContainer />

    </Fragment>
  );
}