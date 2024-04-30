import Category from "./Category";

export const metadata = {
    title: "Category",
    description: "Trang danh mục sản phẩm",
};

export default function ProductPage({ params }) {
    const { name } = params;
    return <Category name={name} />;
}

