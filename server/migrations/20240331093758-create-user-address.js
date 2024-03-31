'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('useraddresses', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      user_id:{
        type:Sequelize.INTEGER,
        references:{
          model:{
            tableName:"users",
          },
          key:"users_id"
        }
     },
     address_id:{
      type: Sequelize.INTEGER,
      references: {
        model: {
          tableName:"addresses"
        },
        key:"address_id"
      }
     },
      created_at: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updated_at: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('useraddresses');
  }
};