import React from 'react';
import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';
// import './slider.css';
import styles from './slider.module.css';
import { Fragment } from 'react';
import ImgTest from '../../../../public/image/product.jpg';
export default function SliderComponent({ onImageHover }) {
    const settings = {
        lazyLoad: 'ondemand',
        slidesToShow: 5,
        slidesToScroll: 1,
        infinite: false,
        swipe: false,
    };

    console.log("styles: ", styles);

    return (

        <Slider {...settings} className={styles['slick-slider']} >
            <div  >
                <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lscndw3ovxqx90_tn" onMouseOver={() => onImageHover(ImgTest)} />
            </div>
            <div >
                <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llxe6fzh4uzj8b_tn" onMouseOver={() => onImageHover(ImgTest)} />
            </div>
            <div >
                <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llxe6fzh92ovfd_tn" onMouseOver={() => onImageHover(ImgTest)} />
            </div>
            <div >
                <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llxe7xfyqz1b04_tn" onMouseOver={() => onImageHover(ImgTest)} />
            </div>
            <div >
                <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llxe7xfyqz1b04_tn" alt="" onMouseOver={() => onImageHover(ImgTest)} />
            </div>

        </Slider>
    );
}