'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ClassifyOption extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      ClassifyOption.belongsTo(models.ProductClassify, {foreignKey: "classify_id"});
    }
  }
  ClassifyOption.init({
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER,
    },
    classify_id: {
      type: DataTypes.INTEGER,
      references:{
        model:{
          tableName:"productClassifies",
          key:"id"
        }
      } 
    },
    option_name: {
      type: DataTypes.STRING(200)
    },
  }, {
    sequelize,
    modelName: 'ClassifyOption',
    tableName: 'classifyOptions',
    createdAt: 'created_at',
    updatedAt: 'updated_at'
  });
  return ClassifyOption;
};