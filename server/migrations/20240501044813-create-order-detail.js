'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('order_detail', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      cart_id: {
        type: Sequelize.INTEGER,
      },
      product_id: {
        type: Sequelize.INTEGER,
      },
      image_product: {
        type: Sequelize.TEXT,
      },
      product_name: {
        type: Sequelize.TEXT,
      },
      product_price: {
        type: Sequelize.STRING,
      },
      quantity: {
        type: Sequelize.INTEGER,
      },
      classify: {
        type: Sequelize.TEXT,
      },

      total_price: {
        type: Sequelize.STRING,
      },

      bought: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
      },
      created_at: {
        allowNull: false,
        type: Sequelize.DATE,
      },
      updated_at: {
        allowNull: false,
        type: Sequelize.DATE,
      },
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('order_detail');
  }
};