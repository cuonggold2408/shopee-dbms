"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Product extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Product.belongsTo(models.Productline, { foreignKey: "productline_id" });
      Product.hasMany(models.ProductClassify, { foreignKey: "product_id" });
    }
  }
  Product.init(
    {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
      },
      productline_id: {
        type: DataTypes.INTEGER,
        references: {
          model: {
            tableName: "productlines",
          },
          key: "id",
        },
      },
      product_name: {
        type: DataTypes.STRING(200),
      },
      description: {
        type: DataTypes.STRING(400),
      },
      quantity_in_stock: {
        type: DataTypes.INTEGER,
      },
      price: {
        type: DataTypes.DECIMAL,
      },
    },
    {
      sequelize,
      modelName: "Product",
      tableName: "products",
      createdAt: "created_at",
      updatedAt: "updated_at",
    }
  );
  return Product;
};
