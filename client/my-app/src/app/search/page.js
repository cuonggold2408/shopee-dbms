import { Fragment } from "react";
import Search from "./Search";
import Footer from "../footer/Footer";
import Header from "../(home)/header/Header";

export default function SearchPage() {
  return (
    <Fragment>
      <Header />
      <Search />
      <Footer />
    </Fragment>
  );
}
