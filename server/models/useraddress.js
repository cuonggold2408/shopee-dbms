'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class UserAddress extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  UserAddress.init({
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER
    },
    user_id:{
      type: DataTypes.INTEGER,
      references:{
        model:{
          tableName:"users",
        },
        key:"users_id"
      }
   },
    address_id:{
      type: DataTypes.INTEGER,
      references: {
      model: {
        tableName:"addresses"
      },
      key:"address_id"
    }
   },
  }, {
    sequelize,
    modelName: 'UserAddress',
    tableName: 'useraddresses',
    createdAt: 'created_at',
    updatedAt: 'updated_at'
  });
  return UserAddress;
};