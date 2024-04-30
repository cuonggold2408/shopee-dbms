"use client";

import React, { useEffect, useMemo, useRef, useState } from "react";
import { Fragment } from "react";
import Footer from "../footer/Footer";
import style from "./checkout.module.css";
import clsx from "clsx";
import Header from "../(home)/header/Header";
import LocationOnIcon from "@mui/icons-material/LocationOn";
import Image from "next/image";
import TestImg from "../../../public/image/product-img.jpg";
import { client } from "../helpers/fetch_api/client";
import { getToken } from "../actions/gettoken.action";
import { useRouter } from "next/navigation";
import Button from "@mui/material/Button";
import { Box } from "@mui/material";
import AddRoundedIcon from "@mui/icons-material/AddRounded";
import { Checkbox, Textarea } from "@nextui-org/react";
import { HeartIcon } from "./HeartIcon.jsx";
import { Input } from "@nextui-org/react";
import showToast from "../helpers/Toastify";
import { ToastContainer } from "react-toastify";
import Loading from "../Loading/Loading";

function formatCurrency(value) {
  return value
    .toLocaleString("vi-VN", {
      maximumFractionDigits: 0, // Không hiển thị phần thập phân
    })
    .replace(/,/g, "."); // Đổi dấu phẩy thành dấu chấm
}

