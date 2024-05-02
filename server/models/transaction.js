"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Transaction extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Transaction.belongsTo(models.Transport, { as: 'transport', foreignKey: 'transport_id' });
    }
  }
  Transaction.init(
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
      transport_id: {
        type: DataTypes.STRING,
        defaultValue: 1,
        onUpdate: "CASCADE",
        references: {
          model: "transports",
          key: "id",
        },
      },
      created_at: {
        allowNull: false,
        type: DataTypes.DATE,
      },
      updated_at: {
        allowNull: false,
        type: DataTypes.DATE,
      },
    },
    {
      sequelize,
      modelName: "Transaction",
      tableName: "transactions",
      createdAt: "created_at",
      updatedAt: "updated_at",
    }
  );
  return Transaction;
};
