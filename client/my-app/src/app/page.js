import { Fragment } from "react";
import Home from "./(home)/Home";
import { ToastContainer } from "react-toastify";

export default function HomePage() {
  return (
    <Fragment>
      <Home />
      <ToastContainer />
    </Fragment>
  );
}
