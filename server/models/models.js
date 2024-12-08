const sequelize = require('../db')
const {DataTypes} = require('sequelize')

const Users = sequelize.define('Users', {
  Id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  email: { type: DataTypes.STRING, allowNull: false },
  password: { type: DataTypes.STRING, allowNull: false },
  Role: { type: DataTypes.STRING, allowNull: false },
  },
  {timestamps: false});

  const Diagnose = sequelize.define('Diagnose', {
    Id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Diagnose: { type: DataTypes.STRING, allowNull: false },
    Conclusion: { type: DataTypes.STRING },
  },
  {timestamps: false});

  const DoctorSchedule = sequelize.define('DoctorSchedule', {
    Id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Day_of_week: { type: DataTypes.STRING, allowNull: false },
    Start: { type: DataTypes.TIME },
    End: { type: DataTypes.TIME },
  },
  {timestamps: false});

  const Appointment = sequelize.define('Appointment', {
    Id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Date: { type: DataTypes.DATE, allowNull: false },
    Time: {type: DataTypes.TIME}
  },
  {timestamps: false});

  const Patient = sequelize.define('Patient', {
    Id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Name: { type: DataTypes.STRING, allowNull: false },
    BirthDate: { type: DataTypes.DATE },
    Number: { type: DataTypes.STRING },
    Adress: { type: DataTypes.STRING },
  },
  {timestamps: false});

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
    // img: {type:DataTypes.STRING, allowNull: false}
  },
  {timestamps: false});




  Doctor.hasMany(Users);
  Users.belongsTo(Doctor);

  Patient.hasMany(Users);
  Users.belongsTo(Patient);

  Doctor.hasMany(Diagnose);
  Diagnose.belongsTo(Doctor);

  Patient.hasMany(Diagnose);
  Diagnose.belongsTo(Patient);
  
  Doctor.hasMany(DoctorSchedule);
  DoctorSchedule.belongsTo(Doctor);
  
  Department.hasMany(Service);
  Service.belongsTo(Department);
  
  Doctor.hasMany(Appointment);
  Appointment.belongsTo(Doctor);

  Patient.hasMany(Appointment);
  Appointment.belongsTo(Patient);

  Service.hasMany(Appointment);
  Appointment.belongsTo(Service);
  
  Department.hasMany(Doctor);
  Doctor.belongsTo(Department);

  module.exports = {
    Users,
    Diagnose,
    Appointment,
    Doctor,
    Patient,
    Service,
    Department, 
    DoctorSchedule
  };