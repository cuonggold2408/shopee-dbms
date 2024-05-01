"use server";

import { cookies } from "next/headers";
import { client } from "../helpers/fetch_api/client";

export async function getToken() {
  const cookieStore = cookies();
  try {
    const accessToken = cookieStore.get("access_token");
    const refreshToken = cookieStore.get("refresh_token");

    const exp = await client.post("/auth/get-expires-token", {
      access_token: accessToken?.value,
      refresh_token: refreshToken?.value,
    });
    const userId = exp.data.data.id;
    return { accessToken, refreshToken, userId, exp: exp.data.data };
  } catch (e) {
    console.log(e);
  }
}
