"use client";

import React, { useEffect } from "react";
import clsx from "clsx";
import style from "./products.module.css";
import { Fragment } from "react";
import Image from "next/image";
// import ProductImg from "../../../../../../public/image/product.jpg";
import { useState } from "react";
import { useRouter } from "next/navigation";
import { client } from "@/app/helpers/fetch_api/client";
import showToast from "@/app/helpers/Toastify";
import { Pagination } from "@nextui-org/react";
import { config } from "@/app/helpers/fetch_api/config";
import { v4 as uuidv4 } from "uuid";

const { LIMIT_PAGE } = config;

// function slugify(text) {
//   return text
//     .toString()
//     .toLowerCase()
//     .replace(/\s+/g, "-") // Thay thế khoảng trắng bằng dấu gạch ngang
//     .replace(/[^\w\-]+/g, "") // Xóa tất cả các ký tự không phải là chữ, số, hoặc gạch ngang
//     .replace(/\-\-+/g, "-") // Thay thế các dấu gạch ngang liên tiếp bằng một dấu gạch ngang đơn
//     .replace(/^-+/, "") // Xóa dấu gạch ngang ở đầu chuỗi
//     .replace(/-+$/, ""); // Xóa dấu gạch ngang ở cuối chuỗi
// }

export default function Products() {
  const [products, setProducts] = useState([]);
  const [page, setPage] = useState(1);
  const [totalPage, setTotalPage] = useState(1);
  const router = useRouter();

  useEffect(() => {
    async function getProducts() {
      try {
        console.log("page: ", page);
        console.log("limit: ", LIMIT_PAGE);
        const response = await client.get(
          `/products?page=${page}&limit=${LIMIT_PAGE}`
        );
        // console.log(response);
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

  console.log("products: ", products);

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
        {products.map((product) => {
          return (
            <div
              className={clsx(style["box-product"])}
              onClick={() => {
                // router.push(`${slugify(product.product_name)}`);
                router.push(`/${product.id}`);
              }}
              key={product.id}
            >
              <div className={clsx(style.product)}>
                <Image
                  src={
                    product.ProductClassifies[0].ClassifyOptions[0]
                      .ProductImages[0].image_link
                  }
                  alt="Product"
                  className={clsx(style["img-product"])}
                  width={100}
                  height={100}
                />
                <div className={clsx("flex", "flex-col")}>
                  <h3 className={clsx(style["title-product"], "m-2")}>
                    {product.product_name}
                  </h3>
                  <div className="flex items-center justify-between">
                    <div className={clsx(style["price-product"], "p-2")}>
                      <span>{product.price}</span>đ
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
          borderBottom: "1px solid #ee4d2d",
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
    </Fragment>
  );
}
