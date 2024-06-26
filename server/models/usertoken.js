"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class UserToken extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  UserToken.init(
    {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
      },
      user_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      device_name: {
        type: DataTypes.STRING(100),
      },
      refresh_token: {
        type: DataTypes.STRING(255),
      },
      otp: {
        type: DataTypes.STRING(255),
      },
      expired_otp: {
        type: DataTypes.DATE,
      },
      status: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
      },
    },
    {
      sequelize,
      modelName: "UserToken",
      tableName: "user_tokens",
      createdAt: "created_at",
      updatedAt: "updated_at",
    }
  );
  return UserToken;
};
