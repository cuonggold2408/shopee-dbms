import Product from "./Product";

export const metadata = {
  title: "Product",
  description: "Trang chi tiết sản phẩm",
};

export default function ProductPage({ params }) {
  const { id } = params;
  return <Product id={id} />;
}

