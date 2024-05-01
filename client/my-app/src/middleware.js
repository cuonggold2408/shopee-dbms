import { NextResponse } from "next/server";

export const middleware = async (request) => {
  //Request
  const pathname = request.nextUrl.pathname;

  const accessTokenBoolean = request.cookies.has("access_token");

  const response = NextResponse.next();

  if (
    accessTokenBoolean &&
    (pathname.startsWith("/login") ||
      pathname.startsWith("/register") ||
      pathname.startsWith("/forgot-password"))
  ) {
    const urlHome = new URL("/", request.url);
    return NextResponse.redirect(urlHome);
  }

  // Cho phép request tiếp tục cho các trang được phép
  return response;
};

export const config = {
  matcher: ["/((?!api|_next/static|_next/image|favicon.ico).*)"],
};
