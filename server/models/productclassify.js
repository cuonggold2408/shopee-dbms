'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ProductClassify extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      ProductClassify.belongsTo(models.Product, {foreignKey:"product_id"});
    }
  }
  ProductClassify.init({
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER
    },
    classify_name: {
      allowNull: false,
      type: DataTypes.STRING(200)
    },
    product_id: {
      type: DataTypes.INTEGER,
      references:{
        model:{
          tableName:"products",
          key:"id"
        }
      }
    },
  }, {
    sequelize,
    modelName: 'ProductClassify',
    tableName: 'productClassifies',
    createdAt: 'created_at',
    updatedAt: 'updated_at'
  });
  return ProductClassify;
};