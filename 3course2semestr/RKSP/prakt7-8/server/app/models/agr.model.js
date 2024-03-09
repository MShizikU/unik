module.exports = (sequelize, Sequelize) => {
    const Agr = sequelize.define("agr", {
      name: {
        type: Sequelize.STRING
      },
      status: {
        type: Sequelize.STRING
      }
    });
  
    return Agr;
  };
  