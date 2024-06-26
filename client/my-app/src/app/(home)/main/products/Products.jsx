"use client";

import React, { useEffect } from "react";
import clsx from "clsx";
import style from "./products.module.css";
import { Fragment } from "react";
import Image from "next/image";
import { useState } from "react";
import { useRouter } from "next/navigation";
import { client } from "@/app/helpers/fetch_api/client";
import showToast from "@/app/helpers/Toastify";
import { Pagination } from "@nextui-org/react";
import { config } from "@/app/helpers/fetch_api/config";
import { usePathname } from "next/navigation";
import { ToastContainer } from "react-toastify";
import { getToken } from "@/app/actions/gettoken.action";

const { LIMIT_PAGE } = config;

// Hàm để định dạng số tiền
function formatCurrency(value) {
  return value
    .toLocaleString("vi-VN", {
      maximumFractionDigits: 0, // Không hiển thị phần thập phân
    })
    .replace(/,/g, "."); // Đổi dấu phẩy thành dấu chấm
}

export default function Products({ name, pathName, keyWord }) {
  const [products, setProducts] = useState([]);
  const [page, setPage] = useState(1);
  const [totalPage, setTotalPage] = useState(1);
  const router = useRouter();
  const pathname = decodeURIComponent(usePathname());

  if (pathname === "/") {
    useEffect(() => {
      async function getProducts() {
        try {
          const response = await client.get(
            `/products?page=${page}&limit=${LIMIT_PAGE}`
          );
          if (response.data.status !== 200) {
            showToast("error", response.data.message);
          }
          const data = response.data.data;

          setProducts(data.product);
          setTotalPage(data.totalPage);
        } catch (e) {
          console.log(e);
        }
      }
      getProducts();
    }, [page]);
  } else if (pathname.startsWith("/category")) {
    useEffect(() => {
      async function getFilterProducts() {
        try {
          const decodedName = decodeURIComponent(name);
          const response = await client.get(
            `/category/show/products/${decodedName}?page=${page}&limit=${LIMIT_PAGE}`
          );
          if (response.data.status !== 200) {
            router.push("/not-found");
          }
          const data = response.data.data;

          setProducts(data.products);

          setPage(data.Number(page));
          setTotalPage(data.totalPage);
        } catch (e) {
          console.log(e);
        }
      }
      getFilterProducts();
    }, [page, name]);
  } else if (pathname === pathName) {
    useEffect(() => {
      async function fetchFilterData() {
        try {
          const response = await client.get(
            `/products/search/list?q=${keyWord}`
          );
          console.log("response", response);
          if (response.data.status !== 200) {
            router.push("/not-found");
          }
          const data = response.data.data;
          if (data.products.length === 0) {
            showToast("error", "Không tìm thấy sản phẩm nào");
          }
          setProducts(data.products);
        } catch (e) {
          console.log(e);
        }
      }
      fetchFilterData();
    }, [keyWord]);
  }

  // Hàm để xử lý sự kiện khi người dùng muốn chuyển trang
  function handlePageChange(newPage) {
    setPage(newPage); // Cập nhật số trang mới
  }

  return (
    <Fragment>
      <div
        className={clsx(
          style["list-product"],
          "flex",
          "flex-wrap",
          "items-center",
          "justify-center"
        )}
      >
        {products?.map((product) => {
          return (
            <div
              className={clsx(style["box-product"])}
              onClick={() => {
                router.push(`/product/${product.id}`);
              }}
              key={product.id}
            >
              <div className={clsx(style.product)}>
                <Image
                  src={
                    product.ProductClassifies[0]?.ClassifyOptions[0]
                      ?.ProductImages[0]?.image_link
                  }
                  alt="Product"
                  className={clsx(style["img-product"])}
                  width={100}
                  height={100}
                  priority
                />
                <div className={clsx("flex", "flex-col")}>
                  <h3 className={clsx(style["title-product"], "m-2")}>
                    {product.product_name}
                  </h3>
                  <div className="flex items-center justify-between">
                    <div className={clsx(style["price-product"], "p-2")}>
                      <span>{formatCurrency(+product.price)}</span>đ
                    </div>
                    <div className={clsx(style["quantity-sold"], "p-2")}>
                      Đã bán
                      <span className="ml-1">581</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          );
        })}
      </div>
      <div
        style={{
          padding: "10px",
        }}
        className="flex"
      >
        <Pagination
          total={totalPage}
          initialPage={1 || page}
          onChange={handlePageChange}
          className="m-auto"
          key="danger"
          color="danger"
        />
      </div>
      <ToastContainer />
    </Fragment>
  );
}
