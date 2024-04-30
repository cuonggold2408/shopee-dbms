"use client";
import React from "react";
import { Fragment } from "react";
import { clsx } from "clsx";
import Image from "next/image";
import style from "./main.module.css";
import Carousel from "./carousel/Carousel";
import BannerImg from "../../../../public/image/banner01.jpg";
import Products from "./products/Products";
import Categories from "./categories/Categories";

export default function Main() {
  return (
    <Fragment>
      <div className={clsx(style.main)}>
        <div className={clsx(style.container)}>
          <div className={clsx("flex gap-2 min-h-min", style.banner)}>
            <Carousel className={clsx("h-full flex", style.carousel)} />
            <div
              style={{ maxHeight: "243px" }}
              className={clsx(
                style["small-banner"],
                "flex",
                "flex-col",
                "ml-1"
              )}
            >
              <div>
                <Image
                  src={BannerImg}
                  className={clsx(style["small__banner-item"])}
                  alt="sdasd"
                />
              </div>
              <div className="mt-2">
                <Image
                  src={BannerImg}
                  className={clsx(style["small__banner-item"])}
                  alt="banner"
                />
              </div>
            </div>
          </div>
          <Categories />
          <Products />
        </div>
      </div>
    </Fragment>
  );
}
