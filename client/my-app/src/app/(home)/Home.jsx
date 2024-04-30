"use client";

import { Fragment, useEffect } from "react";
import { client } from "../helpers/fetch_api/client";
import Header from "./header/Header";
import Main from "./main/Main";
import Footer from "./../footer/Footer";
import { setToken } from "../actions/settoken.action";
import { getToken } from "../actions/gettoken.action";

export default function Home() {
  useEffect(() => {
    let interval; // Khai báo biến interval ở ngoài để có thể clear nó sau này

    async function dataToken() {
      try {
        const data = await getToken(); // Lấy token
        // console.log("data: ", data);
        let expAccess = data.exp.expAccess; // Lấy thời gian hết hạn từ access_token
        let accessToken = data.accessToken.value; // Lấy giá trị access_token
        let refreshToken = data.refreshToken.value; // Lấy giá trị refresh_token

        // Hàm kiểm tra và làm mới token nếu cần
        async function checkAndRefreshToken() {
          const currentTime = Math.floor(Date.now() / 1000);
          const timeLeft = expAccess - currentTime; // Tính thời gian còn lại cho đến khi token hết hạn

          // console.log("currentTime: ", currentTime);
          // console.log("timeLeft: ", timeLeft);

          if (timeLeft < process.env.TIME_RENEW_ACCESS_TOKEN && timeLeft > 0) {
            // TIME_RENEW_ACCESS_TOKEN giây
            try {
              // console.log("Đang refresh token...");
              const response = await client.post("/auth/refresh", {
                refresh_token: refreshToken,
              });

              const newData = response.data.data; // trả ra object {accessToken, refreshToken}
              // console.log("newData: ", newData);

              accessToken = newData.accessToken; // Cập nhật accessToken mới
              refreshToken = newData.refreshToken; // Cập nhật refreshToken mới
              expAccess = newData.expAccess; // Cập nhật thời gian hết hạn mới của access_token

              await setToken(accessToken, refreshToken); // Lưu token mới vào cookie
            } catch (e) {
              console.log(e);
            }
          }
        }
        // Đặt kiểm tra định kỳ mỗi TIME_RENEW_ACCESS_TOKEN giây
        interval = setInterval(
          checkAndRefreshToken,
          process.env.TIME_INTERVAL_CHECK_TOKEN * 1000
        ); // Sử dụng biến interval đã khai báo
      } catch (e) {}
    }

    dataToken();

    // Dọn dẹp
    return () => clearInterval(interval);
  }, []);
  return (
    <Fragment>
      <Header />
      <Main />
      <Footer />
    </Fragment>
  );
}
