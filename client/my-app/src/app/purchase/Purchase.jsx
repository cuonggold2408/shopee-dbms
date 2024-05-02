"use client";
import React, { useEffect, useRef, useState, useCallback } from "react";
import { Fragment } from "react";
import clsx from "clsx";
import style from "./purchase.module.css";
import Image from "next/image";
import Header from "../(home)/header/Header";
import CarRepairIcon from '@mui/icons-material/CarRepair';
import Shirt from "../../../public/image/product.jpg";
import Footer from "../footer/Footer";
import { getToken } from "../actions/gettoken.action";
import { client } from "../helpers/fetch_api/client";
import { useRouter } from "next/navigation";
import Loading from "../Loading/Loading";
import { Box } from "@mui/material";
import { Checkbox, Textarea, user } from "@nextui-org/react";
import Button from "@mui/material/Button";
import StarIcon from '@mui/icons-material/Star';
import StarBorderIcon from '@mui/icons-material/StarBorder';
import showToast from "../helpers/Toastify";
import { ToastContainer } from "react-toastify";
import { set } from "cookie-cutter";
function formatCurrency(value) {
    return value
        .toLocaleString("vi-VN", {
            maximumFractionDigits: 0, // Không hiển thị phần thập phân
        })
        .replace(/,/g, "."); // Đổi dấu phẩy thành dấu chấm
}
export default function Purchase() {
    const [transactions, setTransactions] = useState([]);
    const [rating, setRating] = useState(0);
    const [isReviewBoxVisible, setIsReviewBoxVisible] = useState(false);
    const [classify, setClassify] = useState(null);
    const [id, setId] = useState(0);
    const router = useRouter();
    const [productId, setProductId] = useState(0);
    const [reviewedProductIds, setReviewedProductIds] = useState([]);

    const cmtRef = useRef(null);
    const handleToggleCmt = (productId, classify, id) => {
        console.log(id);
        setIsReviewBoxVisible(!isReviewBoxVisible);
        setProductId(productId);
        setClassify(classify);
        setId(id);
    };

    const handleClickRate = (rate) => {
        setRating(rate);
        console.log(rate);
        if (rate === 0) {
            showToast("error", "Số sao đánh giá tối thiểu là 1");
            return;
        }

    };

    const hanldeClickExit = () => {
        setIsReviewBoxVisible(false);
    }

    const handleAddReview = useCallback(async (event) => {
        event.preventDefault();

        const dataToken = await getToken();
        const userId = dataToken.userId;
        if (rating === 0) {
            setIsReviewBoxVisible(false);
            showToast("error", "Bạn chưa đánh giá sao");
            return;
        }

        const reviewData = {
            commented: event.target.review.value,
            voted: rating,
        };

        console.log(reviewData);

        try {
            let response;
            const hasBeenReviewed = reviewedProductIds.some(product => product.userId === userId && product.productId === productId && product.classify === classify);
            if (hasBeenReviewed) {
                response = await client.put(`/products/update/one/evaluated/${userId}/${productId}`, reviewData);
                console.log(response.data);
            } else {
                response = await client.post(`/products/post/one/new/evaluate/${userId}/${productId}`, reviewData);
            }

            console.log(response.data);
            if (response.data.status === 200) {
                showToast("success", response.data.message, () => { });

                setIsReviewBoxVisible(false);
                const newReviewedProduct = { userId, productId, classify, id };
                const newReviewedProducts = [...reviewedProductIds, newReviewedProduct];
                setReviewedProductIds(newReviewedProducts);
                localStorage.setItem('reviewedProducts', JSON.stringify(newReviewedProducts));
            }
            else {
                showToast("error", response.data.message);
            }
        } catch (e) {
            console.log(e);
        }
    }, [rating, productId, reviewedProductIds, classify]);

    useEffect(() => {
        function handleClickOutside(event) {
            if (cmtRef.current && !cmtRef.current.contains(event.target)) {
                setIsReviewBoxVisible(false);
            }
        }

        document.addEventListener("mousedown", handleClickOutside);

        return () => {
            document.removeEventListener("mousedown", handleClickOutside);
        };
    }, []);

    useEffect(() => {
        const reviewedProducts = localStorage.getItem('reviewedProducts');
        if (reviewedProducts) {
            setReviewedProductIds(JSON.parse(reviewedProducts));
        }
    }, []);


    useEffect(() => {
        async function fetchData() {
            const dataToken = await getToken();
            console.log(dataToken);
            try {
                const response = await client.get(`/transactions/get/one/${dataToken.userId}`);
                if (response.data.status !== 200) {
                    router.push("/not-found");
                    // showToast("error", response.data.message);
                }
                setTransactions(response.data.data);
            }
            catch (error) {
                console.log(error);
            }
        }
        fetchData();
    }, []);
    console.log(transactions);

    return (
        <Fragment>
            <Header />
            <div className={style.main}>
                <div className={clsx(style.container, "px-3")}>
                    {transactions.map(transaction => {
                        const isReviewed = reviewedProductIds.some(product =>
                            product.userId === transaction.cart_id && product.productId === transaction.product_id && product.classify === transaction.classify && product.id === transaction.id);
                        console.log(isReviewed);
                        return (
                            <div className={clsx(style.product__purchase, 'flex flex-col my-2 p-4 mb-4 bg-white')}>

                                <div style={
                                    {
                                        borderBottom: "1px solid #ccc",
                                        paddingBottom: "10px",
                                        marginBottom: "10px"
                                    }
                                }
                                    className="flex items-center justify-between gap-1 mb-1">

                                    {transaction?.transport_id === 4 ? (
                                        isReviewed ? (
                                            <button onClick={() => handleToggleCmt(transaction.product_id, transaction.classify, transaction.id)} className={style.review__product}>
                                                Đánh giá lại
                                            </button>
                                        ) : (
                                            <button onClick={() => handleToggleCmt(transaction.product_id, transaction.classify, transaction.id)} className={style.cmt}>
                                                Bình luận
                                            </button>
                                        )
                                    ) : (
                                        <div style={{ width: "30%" }}></div>
                                    )}
                                    <div className="flex items-center justify-end gap-2">
                                        <div className={style.status__purchase}>
                                            <CarRepairIcon style={{ fontSize: 30 }} />
                                            <span>{transaction?.transport['status_transport']}</span>
                                        </div>
                                        <div className={style.total__price}>Vận chuyển</div>
                                    </div>
                                </div>
                                <div className={clsx(style.list__product, 'flex items-center justify-between py-3 mt-2')}>
                                    <div style={{
                                        width: "80%",
                                    }}
                                        className={clsx(style.product__desc, 'flex items-center justify-start gap-2')}>
                                        <Image src={transaction.image_product} alt="product" width={80} height={80} />
                                        <div className="flex flex-col gap-1 justify-start">
                                            <h2 style={{
                                                width: "80%",

                                            }}>{transaction?.product_name}</h2>
                                            <div>Phân loại hàng:
                                                <span style={{
                                                    textTransform: "capitalize"
                                                }}>{transaction?.classify}</span>
                                            </div>
                                            <div className={style.quantity}>
                                                x
                                                <span>{transaction?.quantity}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div style={{
                                        width: "20%",
                                        display: "flex",
                                        justifyContent: "flex-end"
                                    }} className={style.total__price}>
                                        <span> đ{formatCurrency(+transaction?.total_price)}</span>
                                    </div>
                                </div>


                            </div>
                        )
                    })}
                </div>
                {isReviewBoxVisible ? (
                    <Box className="fixed left-1/2 top-1/2" style={{ zIndex: "9999999" }}>
                        <Box
                            style={{
                                zIndex: "999999",
                                maxHeight: "400px",
                                minWidth: "450px",
                            }}
                            className="bg-white absolute -translate-x-1/2 -translate-y-1/2 rounded-md flex flex-col p-4 gap-4"
                            ref={cmtRef}
                        >
                            <form onSubmit={handleAddReview} className="flex flex-col gap-3">
                                <div>
                                    {[1, 2, 3, 4, 5].map((star) => (
                                        <span key={star} onClick={() => handleClickRate(star)}>
                                            {star <= rating ? <StarIcon style={{
                                                color: "#ee4d2d"
                                            }} /> : <StarBorderIcon />}
                                        </span>
                                    ))}
                                </div>
                                <Box>
                                    <Textarea
                                        label="Đánh giá của bạn"
                                        placeholder="Nhập đánh giá của bạn về sản phẩm"
                                        className="w-full"
                                        name="review"
                                    />
                                </Box>
                                <div className="flex items-center justify-between">
                                    <Button
                                        variant="contained"
                                        className="bg-gray-500 w-fit normal-case"
                                        color="error"
                                        onClick={hanldeClickExit}

                                    >
                                        Exit
                                    </Button>
                                    <Button
                                        variant="contained"
                                        type="submit"
                                        className="bg-blue-500 w-fit normal-case"

                                    >
                                        Gửi đánh giá
                                    </Button>
                                </div>

                            </form>

                        </Box>
                        <Box className="bg-gray-400 opacity-50 w-screen h-screen fixed inset-0" />
                    </Box>
                ) : null
                }
            </div>
            <Footer />
            <ToastContainer />
        </Fragment >
    )
}