'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
    await queryInterface.addConstraint("transactions", {
      type: 'foreign key',
      name: 'custom_fkey_transport_id',
      fields: ['transport_id'],
      references: {
        table: 'transports',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    })
  },

  async down(queryInterface, Sequelize) {
    /**
     * Add reverting commands here. 
     *
     * Example:
     * await queryInterface.dropTable('users');
     *
     */
    await queryInterface.removeConstraint("transactions", 'custom_fkey_transport_id');
  }
};
