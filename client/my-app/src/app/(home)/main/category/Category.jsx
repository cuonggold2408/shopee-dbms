import React from "react";
import Image from "next/image";
import { Fragment } from "react";
import clsx from "clsx";
import style from "./category.module.css";
import ClothesImg from "../../../../../public/image/category/thoi_trang_nam.png";
import PhoneImg from "../../../../../public/image/category/dien_thoai.png";
import LaptopImg from "../../../../../public/image/category/laptop.png";
import WatchImg from "../../../../../public/image/category/dong_ho.png";
import CameraImg from "../../../../../public/image/category/camera.png";
import ShoesImg from "../../../../../public/image/category/giay.png";
import ScreenImg from "../../../../../public/image/category/man_hinh.png";
import BikeImg from "../../../../../public/image/category/bike.png";
import SportImg from "../../../../../public/image/category/the_thao.png";
import ToyImg from "../../../../../public/image/category/do_choi.png";
export default function Category() {
  return (
    <Fragment>
      <div className={clsx(style.category)}>
        <div>
          <h2 className={clsx(style.category__title)}>Danh mục</h2>
        </div>
        <div
          className={clsx(
            style["category-box"],
            "flex flex-wrap items-center justify-center"
          )}
        >
          <div
            className={clsx(
              style["category-item"],
              "flex items-center justify-center"
            )}
          >
            <div className="flex items-center flex-col ">
              <Image
                src={LaptopImg}
                alt="Thời trang nam"
                width={100}
                height={100}
              />
              <h3 className="p-1">Máy tính & laptop</h3>
            </div>
          </div>
          <div
            className={clsx(
              style["category-item"],
              "flex items-center justify-center"
            )}
          >
            <div className="flex items-center flex-col justify-center">
              <Image
                src={ClothesImg}
                alt="Thời trang nam"
                width={100}
                height={100}
              />
              <h3 className="p-1">Thời trang nam</h3>
            </div>
          </div>
          <div
            className={clsx(
              style["category-item"],
              "flex items-center justify-center"
            )}
          >
            <div className="flex items-center flex-col ">
              <Image
                src={PhoneImg}
                alt="Thời trang nam"
                width={100}
                height={100}
              />
              <h3 className="p-1">Điện thoại & phụ kiện</h3>
            </div>
          </div>
          <div
            className={clsx(
              style["category-item"],
              "flex items-center justify-center"
            )}
          >
            <div className="flex items-center flex-col ">
              <Image
                src={ScreenImg}
                alt="Thời trang nam"
                width={100}
                height={100}
              />
              <h3 className="p-1">Thiết bị điện tử</h3>
            </div>
          </div>
          <div
            className={clsx(
              style["category-item"],
              "flex items-center justify-center"
            )}
          >
            <div className="flex items-center flex-col ">
              <Image
                src={CameraImg}
                alt="Thời trang nam"
                width={100}
                height={100}
              />
              <h3 className="p-1">Máy ảnh</h3>
            </div>
          </div>
          <div
            className={clsx(
              style["category-item"],
              "flex items-center justify-center"
            )}
          >
            <div className="flex items-center flex-col ">
              <Image
                src={WatchImg}
                alt="Thời trang nam"
                width={100}
                height={100}
              />
              <h3 className="p-1">Đồng hồ</h3>
            </div>
          </div>
          <div
            className={clsx(
              style["category-item"],
              "flex items-center justify-center"
            )}
          >
            <div className="flex items-center flex-col ">
              <Image
                src={ShoesImg}
                alt="Thời trang nam"
                width={100}
                height={100}
              />
              <h3 className="p-1">Giày dép nam</h3>
            </div>
          </div>
          <div
            className={clsx(
              style["category-item"],
              "flex items-center justify-center"
            )}
          >
            <div className="flex items-center flex-col ">
              <Image
                src={SportImg}
                alt="Thời trang nam"
                width={100}
                height={100}
              />
              <h3 className="p-1">Thể thao & du lịch</h3>
            </div>
          </div>
          <div
            className={clsx(
              style["category-item"],
              "flex items-center justify-center"
            )}
          >
            <div className="flex items-center flex-col ">
              <Image
                src={BikeImg}
                alt="Thời trang nam"
                width={100}
                height={100}
              />
              <h3 className="p-1">Ô tô & xe máy & xe đạp</h3>
            </div>
          </div>
          <div
            className={clsx(
              style["category-item"],
              "flex items-center justify-center"
            )}
          >
            <div className="flex items-center flex-col ">
              <Image
                src={ToyImg}
                alt="Thời trang nam"
                width={100}
                height={100}
              />
              <h3 className="p-1">Đồ chơi</h3>
            </div>
          </div>
        </div>
      </div>
    </Fragment>
  );
}
