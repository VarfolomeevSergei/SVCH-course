const sequelize = require('../db')
const {DataTypes} = require('sequelize')

const Service = sequelize.define('Service', {
    Id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Name: { type: DataTypes.STRING, allowNull: false },
    Price: { type: DataTypes.DECIMAL },
    Specialization: { type: DataTypes.STRING },
  },
  {timestamps: false});

  const Department = sequelize.define('Department', {
    Id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Name: { type: DataTypes.STRING, allowNull: false },
    Specialization: { type: DataTypes.STRING },
  },
  {timestamps: false});
const Doctor = sequelize.define('Doctor', {
    Id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Name: { type: DataTypes.STRING, allowNull: false },
    Specialization: { type: DataTypes.STRING },
  },
  {timestamps: false});

  Department.hasMany(Doctor)
  Doctor.belongsTo(Department)

  Department.hasMany(Service)
  Service.belongsTo(Department)
  
module.exports = {
    Service,
    Department,
    Doctor

};