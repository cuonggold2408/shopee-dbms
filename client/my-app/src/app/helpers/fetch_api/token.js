import { client } from "./client.js";
client.setUrl("https://api.escuelajs.co/api/v1");

export const requestRefresh = async function (refreshToken) {
  const { response, data } = await client.post("/auth/refresh-token", {
    refreshToken: refreshToken,
  });
  if (response.ok) {
    return data;
  }
};
