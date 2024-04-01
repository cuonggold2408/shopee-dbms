'use strict';
const { Model } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    static associate(models) {
      // Mô hình User có mối quan hệ một-nhiều với mô hình Address
      User.hasMany(models.Address, { foreignKey: 'users_id' });
    }
  }

  User.init(
    {
      users_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      username: {
        type: DataTypes.STRING(30),
      },
      phone_number: {
        type: DataTypes.INTEGER,
      },
      email: {
        type: DataTypes.STRING(50),
      },
      password: {
        type: DataTypes.STRING(100),
      },
    },
    {
      sequelize,
      modelName: 'User',
      tableName: 'users',
      createdAt: 'created_at',
      updatedAt: 'updated_at',
    }
  );

  return User;
};
