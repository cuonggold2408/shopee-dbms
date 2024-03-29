"use client";

import Cookies from "js-cookie";
import { Fragment, useEffect } from "react";
import showToast from "../helpers/Toastify";
import { client } from "../helpers/fetch_api/client";
import { useRouter } from "next/navigation";
import Header from "./header/Header";
import Main from "./main/Main";
import Footer from "./footer/Footer";

export default function Home() {
  const router = useRouter();

  const handleLogOut = async (e) => {
    try {
      const accessToken = Cookies.get("accessToken");
      client.setToken(accessToken);
      const response = await client.post("/auth/logout", {});
      console.log(response);
      if ((response.data.status = 200)) {
        Cookies.remove("accessToken");
        router.push("/login");
      }
    } catch (e) {
      console.log(e);
    }
  };
  return (
    <Fragment>
      <Header />
      <Main />
      <Footer />
      {/* <button onClick={handleLogOut}>Đăng xuất</button>; */}
    </Fragment>
  );
}
