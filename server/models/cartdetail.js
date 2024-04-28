"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class CartDetail extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  CartDetail.init(
    {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
      },
      cart_id: {
        type: DataTypes.INTEGER,
      },
      product_id: {
        type: DataTypes.INTEGER,
      },
      image_product: {
        type: DataTypes.TEXT,
      },
      product_name: {
        type: DataTypes.TEXT,
      },
      product_price: {
        type: DataTypes.STRING,
      },
      quantity: {
        type: DataTypes.INTEGER,
      },
      classify: {
        type: DataTypes.TEXT,
      },
      total_price: {
        type: DataTypes.STRING,
      },
      is_selected: {
        type: DataTypes.BOOLEAN,
        defaultValue: true,
      },
    },
    {
      sequelize,
      modelName: "CartDetail",
      tableName: "cart_detail",
      createdAt: "created_at",
      updatedAt: "updated_at",
    }
  );
  return CartDetail;
};
