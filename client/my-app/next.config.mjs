/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: false,
  env: {
    TIME_INTERVAL_CHECK_TOKEN: process.env.TIME_INTERVAL_CHECK_TOKEN,
    TIME_RENEW_ACCESS_TOKEN: process.env.TIME_RENEW_ACCESS_TOKEN,
  },
  images: {
    domains: ["down-vn.img.susercontent.com"],
  },
};

export default nextConfig;
