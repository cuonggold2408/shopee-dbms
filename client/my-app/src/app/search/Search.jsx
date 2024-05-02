"use client";

import { usePathname, useSearchParams } from "next/navigation";
import { Fragment, useEffect, useState } from "react";
import { client } from "../helpers/fetch_api/client";
import Products from "../(home)/main/products/Products";

export default function Search() {
  const [pathName, setPathName] = useState(usePathname());
  const [keyWord, setKeyWord] = useState(useSearchParams().get("keyword"));
  console.log("pathName", pathName);
  console.log("keyword", keyWord);

  return (
    <Fragment>
      <div
        style={{
          width: "100%",
          backgroundColor: "#F5F5F5",
        }}
      >
        <div
          style={{
            width: "80vw",
            margin: "0 auto",
            overflow: "hidden",
          }}
        >
          <Products pathName={pathName} keyWord={keyWord} />
        </div>
      </div>
    </Fragment>
  );
}
