"use client";
import React, { Fragment } from "react";
import Header from "../../header/Header";
import Products from "../../main/products/Products";
import { Component } from "react";
import clsx from "clsx";
import Image from "next/image";

export default function Category({ name }) {
  const decodedName = decodeURIComponent(name);
  const decodedNameNew = decodedName.replaceAll("-", " ");
  return (
    <Fragment>
      <Header />
      <div
        style={{
          width: "100%",
          backgroundColor: "#F5F5F5",
        }}
      >
        <div
          style={{
            width: "80vw",
            margin: "0 auto",
            overflow: "hidden",
          }}
        >
          <h1
            style={{
              height: "50px",
              lineHeight: "50px",
              fontSize: "24px",
              fontWeight: "bold",
            }}
            className="px-2"
          >
            {decodedNameNew}
          </h1>
          <Products name={decodedName} />
        </div>
      </div>
    </Fragment>
  );
}
