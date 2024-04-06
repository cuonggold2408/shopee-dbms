'use strict';
const { Model } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  class Address extends Model {
    static associate(models) {
      // Mô hình Address thuộc về một User
      Address.belongsTo(models.User, { foreignKey: 'users_id' });
    }
  }

  Address.init(
    {
      users_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: 'User', // Tham chiếu đến bảng User
          key: 'users_id' // Tham chiếu đến khóa chính của bảng User
        },
        onUpdate: 'CASCADE', // Cập nhật các address khi user được cập nhật
        onDelete: 'CASCADE' // Xóa các address khi user được xóa
      },
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
    },
    {
      sequelize,
      modelName: 'Address',
      tableName: 'addresses',
      createdAt: 'created_at',
      updatedAt: 'updated_at',
    }
  );

  return Address;
};
