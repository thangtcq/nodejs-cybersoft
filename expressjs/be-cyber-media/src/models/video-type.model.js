import dataTypes from "sequelize";
import sequelize from "../common/sequelize/connect.sequelize.js";

// Code first
// Model

const videoTypeModel = sequelize.define(
  `video_type`,
  {
    type_id: {
      type: dataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    type_name: {
      type: dataTypes.STRING(255),
      allowNull: false,
    },
    icon: {
      type: dataTypes.STRING(255),
      allowNull: true,
    },
    created_at: {
      type: dataTypes.DATE,
      defaultValue: dataTypes.NOW,
      allowNull: false,
    },
    updated_at: {
      type: dataTypes.DATE,
      defaultValue: dataTypes.NOW,
      allowNull: false,
      onUpdate: dataTypes.NOW,
    },
  },
  {
    tableName: `video_type`,
    // Vì đã có "created_at" và "updated_at" nên sẽ để là false
    timestamps: false,
  }
);

export default videoTypeModel;
