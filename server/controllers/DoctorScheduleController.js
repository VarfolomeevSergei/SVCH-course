const { DoctorSchedule, Doctor } = require('../models/models');
const { validationResult } = require('express-validator');
const mongoose = require('mongoose');
class DoctorScheduleController {
    async create(req, res) {
        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                return res.status(400).json({ errors: errors.array() });
            }

            const { doctorId, dayOfWeek, startTime, endTime } = req.body;

            if (dayOfWeek < 1 || dayOfWeek > 5) {
                return res.status(400).json({ message: 'День недели должен быть с 1 (Понедельник) по 5 (Пятница)' });
            }

            // Находим врача в базе
            const doctor = await mongoose.models.Doctor.findById(doctorId);
            if (!doctor) {
                return res.status(404).json({ message: 'Врач не найден' });
            }

            if (startTime >= endTime) {
                return res.status(400).json({ message: 'Время начала должно быть раньше времени окончания' });
            }

            // Создаем новое расписание
            const schedule = new DoctorSchedule({
                doctorId,
                dayOfWeek,
                startTime,
                endTime,
            });

            await schedule.save();

            res.status(201).json({
                id: schedule._id,
                doctorId: schedule._doctorId,
                dayOfWeek: schedule.dayOfWeek,
                startTime: schedule.startTime,
                endTime: schedule.endTime,
                createdAt: schedule.createdAt,
                updatedAt: schedule.updatedAt,
            });
        } catch (error) {
            console.error('Ошибка при создании расписания врача:', error);
            res.status(500).json({ message: 'Ошибка сервера' });
        }
    }

    async update(req, res) {
        try {
            const { doctorId, dayOfWeek, startTime, endTime } = req.body;
            const scheduleId = req.params._id;

            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                return res.status(400).json({ errors: errors.array() });
            }

            const schedule = await mongoose.models.DoctorSchedule.findById(scheduleId);
            if (!schedule) {
                return res.status(404).json({ message: 'Расписание не найдено' });
            }

            if (doctorId && doctorId !== schedule.doctorId.toString()) {
                const doctor = await mongoose.models.Doctor.findById(doctorId);
                if (!doctor) {
                    return res.status(404).json({ message: 'Врач не найден' });
                }
            }

            if (dayOfWeek !== undefined) {
                if (dayOfWeek < 1 || dayOfWeek > 5) {
                    return res.status(400).json({ message: 'День недели должен быть с 1 (Понедельник) по 5 (Пятница)' });
                }
            }

            if (startTime && endTime && startTime >= endTime) {
                return res.status(400).json({ message: 'Время начала должно быть раньше времени окончания' });
            }

            // Обновляем расписание
            schedule.doctorId = doctorId || schedule.doctorId;
            schedule.dayOfWeek = dayOfWeek !== undefined ? dayOfWeek : schedule.dayOfWeek;
            schedule.startTime = startTime || schedule.startTime;
            schedule.endTime = endTime || schedule.endTime;

            await schedule.save();

            res.json({
                id: schedule._id,
                doctorId: schedule.doctorId,
                dayOfWeek: schedule.dayOfWeek,
                startTime: schedule.startTime,
                endTime: schedule.endTime,
                createdAt: schedule.createdAt,
                updatedAt: schedule.updatedAt,
            });
        } catch (error) {
            console.error('Ошибка при обновлении расписания врача:', error);
            res.status(500).json({ message: 'Ошибка сервера' });
        }
    }

    async findOne(req, res) {
        try {
            const schedule = await mongoose.models.DoctorSchedule.findById(req.params.id).populate('doctorId');
            if (!schedule) {
                return res.status(404).json({ message: 'Расписание не найдено' });
            }
            res.json(schedule);
        } catch (error) {
            console.error('Ошибка при получении расписания врача:', error);
            res.status(500).json({ message: 'Ошибка сервера' });
        }
    }

    async findAll(req, res) {
        try {
            const schedules = await mongoose.models.DoctorSchedule.find().populate('doctorId');
            res.json(schedules);
        } catch (error) {
            console.error('Ошибка при получении списка расписаний:', error);
            res.status(500).json({ message: 'Ошибка сервера' });
        }
    }

    async delete(req, res) {
        try {
            const scheduleId = req.params.id;

            const schedule = await mongoose.models.DoctorSchedule.findById(scheduleId);
            if (!schedule) {
                return res.status(404).json({ message: 'Расписание не найдено' });
            }

            await mongoose.models.Schedule.deleteOne({_id: scheduleId});

            res.status(200).json({ message: 'Расписание успешно удалено' });
        } catch (error) {
            console.error('Ошибка при удалении расписания врача:', error);
            res.status(500).json({ message: 'Ошибка сервера' });
        }
    }
}

module.exports = new DoctorScheduleController();

// const { DoctorSchedule, Doctor } = require('../models/models'); 
// const { validationResult } = require('express-validator');

