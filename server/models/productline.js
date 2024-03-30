'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Productline extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Productline.init({
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER
    },
    category_id: {
      type: DataTypes.INTEGER
    },
    productline_name:{
      type:DataTypes.STRING(200),
    }
  }, {
    sequelize,
    modelName: 'Productline',
    tableName: 'productlines',
    createdAt: 'created_at',
    updatedAt: 'updated_at'
  });
  return Productline;
};