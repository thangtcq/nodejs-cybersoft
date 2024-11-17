import Sequelize from "sequelize";

// Sequelize
const sequelize = new Sequelize(`demo_cybermedia`, `root`, `1234`, {
  host: `localhost`,
  port: `3307`,
  dialect: `mysql`,
  // logging: false,
});

// Kiểm tra kết nối
sequelize
  .authenticate()
  .then(() => {
    console.log(`Kết nối db thành công`);
  })
  .catch(() => {
    console.log(err);
    console.log(`Kết nối db không thành công`);
  });

export default sequelize;
