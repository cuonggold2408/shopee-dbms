'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Transport extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Transport.hasMany(models.Transaction, { foreignKey: 'transport_id' });
    }
  }
  Transport.init({
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER
    },
    status_transport: {
      type: DataTypes.STRING
    },

  }, {
    sequelize,
    modelName: 'Transport',
    tableName: "transports",
    createdAt: "created_at",
    updatedAt: "updated_at"
  });
  return Transport;
};