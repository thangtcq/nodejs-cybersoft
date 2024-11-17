// Bước 1 : npm init
// Bước 2 : npm i express

// Reload server
// Cách 1 : dùng thư viện nodemon
// Cách 2 : dùng --watch của node hỗ trợ

import express from "express";
import cors from "cors";
import rootRouter from "./src/routers/root.router.js";

const app = express();

// Sử dụng middleware chuyển JSON sang đối tượng JS (object, ...)
app.use(express.json());
app.use(
  cors({
    origin: [`http://localhost:5173`],
  })
);
app.use(rootRouter);

const PORT = 3069;
app.listen(PORT, () => {
  console.log(`Server online at port ${PORT}`);
});

// 4 cách nhận dữ liệu
/**
 * Query Parameters
 * Nhận biết : bắt đầu bằng dấu chấm hỏi (?) phân tách các key với nhau bằng dấu &
 * http://localhost:3069/query?email=thang@gmail.com&name=thang
 * Thường dùng : phân trang, lọc, search, ....
 */
app.get(`/query`, (request, response, next) => {
  const query = request.query;
  console.log({ query });
  response.json(`Query Parameters`);
});

/**
 * Patch Parameters
 * Nhận biết : dùng /:tenbien
 * http://localhost:3069/query?email=thang@gmail.com&name=thang
 * Thường dùng : khi muốn lấy dữ liệu cụ thể của một đối tượng
 */
app.get(`/patch/:id`, (request, response, next) => {
  const params = request.params;
  console.log(params);
  response.json(`Patch Paramerters`);
});

/**
 * Body
 * Phải dùng app.use(express.json());
 */
app.post(`/body`, (request, response, next) => {
  const body = request.body;
  console.log(body);
  response.json(`Body`);
});

/**
 * Headers
 */
app.get(`/headers`, (request, response, next) => {
  const headers = request.headers;
  console.log({ headers });
  response.json(`headers`);
});
