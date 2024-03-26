import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

const showToast = (type, message, callback) => {
  switch (type) {
    case "success":
      toast.success(message, {
        position: toast.POSITION.TOP_RIGHT,
        autoClose: 3000,
      });
      break;
    case "warn":
      toast.warn(message, {
        position: toast.POSITION.TOP_RIGHT,
        autoClose: 3000,
        onClose: callback,
      });
      break;
    case "error":
      toast.error(message, {
        position: toast.POSITION.TOP_RIGHT,
        autoClose: 3000,
      });
      break;
    case "info":
      toast.info(message, {
        position: toast.POSITION.TOP_RIGHT,
        autoClose: 3000,
      });
      break;
    case "confirm":
      toast(
        <div>
          <p style={{ fontSize: "16px" }}>{message}</p>
          <button
            onClick={() => {
              callback();
              toast.dismiss(); // Đóng thông báo sau khi nhấn nút
            }}
            className="p-2 bg-blue-500 hover:bg-blue-600 text-white rounded"
          >
            Xác nhận
          </button>
        </div>,
        {
          position: toast.POSITION.TOP_RIGHT,
          autoClose: false, // Không tự đóng để chờ người dùng nhấn nút
        }
      );
      break;
    default:
      toast(message, {
        position: toast.POSITION.TOP_RIGHT,
        autoClose: 3000,
      });
      break;
  }
};

export default showToast;
