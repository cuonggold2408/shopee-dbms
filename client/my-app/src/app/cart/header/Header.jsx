import React from "react";
import clsx from "clsx";
import { Fragment } from "react";
import Image from "next/image";

import styles from "./header.module.css";
import FacebookIcon from '@mui/icons-material/Facebook';
import InstagramIcon from '@mui/icons-material/Instagram';
import LanguageIcon from '@mui/icons-material/Language';
import HelpIcon from '@mui/icons-material/Help';
import SupportAgentIcon from '@mui/icons-material/SupportAgent';
import NotificationsActiveIcon from '@mui/icons-material/NotificationsActive';
import ShoppingCartIcon from '@mui/icons-material/ShoppingCart';
import ShopeeLogo from "../../../../public/image/logo.png";
import SearchIcon from '@mui/icons-material/Search';
import Link from "next/link";

export default function Header() {
    return (
        <Fragment>
            <header>
                <div className={styles.header}>
                    <div className={styles.header__contact}>
                        <div className={styles.container}>
                            <div className={clsx('flex items-center justify-between', styles.box__notification)}>
                                <div className={clsx("flex items-center justify-center gap-2", styles.contact)}>
                                    <div>Kênh người bán</div>
                                    <div>Tải ứng dụng</div>
                                    <div>Kết nối</div>
                                    <FacebookIcon />
                                    <InstagramIcon />
                                </div>
                                <div className={clsx("flex items-center justify-center gap-5", styles.notification)}>
                                    <div className="px-1 flex items-center gap-1">
                                        <NotificationsActiveIcon />
                                        <span>Thông báo</span>
                                    </div>
                                    <div className="px-1 flex items-center gap-1">
                                        <SupportAgentIcon />
                                        <span>Trợ giúp</span>
                                    </div>
                                    <div className="px-1 flex items-center gap-1">
                                        <LanguageIcon />
                                        <span>Ngôn ngữ</span>
                                    </div>
                                    <div>Bách</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className={clsx('bg-white flex items-center', styles.box__search)}>
                        <div className={clsx(styles.container, "flex items-center justify-between")}>
                            <div className="flex items-center justify-center">

                                <Link href="/" className="flex items-center justify-center">
                                    <Image src={ShopeeLogo} alt="logo" width={150} height={75} className="px-2" />
                                    <h2 style={
                                        {
                                            borderLeft: "1px solid #ee4d2d",
                                            padding: "0 8px",
                                            fontSize: "1.5rem",
                                            color: "#ee4d2d"
                                        }
                                    }>Giỏ hàng</h2>
                                </Link>
                            </div>
                            <div>
                                <input type="text" style={{
                                    width: "400px",
                                    height: "43.24px",
                                    padding: "0 10px",
                                    border: "2px solid #ee4d2d"
                                }} />
                                <button className={styles.btn__search}>
                                    <SearchIcon />
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
        </Fragment>
    )
}