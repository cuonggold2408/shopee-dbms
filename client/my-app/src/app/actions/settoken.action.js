"use server";

import { cookies } from "next/headers";
import { client } from "../helpers/fetch_api/client";

export async function setToken(accessToken, refreshToken) {
  const cookie = cookies();
  // console.log(process.env.TIME_EXPIRED_ACCESS_TOKEN);
  console.log("accessToken: ", accessToken);
  console.log("refreshToken: ", refreshToken);
  const expiresTime = await client.post("/auth/get-expires-token", {
    access_token: accessToken,
    refresh_token: refreshToken,
  });
  console.log("expiresTime: ", expiresTime);
  const expAccess = expiresTime.data.data.expAccess;
  const expRefresh = expiresTime.data.data.expRefresh;

  console.log("expAccess: ", new Date(expAccess * 1000));
  console.log("expRefresh: ", new Date(expRefresh * 1000));

  // console.log("exp: ", new Date(exp * 1000));
  cookie.set("access_token", accessToken, {
    expires: new Date(expAccess * 1000),
    httpOnly: true,
    path: "/",
  });
  cookie.set("refresh_token", refreshToken, {
    expires: new Date(expRefresh * 1000),
    httpOnly: true,
    path: "/",
  });
}
