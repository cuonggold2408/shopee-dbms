"use client"
import React from "react";
import { Fragment } from "react";
import { clsx } from "clsx";
import Image from "next/image";
import style from "./main.module.css";
import Carousel from "./carousel/Carousel";
import BannerImg from "../../../../public/image/banner01.jpg";
import Product from "./category/product/product";
import { Pagination } from "@nextui-org/react";
import Category from "./category/Category";


export default function Main() {

  return (
    <Fragment>
      <div className={clsx(style.main)}>
        <div className={clsx(style.container)}>
          <div className={clsx('flex gap-2 min-h-min', style.banner)}>
            <Carousel className={clsx("h-full flex", style.carousel)} />
            <div style={{ maxHeight: "243px" }} className={clsx(style["small-banner"], "flex", "flex-col", 'ml-1')}>
              <div >
                <Image src={BannerImg} className={clsx(style['small__banner-item'])} alt="sdasd" />
              </div>
              <div className="mt-2">
                <Image src={BannerImg} className={clsx(style['small__banner-item'])} alt="banner" />
              </div>
            </div>

          </div>
          <Category />
          <Product />
          <div style={
            {
              padding: "10px",
              borderBottom: "1px solid #ee4d2d",
            }
          }
            className="flex">
            <Pagination total={10} initialPage={1} className="m-auto" color="danger" key="danger" style={{

            }} />
          </div>

        </div >
      </div>

    </Fragment >
  )
}
