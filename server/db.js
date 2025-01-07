// const { Sequelize } = require('sequelize');

// const DB_NAME = process.env.DB_NAME || 'medical_center';
// const DB_USER = process.env.DB_USER || 'postgres';
// const DB_PASSWORD = process.env.DB_PASSWORD || '';
// const DB_HOST = process.env.DB_HOST || 'localhost';
// const DB_PORT = process.env.DB_PORT || 5000;

// const sequelize = new Sequelize(DB_NAME, DB_USER, DB_PASSWORD, {
//     host: DB_HOST,
//     port: DB_PORT,
//     dialect: 'postgres',
// });

// module.exports = sequelize;
const mongoose = require('mongoose');

const DB_NAME = process.env.DB_NAME || 'medical_center';
const DB_HOST = process.env.DB_HOST || 'localhost';
const DB_PORT = process.env.DB_PORT || 27017; // Стандартный порт для MongoDB

const connectDB = async () => {
    try {
        await mongoose.connect(`${DB_URI}`, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        });
        console.log('MongoDB connected');
    } catch (error) {
        console.error('MongoDB connection error:', error);
        process.exit(1);
    }
};

module.exports = connectDB;