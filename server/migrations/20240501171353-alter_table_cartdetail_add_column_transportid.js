'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
    await queryInterface.addColumn("order_detail",'transport_id',{
      type: Sequelize.INTEGER,
      references:{
        model:{
          tableName: 'order_detail',
        }
      },
      defaultValue: 1,
    })
  },


  async down (queryInterface, Sequelize) {
    /**
     * Add reverting commands here.
     *
     * Example:
     * await queryInterface.dropTable('users');
     */
    await queryInterface.removeColumn("order_detail",'transport_id',{
      type: Sequelize.INTEGER,
    })
  }
};
