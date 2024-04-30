"use client";

import React from "react";
import { Fragment } from "react";
import clsx from "clsx";
import style from "./categories.module.css";
import Image from "next/image";
import { useState, useEffect } from "react";
import { client } from "@/app/helpers/fetch_api/client";
import Link from "next/link";
import { useRouter } from "next/navigation";

export default function Categories() {
    const router = useRouter();
    const [category, setCategory] = useState([]);
    useEffect(() => {
        async function fetchCategory() {
            try {
                const response = await client.get("/products/category");
                setCategory(response.data.data);
                console.log("Category: ", response.data.data);
            } catch (error) {
                console.error("Failed to fetch category: ", error);
            }
        }
        fetchCategory();
    }, []);

    const handleBoxClick = async (categoryName) => {
        console.log("categoryName: ", categoryName);
        router.push(`/category/${categoryName}`);
    };

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
                    {category?.map(category => (
                        console.log("category là : ", category),
                        <div
                            key={category.id}
                            className={clsx(
                                style["category-item"],
                                "flex items-center justify-center"
                            )}
                            onClick={() => handleBoxClick(category?.category_name.replaceAll(' ', '-'))}
                        >
                            <div className="flex items-center flex-col ">
                                <Image
                                    src={category?.category_image}
                                    alt={category?.category_name}
                                    width={100}
                                    height={100}
                                />
                                <h3 className="p-1">{category?.category_name}</h3>
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </Fragment>
    );
}