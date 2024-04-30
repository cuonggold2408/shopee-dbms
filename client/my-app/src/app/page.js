"use client";

import { Fragment } from "react";
import Home from "./(home)/Home";
import { ToastContainer } from "react-toastify";
import { NextUIProvider } from "@nextui-org/react";

export default function HomePage() {
  return (
    <Fragment>
      <NextUIProvider>
        <Home />
      </NextUIProvider>
      <ToastContainer />
    </Fragment>
  );
}
