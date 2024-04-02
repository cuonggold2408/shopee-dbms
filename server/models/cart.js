'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Cart extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Cart.belongsTo(models.User, {foreignKey: 'users_id'});
    }
  }
  Cart.init({
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER
    },
    users_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
        references: {
          model: 'User', // Tham chiếu đến bảng User
          key: 'users_id' // Tham chiếu đến khóa chính của bảng User
        },
        onUpdate: 'CASCADE', // Cập nhật các address khi user được cập nhật
        onDelete: 'CASCADE' // Xóa các address khi user được xóa
    }
  }, {
    sequelize,
    modelName: 'Cart',
    tableName: 'carts',
    createdAt: 'created_at',
    updatedAt: 'updated_at',
  });
  return Cart;
};