export default function Checkout() {
  const [product, setProduct] = useState([]);
  const [userId, setUserId] = useState(null);
  const [totalPrice, setTotalPrice] = useState(0);
  const [address, setAddress] = useState(null);
  const [openAddress, setOpenAddress] = useState(false);
  const [openNewAddress, setOpenNewAddress] = useState(false);
  const [openUpdateAddress, setOpenUpdateAddress] = useState(false);
  const [checked, setChecked] = useState(false);
  const [addressSelected, setAddressSelected] = useState(null);

  // const [saveName, setSaveName] = useState(null);
  // const [savePhone, setSavePhone] = useState(null);
  // const [saveAddress, setSaveAddress] = useState(null);
  // const [saveAddressIdUpdate, setSaveAddressIdUpdate] = useState(null);
  // const [saveDefaultAddress, setSaveDefaultAddress] = useState(false);

  const [addressDetails, setAddressDetails] = useState({
    saveName: null,
    savePhone: null,
    saveAddress: null,
    saveAddressIdUpdate: null,
    saveDefaultAddress: false,
  });

  const [selectedAddressId, setSelectedAddressId] = useState(null);

  const [isLoading, setIsLoading] = useState(false);

  const [value, setValue] = useState("");
  const addressRef = useRef(null);
  const router = useRouter();

  const validatePhone = (value) => {
    return /^[0-9]{10}$/.test(value);
  };

  const isInvalid = useMemo(() => {
    if (value.trim() === "") return false;

    return validatePhone(value) ? false : true;
  }, [value]);

  const handleToggleAddress = () => {
    setOpenAddress(!openAddress);
  };

  const handleToggleNewAddress = () => {
    setOpenNewAddress(!openNewAddress);
  };

  const handleChangeCheckbox = () => {
    setChecked(!checked);
  };

  const handleCloseAddress = () => {
    setOpenAddress(false);
  }

  const handleSelectAddress = (id) => {
    setSelectedAddressId(id);
  };

  const handleGetUpdateAddress = async (id) => {
    try {
      const chooseAddress = address.find((item) => item.address_id === id);
      console.log("chooseAddress", chooseAddress);

      setAddressDetails({
        saveAddress: chooseAddress.address_line,
        saveName: chooseAddress.name_receiver,
        savePhone: chooseAddress.phone_receiver,
        saveDefaultAddress: chooseAddress.default_address,
        saveAddressIdUpdate: chooseAddress.address_id,
      });
    } catch (e) {
      console.log(e);
    } finally {
      setIsLoading(false);
    }
  };

  const handleUpdateAddress = async (e) => {
    e.preventDefault();
    try {
      const formData = new FormData(e.target);
      const name = formData.get("nameupdate");
      const phone = formData.get("phoneupdate");
      const address = formData.get("addressupdate");
      console.log("addressDetails", addressDetails);
      console.log("name", name);
      console.log("phone", phone);
      console.log("address", address);

      const response = await client.post("/user/update/address", {
        users_id: userId,
        address_line: address,
        phone_receiver: phone,
        name_receiver: name,
        default_address: addressDetails.saveDefaultAddress,
        address_id: addressDetails.saveAddressIdUpdate,
      });

      if (response.data.status === 400) {
        showToast("error", response.data.message);
        return;
      }
      showToast("success", response.data.message);

      const responseGetDataAddress = await client.get(
        `/user/get/address/${userId}`
      );
      console.log("responseGetDataAddress", responseGetDataAddress.data.data);
      const defaultSelected = responseGetDataAddress.data.data.address.find(
        (item) => item.is_selected
      );
      console.log("defaultSelected", defaultSelected);
      if (defaultSelected) {
        setSelectedAddressId(defaultSelected.address_id); // Cập nhật state với ID của địa chỉ được chọn
      }
      setAddress(responseGetDataAddress.data.data.address);
    } catch (e) {
      console.log(e);
    }
  };

  const handleConfirmAddress = async () => {
    try {
      const dataToken = await getToken();
      const response = await client.post("/user/update/selected/address", {
        users_id: dataToken.userId,
        address_id: selectedAddressId,
        is_selected: true,
      });
      if (response.data.status === 400) {
        showToast("error", response.data.message);
        return;
      }
      showToast("success", response.data.message);
      setAddressSelected(response.data.data.address);
      setOpenAddress(false);
    } catch (e) {
      console.log(e);
    }
  };

  const handleAddNewAddress = async (e) => {
    e.preventDefault();
    try {
      const formData = new FormData(e.target);
      const name = formData.get("name");
      const phone = formData.get("phone");
      const address = formData.get("address");

      const response = await client.post("/user/add/address", {
        users_id: userId,
        address_line: address,
        phone_receiver: phone,
        name_receiver: name,
        default_address: checked,
      });

      if (response.data.status === 400) {
        showToast("error", response.data.message);
        return;
      }
      showToast("success", response.data.message);
    } catch (e) {
      console.log(e);
      showToast("error", "Có lỗi xảy ra");
    }
  };

  useEffect(() => {
    async function fetchData() {
      try {
        const dataToken = await getToken();
        if (!dataToken) {
          router.push("/login");
        }
        setUserId(dataToken.userId);
        const response = await client.get(
          `/products/checkout/cart/${dataToken.userId}`
        );
        setProduct(response.data.data.cart);
        console.log("response", response.data);
      } catch (e) {
        console.log(e);
      }
    }

    fetchData();
  }, []);

  useEffect(() => {
    async function fetchDataAddress() {
      try {
        const dataToken = await getToken();

        const response = await client.get(
          `/user/get/address/${dataToken.userId}`
        );
        const defaultSelected = response.data.data.address.find(
          (item) => item.is_selected
        );
        console.log("defaultSelected", defaultSelected);
        if (defaultSelected) {
          setSelectedAddressId(defaultSelected.address_id); // Cập nhật state với ID của địa chỉ được chọn
        }
        setAddress(response.data.data.address);
        const defaultSelectedAddress = response.data.data.address.find(
          (item) => item.is_selected
        );
        setAddressSelected(defaultSelectedAddress);
      } catch (e) {
        console.log(e);
      }
    }

    fetchDataAddress();
  }, []);

  useEffect(() => {
    let total = 0;
    console.log("product", product);
    product.forEach((item) => {
      total += +item.total_price;
    });

    setTotalPrice(total);
  }, [product]);

  useEffect(() => {
    function handleClickOutside(event) {
      if (addressRef.current && !addressRef.current.contains(event.target)) {
        setOpenAddress(false);
      }
    }

    document.addEventListener("mousedown", handleClickOutside);

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  return (
    <Fragment>
      {isLoading && <Loading />}
      <Header />
      <div className={style.main}>
        <div className={style.container}>
          <div className="">
            <div
              style={{
                backgroundImage:
                  "repeating-linear-gradient(45deg, #6fa6d6, #6fa6d6 33px, transparent 0, transparent 41px, #f18d9b 0, #f18d9b 74px, transparent 0, transparent 82px)",
                backgroundPositionX: "-30px",
                backgroundSize: "116px 3px",
                height: "3px",
                width: "100%",
              }}
            ></div>
            <div
              className={clsx(
                "flex flex-col p-7 gap-2 bg-white",
                style.address
              )}
            >
              <div
                className="flex items-center gap-1"
                style={{
                  color: "#ee4d2d",
                  fontSize: "20px",
                  textTransform: "capitalize",
                }}
              >
                <LocationOnIcon className="text-2xl" />
                <h2>Địa chỉ nhận hàng</h2>
              </div>
              {/* <div
                className={clsx("flex items-center gap-2", style.info__user)}
              >
                <div className={clsx(style.name__user)}>
                  Bách Nguyễn
                  <span>(+84) 325453480</span>
                </div>
                <div className={clsx(style.address__user)}>
                  2c Ngách 15 Ngõ 20 Hồ Tùng Mậu, Phường Mai Dịch, Quận Cầu
                  Giấy, Hà Nội
                </div>
              </div> */}

              <div
                className={clsx("flex items-center gap-2", style.info__user)}
              >
                <div className={clsx(style.name__user)}>
                  {addressSelected?.name_receiver}
                  <span> {addressSelected?.phone_receiver}</span>
                </div>
                <div className={clsx(style.address__user)}>
                  {addressSelected?.address_line}
                </div>
              </div>

              <Button
                onClick={handleToggleAddress}
                className="self-start"
                style={{ textTransform: "none" }}
              >
                Thay đổi địa chỉ
              </Button>
            </div>
          </div>

          <div className={clsx("mt-3 bg-white p-7", style.list__product)}>
            <div
              className={clsx(
                "flex items-center justify-center gap-2",
                style.title__option
              )}
            >
              <div
                className={style.product__item}
                style={{
                  fontSize: "20px",
                }}
              >
                Sản phẩm
              </div>
              <div
                style={{
                  flex: 2,
                }}
              ></div>
              <div className={style.price__one}>Đơn giá</div>
              <div className={style.quantity}>Số lượng</div>
              <div className={style.price__total}>Thành tiền</div>
            </div>

            {/* Sản phẩm */}
            {product?.map((item, index) => {
              return (
                <div
                  style={{
                    borderBottom: "1px dotted #e0e0e0",
                  }}
                  className="flex items-center gap-2 pb-5 pt-5"
                  key={index}
                >
                  <div
                    className={clsx(
                      "flex items-center justify-start",
                      style.product__item
                    )}
                  >
                    <div className={style.product__img}>
                      <Image
                        src={item?.image_product}
                        alt="product"
                        width={50}
                        height={50}
                        style={{ maxWidth: "50px", maxHeight: "50px" }}
                      />
                    </div>
                    <span
                      style={{ marginLeft: "10px" }}
                      className={style.product__name}
                    >
                      {item?.product_name}
                    </span>
                  </div>
                  <div
                    style={{
                      flex: 2,
                      color: "#9b9b9b",
                    }}
                  >
                    Loại: {item?.classify}
                  </div>
                  <div className={style.price__one}>
                    {formatCurrency(+item?.product_price)}
                  </div>
                  <div className={style.quantity}>
                    {formatCurrency(+item?.quantity)}
                  </div>
                  <div className={style.price__total}>
                    {formatCurrency(+item?.total_price)}
                  </div>
                </div>
              );
            })}
          </div>

          <div className={style.payment}>
            <div className={clsx("flex items-center", style["text-coin-1"])}>
              Tổng tiền hàng
            </div>
            <div className={clsx("flex items-center", style.bwwaGp)}>
              đ{formatCurrency(+totalPrice)}
            </div>
            <div
              div
              className={clsx("flex items-center", style["text-coin-1"])}
            >
              {" "}
              Phí vật chuyển
            </div>
            <div className={clsx("flex items-center", style.vourcher__ship)}>
              ₫0
            </div>
            <div
              className={clsx(
                "flex items-center",
                style["text-coin-1"],
                style["total-coins"]
              )}
            >
              {" "}
              Tổng thanh toán
            </div>
            <div
              className={clsx(
                "flex items-center",
                style["payment__item-total"]
              )}
            >
              ₫{formatCurrency(+totalPrice)}
            </div>
          </div>

          <div className={style["select-product"]}>
            <div
              style={{
                fontSize: "15px",
              }}
            >
              Nhấn "Đặt hàng" đồng nghĩa với việc bạn đồng ý tuân theo
              <span
                style={{ textDecoration: "none", color: "#0055AD" }}
                className="ml-1"
              >
                Điều khoản Shopee
              </span>
            </div>
            <button className={clsx(style["select__product-item"])}>
              Đặt hàng
            </button>
          </div>
        </div>
      </div>
      {openAddress && (
        <Box className="fixed left-1/2 top-1/2" style={{ zIndex: "9999999" }}>
          <Box
            style={{
              zIndex: "999999",
              minHeight: "555px",
              maxHeight: "555px",
              minWidth: "513px",
            }}
            className="bg-white absolute -translate-x-1/2 -translate-y-1/2 rounded-md flex flex-col"
            ref={addressRef}
          >
            {openNewAddress ? (
              <h1
                className="p-4 border-b border-gray-300 text-lg sticky inset-0"
                style={{ textTransform: "capitalize" }}
              >
                Thêm địa chỉ mới
              </h1>
            ) : openUpdateAddress ? (
              <h1
                className="p-4 border-b border-gray-300 text-lg sticky inset-0"
                style={{ textTransform: "capitalize" }}
              >
                Cập nhật địa chỉ
              </h1>
            ) : (
              <h1
                className="p-4 border-b border-gray-300 text-lg sticky inset-0"
                style={{ textTransform: "capitalize" }}
              >
                Địa chỉ của tôi
              </h1>
            )}
            <Box
              className="p-2"
              style={{
                maxHeight: "450px",
                overflowY: "auto",
              }}
            >
              {/* Box chứa all địa chỉ */}
              {openNewAddress ? (
                <form
                  onSubmit={handleAddNewAddress}
                  className="flex flex-col gap-3"
                >
                  <Box className="flex gap-3">
                    <Input
                      type="text"
                      label="Họ và tên"
                      placeholder="Enter your name"
                      size="sm"
                      name="name"
                    />
                    <Input
                      type="tel"
                      label="Số điện thoại"
                      placeholder="Enter your number"
                      size="sm"
                      name="phone"
                      color={isInvalid ? "danger" : ""}
                      errorMessage={isInvalid && "Vui lòng nhập số điện thoại"}
                      isInvalid={isInvalid}
                      onValueChange={setValue}
                    />
                  </Box>
                  <Box>
                    <Textarea
                      label="Địa chỉ"
                      placeholder="Enter your address"
                      className="w-full"
                      name="address"
                    />
                  </Box>
                  <Box>
                    <Checkbox
                      isSelected={checked}
                      onValueChange={setChecked}
                      radius="sm"
                    >
                      <span className="opacity-70">
                        Đặt làm địa chỉ mặc định
                      </span>
                    </Checkbox>
                  </Box>
                  <Button
                    variant="contained"
                    type="submit"
                    className="bg-blue-500 w-fit normal-case"
                  >
                    Thêm địa chỉ
                  </Button>
                </form>
              ) : openUpdateAddress ? (
                <form
                  onSubmit={handleUpdateAddress}
                  className="flex flex-col gap-3"
                >
                  <Box className="flex gap-3">
                    <Input
                      type="text"
                      label="Họ và tên"
                      placeholder="Enter your name"
                      size="sm"
                      defaultValue={addressDetails.saveName}
                      name="nameupdate"
                    />
                    <Input
                      type="tel"
                      label="Số điện thoại"
                      placeholder="Enter your number"
                      size="sm"
                      defaultValue={addressDetails.savePhone}
                      name="phoneupdate"
                      color={isInvalid ? "danger" : ""}
                      errorMessage={isInvalid && "Vui lòng nhập số điện thoại"}
                      isInvalid={isInvalid}
                      onValueChange={setValue}
                    />
                  </Box>
                  <Box>
                    <Textarea
                      label="Địa chỉ"
                      placeholder="Enter your address"
                      className="w-full"
                      defaultValue={addressDetails.saveAddress}
                      name="addressupdate"
                    />
                  </Box>
                  <Box>
                    <Checkbox
                      onChange={() =>
                        setAddressDetails({
                          ...addressDetails,
                          saveDefaultAddress:
                            !addressDetails.saveDefaultAddress,
                        })
                      }
                      isSelected={addressDetails.saveDefaultAddress}
                      radius="sm"
                    >
                      <span className="opacity-70">
                        Đặt làm địa chỉ mặc định
                      </span>
                    </Checkbox>
                  </Box>
                  <Button
                    variant="contained"
                    type="submit"
                    className="bg-blue-500 w-fit normal-case"
                  >
                    Cập nhật
                  </Button>
                </form>
              ) : (
                <Box>
                  {/* Box địa chỉ */}
                  <Box className="flex flex-col gap-4">
                    {address?.map((item, index) => {
                      console.log("item", item);
                      return (
                        <Box key={index} className="flex gap-4 border-b-1 mb-2">
                          <Box>
                            <Checkbox
                              icon={<HeartIcon />}
                              color="danger"
                              isSelected={selectedAddressId === item.address_id}
                              onChange={() =>
                                handleSelectAddress(item.address_id)
                              }
                            />
                          </Box>
                          <Box className="w-full">
                            <Box className="flex justify-between items-center">
                              <span>
                                {item?.name_receiver} |{" "}
                                <span className="text-gray-400">
                                  {item?.phone_receiver}
                                </span>
                              </span>
                              <Button
                                onClick={() => {
                                  setOpenUpdateAddress(true);
                                  handleGetUpdateAddress(item?.address_id);
                                }}
                                style={{ textTransform: "none" }}
                              >
                                Cập nhật
                              </Button>
                            </Box>
                            <Box>{item?.address_line}</Box>
                            {item?.default_address && (
                              <Box className="border-1 border-red-500 p-1 text-red-500 rounded-sm w-fit my-2 text-sm">
                                Mặc định
                              </Box>
                            )}
                          </Box>
                        </Box>
                      );
                    })}
                  </Box>

                  {/* Button thêm địa chỉ mới */}
                  {(!openNewAddress || !openUpdateAddress) && (
                    <Box
                      onClick={() => setOpenNewAddress(true)}
                      className="border-1 hover:bg-slate-100 transition-all ease-in-out cursor-pointer border-red-500 w-fit flex  justify-center items-center rounded-sm mb-3"
                    >
                      <AddRoundedIcon
                        className="text-gray-400"
                        fontSize="large"
                      />
                      <span
                        className="pr-2 text-red-500"
                        style={{ textTransform: "capitalize" }}
                      >
                        Thêm địa chỉ mới
                      </span>
                    </Box>
                  )}
                </Box>
              )}

              {/* Box hủy và confirm */}
              <Box
                style={{ zIndex: "999" }}
                className="fixed bottom-0 right-0 p-2 border-t-1 border-slate-200 w-full bg-white"
              >
                <Box className="flex gap-2 justify-end mr-3">
                  {openNewAddress ? (
                    <Box
                      className="border-1 hover:bg-slate-100 text-red-500 border-red-500  flex justify-center items-center  transition-all ease-in-out rounded-sm cursor-pointer"
                      style={{ width: "140px", height: "40px" }}
                      onClick={() => {
                        if (openNewAddress) {
                          setOpenNewAddress(false);
                        } else if (openUpdateAddress) {
                          setOpenUpdateAddress(false);
                        } else {
                          setOpenAddress(false);
                        }
                      }}
                    >
                      Trở lại
                    </Box>
                  ) : openUpdateAddress ? (
                    <Box
                      className="border-1 hover:bg-slate-100 text-red-500 border-red-500  flex justify-center items-center  transition-all ease-in-out rounded-sm cursor-pointer"
                      style={{ width: "140px", height: "40px" }}
                      onClick={() => {
                        if (openNewAddress) {
                          setOpenNewAddress(false);
                        } else if (openUpdateAddress) {
                          setOpenUpdateAddress(false);
                        } else {
                          setOpenAddress(false);
                        }
                      }}
                    >
                      Trở lại
                    </Box>
                  ) : (
                    <Box
                      className="border-1 hover:bg-slate-100 text-red-500 border-red-500  flex justify-center items-center  transition-all ease-in-out rounded-sm cursor-pointer"
                      style={{ width: "140px", height: "40px" }}
                      onClick={() => {
                        if (openNewAddress) {
                          setOpenNewAddress(false);
                        } else if (openUpdateAddress) {
                          setOpenUpdateAddress(false);
                        } else {
                          setOpenAddress(false);
                        }
                      }}
                    >
                      Hủy
                    </Box>
                  )}

                  {openNewAddress ? (
                    <Button
                      className="bg-red-500 text-white rounded-sm hover:bg-red-400 cursor-pointer flex justify-center items-center"
                      style={{ width: "140px", height: "40px" }}
                      onClick={handleCloseAddress}
                    >
                      Hoàn thành
                    </Button>
                  ) : openUpdateAddress ? (
                    <Box
                      className="bg-red-500 text-white rounded-sm hover:bg-red-400 cursor-pointer flex justify-center items-center"
                      style={{ width: "140px", height: "40px" }}
                      onClick={handleCloseAddress}
                    >
                      Hoàn thành
                    </Box>
                  ) : (
                    <Box
                      className="bg-red-500 text-white rounded-sm hover:bg-red-400 cursor-pointer flex justify-center items-center"
                      style={{ width: "140px", height: "40px" }}
                      onClick={handleConfirmAddress}
                    >
                      Xác nhận
                    </Box>
                  )}
                </Box>
              </Box>
            </Box>
          </Box>
          <Box className="bg-gray-400 opacity-50 w-screen h-screen fixed inset-0" />
        </Box>
      )}
      <Footer />
      <ToastContainer />
    </Fragment>
  );
}
