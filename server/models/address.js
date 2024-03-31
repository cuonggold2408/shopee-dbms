'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Address extends Model {

    static associate(models) {
      // mối quan hệ nhiều-nhiều với User thông qua UserAddress
      Address.belongsToMany(models.User, { through: models.UserAddress, foreignKey: 'address_id', otherKey: 'user_id' });
    }

    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Address.init({
    address_id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER
    },
    address_line: {
      type: DataTypes.STRING(255)
    },
    phone_receiver: {
      type: DataTypes.STRING(255)
    },
    name_receiver: {
      type: DataTypes.STRING(100)
    },
    provine: {
      type: DataTypes.STRING(100)
    },
    default_address: {
      type: DataTypes.BOOLEAN
    },
  }, {
    sequelize,
    modelName: 'Address',
    tableName: 'addresses',
    createAt: 'create_at',
    updateAt: "update_at"
  });
  return Address;
};