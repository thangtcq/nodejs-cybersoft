import mysql2 from "mysql2";

// MySQL2
const pool = mysql2
  .createPool({
    host: `localhost`,
    user: `root`,
    password: `1234`,
    port: `3307`,
    database: `demo_cybermedia`,
    // Lấy đúng thời gian đã lưu trong db
    timezone: `Z`,
  })
  .promise();

  export default pool