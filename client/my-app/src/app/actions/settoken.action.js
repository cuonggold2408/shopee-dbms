"use server";

import { cookies } from "next/headers";
import { client } from "../helpers/fetch_api/client";

export async function setToken(accessToken, refreshToken) {
  const cookie = cookies();

  const expiresTime = await client.post("/auth/get-expires-token", {
    access_token: accessToken,
    refresh_token: refreshToken,
  });

  const expAccess = expiresTime.data.data.expAccess;
  const expRefresh = expiresTime.data.data.expRefresh;

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
