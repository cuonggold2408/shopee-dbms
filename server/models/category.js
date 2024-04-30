'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Category extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {

      Category.hasMany(models.Productline, {
        foreignKey: 'category_id', // Khóa ngoại của ProductLine trỏ đến khóa chính của Category
        as: 'productLines' // Đặt biệt danh cho mối quan hệ, không bắt buộc
      });

      // define association here
      Category.hasMany(models.Productline, { foreignKey: 'category_id' })
    }
  }
  Category.init({
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER
    },
    category_name: {
      type: DataTypes.STRING(100)
    },
    category_image: {
      type: DataTypes.STRING(255)
    }
  }, {
    sequelize,
    modelName: 'Category',
    tableName: 'categories',
    createdAt: 'created_at',
    updatedAt: 'updated_at'
  });
  return Category;
};