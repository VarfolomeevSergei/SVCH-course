
// 'use strict';

// const mongoose = require('mongoose');
// const path = require('path');
// const env = process.env.NODE_ENV || 'development';
// const config = require(path.join(__dirname, '/../index.js'))[env]; // Настройки для Mongoose

// let mongoURI;

// // Используем переменную окружения для строки подключения
// if (config.use_env_variable) {
//     mongoURI = process.env[config.use_env_variable];
// } else {
//     mongoURI = `mongodb://${config.host}:${config.port}/${config.database}`;
// }

// const connectDB = async () => {
//     try {
//         await mongoose.connect(mongoURI, {
//             useNewUrlParser: true,
//             useUnifiedTopology: true,
//         });
//         console.log('Подключение к MongoDB успешно');
//     } catch (error) {
//         console.error('Ошибка подключения к MongoDB:', error);
//         process.exit(1);
//     }
// };

// // Экспортируем модели
// const models = require('./models'); // Предполагается, что ваши модели экспортируются из этого файла

// const db = {
//     mongoose,
//     connectDB,
//     models,
// };

// module.exports = db;
// 'use strict';

// const Sequelize = require('sequelize');
// const path = require('path');
// const env = process.env.NODE_ENV || 'development';
// const config = require(__dirname + '/../sequelize.config.js')[env];

// let sequelize;
// if (config.use_env_variable) {
//     sequelize = new Sequelize(process.env[config.use_env_variable], config);
// } else {
//     sequelize = new Sequelize(config.database, config.username, config.password, config);
// }

// const models = require('./models')(sequelize, Sequelize.DataTypes);

// const db = {
//     ...models,
//     sequelize,
//     Sequelize,
// };

// module.exports = db;