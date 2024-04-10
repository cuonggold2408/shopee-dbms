import React from 'react';
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import styles from "./carousel.css";
import Image from "next/image";
import image1 from "../../../../../public/image/image-1.jpg"
import image2 from "../../../../../public/image/image-2.png"
import image3 from "../../../../../public/image/image-3.jpg"
const NextArrow = ({ className, style, onClick }) => (
    <div
        className={className}
        style={{ ...style, display: "block", color: "black", right: "10px" }}
        onClick={onClick}
    >
        &gt;
    </div>
);
const PrevArrow = ({ className, style, onClick }) => (
    <div
        className={className}
        style={{ ...style, display: "block", color: "black", left: "10px", zIndex: "1" }}
        onClick={onClick}
    >
        &lt;
    </div>
);

function Carousel({ className }) {
    const settings = {
        dots: true,
        infinite: true,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        swipe: true, // Enable swipe
        arrows: true, // Enable arrows
        nextArrow: <NextArrow />,
        prevArrow: <PrevArrow />,
    };
    return (
        <Slider style={{ height: "100%" }} {...settings} className={className}>
            <div className='h-full'>
                <Image className='h-full' src={image1} alt="Image 1" />
            </div>
            <div className='h-full'>
                <Image className='h-full' src={image2} alt="Image 2" />
            </div>
            <div className='h-full'>
                <Image className='h-full' src={image3} alt="Image 3" />
            </div>
        </Slider>
    );
}
// khoai pheets aays chu
// ảnh bé đâu, code cơ 2 cái giống nhau đấy , code nó nằm ở đâu css chứ gì, code 2 ảnh đó ý à 
export default Carousel;

// ko bt div day sinh tu dau ra