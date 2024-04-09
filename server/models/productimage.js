'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ProductImage extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  ProductImage.init({
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER
    },
    option_id: {
      type: DataTypes.INTEGER,
      references: {
        model:{
          tableName:"classifyoptions",
        },
        key:"id"
      }
    },
    image_link: {
      type:DataTypes.STRING
    },
  }, {
    sequelize,
    modelName: 'ProductImage',
    tableName: 'productimages',
    createdAt: 'created_at',
    updatedAt: 'updated_at',
  });
  return ProductImage;
};