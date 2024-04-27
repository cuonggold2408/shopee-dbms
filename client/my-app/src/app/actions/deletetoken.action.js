"use server";

import { cookies } from "next/headers";

export async function deleteToken() {
  const cookieStore = cookies();
  try {
    const accessToken = cookieStore.get("access_token");
    const refreshToken = cookieStore.get("refresh_token");
    if (accessToken) {
      cookieStore.delete("access_token");
    }
    if (refreshToken) {
      cookieStore.delete("refresh_token");
    }
  } catch (e) {
    console.log(e);
  }
}