// class DoctorScheduleController {
//     async create(req, res) {
//         try {
//             const errors = validationResult(req);
//             if (!errors.isEmpty()) {
//                 return res.status(400).json({ errors: errors.array() });
//             }

//             const { doctorId, dayOfWeek, startTime, endTime } = req.body;

            
//             if (dayOfWeek < 1 || dayOfWeek > 5) {
//                 return res.status(400).json({ message: 'День недели должен быть с 1 (Понедельник) по 5 (Пятница)' });
//             }

//             const doctor = await Doctor.findByPk(doctorId);
//             if (!doctor) {
//                 return res.status(404).json({ message: 'Врач не найден' });
//             }

//             if (startTime >= endTime) {
//                 return res.status(400).json({ message: 'Время начала должно быть раньше времени окончания' });
//             }

//             const schedule = await DoctorSchedule.create({
//                 doctorId,
//                 dayOfWeek,
//                 startTime,
//                 endTime,
//             });

//             res.status(201).json({
//                 id: schedule.id,
//                 doctorId: schedule.doctorId,
//                 dayOfWeek: schedule.dayOfWeek,
//                 startTime: schedule.startTime,
//                 endTime: schedule.endTime,
//                 createdAt: schedule.createdAt,
//                 updatedAt: schedule.updatedAt,
//             });
//         } catch (error) {
//             console.error('Ошибка при создании расписания врача:', error);
//             res.status(500).json({ message: 'Ошибка сервера' });
//         }
//     }

//     async update(req, res) {
//         try {
//             const { doctorId, dayOfWeek, startTime, endTime } = req.body;
//             const scheduleId = req.params.id;

//             const errors = validationResult(req);
//             if (!errors.isEmpty()) {
//                 return res.status(400).json({ errors: errors.array() });
//             }

//             const schedule = await DoctorSchedule.findByPk(scheduleId);
//             if (!schedule) {
//                 return res.status(404).json({ message: 'Расписание не найдено' });
//             }

//             if (doctorId && doctorId !== schedule.doctorId) {
//                 const doctor = await Doctor.findByPk(doctorId);
//                 if (!doctor) {
//                     return res.status(404).json({ message: 'Врач не найден' });
//                 }
//             }

//             if (dayOfWeek !== undefined) {
                
//                 if (dayOfWeek < 1 || dayOfWeek > 5) {
//                     return res.status(400).json({ message: 'День недели должен быть с 1 (Понедельник) по 5 (Пятница)' });
//                 }
//             }

//             if (startTime && endTime && startTime >= endTime) {
//                 return res.status(400).json({ message: 'Время начала должно быть раньше времени окончания' });
//             }

//             await schedule.update({
//                 doctorId: doctorId || schedule.doctorId,
//                 dayOfWeek: dayOfWeek !== undefined ? dayOfWeek : schedule.dayOfWeek,
//                 startTime: startTime || schedule.startTime,
//                 endTime: endTime || schedule.endTime,
//             });

//             res.json({
//                 id: schedule.id,
//                 doctorId: schedule.doctorId,
//                 dayOfWeek: schedule.dayOfWeek,
//                 startTime: schedule.startTime,
//                 endTime: schedule.endTime,
//                 createdAt: schedule.createdAt,
//                 updatedAt: schedule.updatedAt,
//             });
//         } catch (error) {
//             console.error('Ошибка при обновлении расписания врача:', error);
//             res.status(500).json({ message: 'Ошибка сервера' });
//         }
//     }

//     async findOne(req, res) {
//         try {
//             const schedule = await DoctorSchedule.findByPk(req.params.id, {
//                 include: [{
//                     model: Doctor,
//                     attributes: ['id', 'login', 'firstName', 'lastName', 'specialization'],
//                 }],
//             });
//             if (!schedule) {
//                 return res.status(404).json({ message: 'Расписание не найдено' });
//             }
//             res.json(schedule);
//         } catch (error) {
//             console.error('Ошибка при получении расписания врача:', error);
//             res.status(500).json({ message: 'Ошибка сервера' });
//         }
//     }

//     async findAll(req, res) {
//         try {
//             const schedules = await DoctorSchedule.findAll({
//                 include: [{
//                     model: Doctor,
//                     attributes: ['id', 'login', 'firstName', 'lastName', 'specialization'],
//                 }],
//             });
//             res.json(schedules);
//         } catch (error) {
//             console.error('Ошибка при получении списка расписаний:', error);
//             res.status(500).json({ message: 'Ошибка сервера' });
//         }
//     }

//     async delete(req, res) {
//         try {
//             const scheduleId = req.params.id;

//             const schedule = await DoctorSchedule.findByPk(scheduleId);
//             if (!schedule) {
//                 return res.status(404).json({ message: 'Расписание не найдено' });
//             }

//             await schedule.destroy();

//             res.status(200).json({ message: 'Расписание успешно удалено' });
//         } catch (error) {
//             console.error('Ошибка при удалении расписания врача:', error);
//             res.status(500).json({ message: 'Ошибка сервера' });
//         }
//     }
// }

// module.exports = new DoctorScheduleController();
