const { Appointment, Doctor, Patient, Service } = require('../models/models');
const { validationResult } = require('express-validator');
const mongoose = require('mongoose');
class AppointmentController {
    async create(req, res) {
        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                return res.status(400).json({ errors: errors.array() });
            }

            const { date, doctorId, patientId, serviceId } = req.body;

            const doctor = await mongoose.models.Doctor.findById(doctorId);
            if (!doctor) {
                return res.status(404).json({ message: 'Врач не найден' });
            }

            const patient = await mongoose.models.Patient.findById(patientId);
            if (!patient) {
                return res.status(404).json({ message: 'Пациент не найден' });
            }

            const service = await mongoose.models.Service.findById(serviceId);
            if (!service) {
                return res.status(404).json({ message: 'Услуга не найдена' });
            }

            if (new Date(date) <= new Date()) {
                return res.status(400).json({ message: 'Дата приема должна быть в будущем' });
            }

            const conflictingAppointment = await mongoose.models.Appointment.findOne({
                doctorId,
                date,
            });
            if (conflictingAppointment) {
                return res.status(400).json({ message: 'Врач уже занят в указанное время' });
            }

            const appointment = new Appointment({
                date,
                doctorId,
                patientId,
                serviceId,
            });

            await appointment.save();

            return res.status(201).json({
                id: appointment._id, // Используем _id вместо id
                date: appointment.date,
                doctorId: appointment.doctorId,
                patientId: appointment.patientId,
                serviceId: appointment.serviceId,
                createdAt: appointment.createdAt,
                updatedAt: appointment.updatedAt,
            });
        } catch (error) {
            console.error('Ошибка при создании приема:', error);
            return res.status(500).json({ message: 'Ошибка сервера' });
        }
    }

    async findOne(req, res) {
        try {
            const appointment = await mongoose.models.Appointment.findById(req.params.id)
                .populate('doctorId', 'id firstName lastName specialization')
                .populate('patientId', 'id firstName lastName phoneNumber');
                
            if (!appointment) {
                return res.status(404).json({ message: 'Прием не найден' });
            }
            res.json(appointment);
        } catch (error) {
            console.error('Ошибка при получении приема:', error);
            res.status(500).json({ message: 'Ошибка сервера' });
        }
    }

    async findAll(req, res) {
        try {
            const { doctorId, date, excludeId } = req.query;
            const whereClause = {};

            if (_doctorId) {
                whereClause.doctorId = doctorId;
            }

            if (date) {
                whereClause.date = date;
            }

            if (excludeId) {
                whereClause._id = { $ne: excludeId }; // Используем _id для исключения
            }

            const appointments = await mongoose.models.Appointment.find(whereClause)
                .populate('doctorId', 'id firstName lastName specialization')
                .populate('patientId', 'id firstName lastName phoneNumber')
                .populate('serviceId', 'id name price')
                .sort({ date: 1 });

            res.json(appointments);
        } catch (error) {
            console.error('Ошибка при получении списка приемов:', error);
            res.status(500).json({ message: 'Ошибка сервера' });
        }
    }

    async update(req, res) {
        try {
            const { date, doctorId, patientId } = req.body;
            const appointmentId = req.params.id;

            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                return res.status(400).json({ errors: errors.array() });
            }

            const appointment = await mongoose.models.Appointment.findById(appointmentId);
            if (!appointment) {
                return res.status(404).json({ message: 'Прием не найден' });
            }

            if (doctorId && doctorId !== appointment.doctorId.toString()) {
                const doctor = await mongoose.models.Doctor.findById(doctorId);
                if (!doctor) {
                    return res.status(404).json({ message: 'Врач не найден' });
                }
            }

            if (patientId && patientId !== appointment.patientId.toString()) {
                const patient = await mongoose.models.Patient.findById(patientId);
                if (!patient) {
                    return res.status(404).json({ message: 'Пациент не найден' });
                }
            }

            if (date && new Date(date) <= new Date()) {
                return res.status(400).json({ message: 'Дата приема должна быть в будущем' });
            }

            if (date || doctorId) {
                const newDoctorId = doctorId || appointment.doctorId;
                const newDate = date || appointment.date;

                const conflictingAppointment = await mongoose.models.Appointment.findOne({
                    doctorId: newDoctorId,
                    date: newDate,
                    _id: { $ne: appointmentId }, // Исключаем текущий прием
                });
                if (conflictingAppointment) {
                    return res.status(400).json({ message: 'Врач уже занят в указанное время' });
                }
            }

            appointment.date = date || appointment.date;
            appointment.doctorId = doctorId || appointment.doctorId;
            appointment.patientId = patientId || appointment.patientId;

            await appointment.save();

            res.json({
                id: appointment._id, // Используем _id вместо id
                date: appointment.date,
                doctorId: appointment.doctorId,
                patientId: appointment.patientId,
                createdAt: appointment.createdAt,
                updatedAt: appointment.updatedAt,
            });
        } catch (error) {
            console.error('Ошибка при обновлении приема:', error);
            res.status(500).json({ message: 'Ошибка сервера' });
        }
    }

    async delete(req, res) {
        try {
            const appointmentId = req.params.id;

            const appointment = await mongoose.models.Appointment.findById(appointmentId);
            if (!appointment) {
                return res.status(404).json({ message: 'Прием не найден' });
            }

            await mongoose.models.Appointment.deleteOne({_id: appointmentId});

            res.status(200).json({ message: 'Прием успешно удален' });
        } catch (error) {
            console.error('Ошибка при удалении приема:', error);
            res.status(500).json({ message: 'Ошибка сервера' });
        }
    }
}

module.exports = new AppointmentController();

// const { Appointment, Doctor, Patient, Service } = require('../models/models');
// const { validationResult } = require('express-validator');

// class AppointmentController {
//     async create(req, res) {
//         try {
//             const errors = validationResult(req);
//             if (!errors.isEmpty()) {
//                 return res.status(400).json({ errors: errors.array() });
//             }

            
//             const { date, doctorId, patientId, serviceId } = req.body;

//             const doctor = await Doctor.findByPk(doctorId);
//             if (!doctor) {
//                 return res.status(404).json({ message: 'Врач не найден' });
//             }

//             const patient = await Patient.findByPk(patientId);
//             if (!patient) {
//                 return res.status(404).json({ message: 'Пациент не найден' });
//             }

            
//             const service = await Service.findByPk(serviceId);
//             if (!service) {
//                 return res.status(404).json({ message: 'Услуга не найдена' });
//             }

//             if (new Date(date) <= new Date()) {
//                 return res
//                     .status(400)
//                     .json({ message: 'Дата приема должна быть в будущем' });
//             }

//             const conflictingAppointment = await Appointment.findOne({
//                 where: {
//                     doctorId,
//                     date,
//                 },
//             });
//             if (conflictingAppointment) {
//                 return res
//                     .status(400)
//                     .json({ message: 'Врач уже занят в указанное время' });
//             }

//             const appointment = await Appointment.create({
//                 date,
//                 doctorId,
//                 patientId,
//                 serviceId,
//             });

//             return res.status(201).json({
//                 id: appointment.id,
//                 date: appointment.date,
//                 doctorId: appointment.doctorId,
//                 patientId: appointment.patientId,
//                 serviceId: appointment.serviceId,
//                 createdAt: appointment.createdAt,
//                 updatedAt: appointment.updatedAt,
//             });
//         } catch (error) {
//             console.error('Ошибка при создании приема:', error);
//             return res.status(500).json({ message: 'Ошибка сервера' });
//         }
//     }

//     async findOne(req, res) {
//         try {
//             const appointment = await Appointment.findByPk(req.params.id, {
//                 include: [
//                     {
//                         model: Doctor,
//                         attributes: ['id', 'firstName', 'lastName', 'specialization'],
//                     },
//                     {
//                         model: Patient,
//                         attributes: ['id', 'firstName', 'lastName', 'phoneNumber'],
//                     },
//                 ],
//             });
//             if (!appointment) {
//                 return res.status(404).json({ message: 'Прием не найден' });
//             }
//             res.json(appointment);
//         } catch (error) {
//             console.error('Ошибка при получении приема:', error);
//             res.status(500).json({ message: 'Ошибка сервера' });
//         }
//     }

//     async findAll(req, res) {
//         try {
//             const { doctorId, date, excludeId } = req.query;
//             const whereClause = {};

//             if (doctorId) {
//                 whereClause.doctorId = doctorId;
//             }

//             if (date) {
//                 whereClause.date = date;
//             }

//             if (excludeId) {
//                 whereClause.id = { [Op.ne]: excludeId };
//             }

//             const appointments = await Appointment.findAll({
//                 where: whereClause,
//                 include: [
//                     {
//                         model: Doctor,
//                         attributes: ['id', 'firstName', 'lastName', 'specialization'],
//                     },
//                     {
//                         model: Patient,
//                         attributes: ['id', 'firstName', 'lastName', 'phoneNumber'],
//                     },
//                     {
//                         model: Service,
//                         attributes: ['id', 'name', 'price'],
//                     },
//                 ],
//                 order: [['date', 'ASC']],
//             });
//             res.json(appointments);
//         } catch (error) {
//             console.error('Ошибка при получении списка приемов:', error);
//             res.status(500).json({ message: 'Ошибка сервера' });
//         }
//     }

//     async update(req, res) {
//         try {
//             const { date, doctorId, patientId } = req.body;
//             const appointmentId = req.params.id;

//             const errors = validationResult(req);
//             if (!errors.isEmpty()) {
//                 return res.status(400).json({ errors: errors.array() });
//             }

//             const appointment = await Appointment.findByPk(appointmentId);
//             if (!appointment) {
//                 return res.status(404).json({ message: 'Прием не найден' });
//             }

//             if (doctorId && doctorId !== appointment.doctorId) {
//                 const doctor = await Doctor.findByPk(doctorId);
//                 if (!doctor) {
//                     return res.status(404).json({ message: 'Врач не найден' });
//                 }
//             }

//             if (patientId && patientId !== appointment.patientId) {
//                 const patient = await Patient.findByPk(patientId);
//                 if (!patient) {
//                     return res.status(404).json({ message: 'Пациент не найден' });
//                 }
//             }

//             if (date && new Date(date) <= new Date()) {
//                 return res.status(400).json({ message: 'Дата приема должна быть в будущем' });
//             }

//             if (date || doctorId) {
//                 const newDoctorId = doctorId || appointment.doctorId;
//                 const newDate = date || appointment.date;

//                 const conflictingAppointment = await Appointment.findOne({
//                     where: {
//                         doctorId: newDoctorId,
//                         date: newDate,
//                         id: { [require('sequelize').Op.ne]: appointmentId },
//                     },
//                 });
//                 if (conflictingAppointment) {
//                     return res.status(400).json({ message: 'Врач уже занят в указанное время' });
//                 }
//             }

//             await appointment.update({
//                 date: date || appointment.date,
//                 doctorId: doctorId || appointment.doctorId,
//                 patientId: patientId || appointment.patientId,
//             });

//             res.json({
//                 id: appointment.id,
//                 date: appointment.date,
//                 doctorId: appointment.doctorId,
//                 patientId: appointment.patientId,
//                 createdAt: appointment.createdAt,
//                 updatedAt: appointment.updatedAt,
//             });
//         } catch (error) {
//             console.error('Ошибка при обновлении приема:', error);
//             res.status(500).json({ message: 'Ошибка сервера' });
//         }
//     }

//     async delete(req, res) {
//         try {
//             const appointmentId = req.params.id;

//             const appointment = await Appointment.findByPk(appointmentId);
//             if (!appointment) {
//                 return res.status(404).json({ message: 'Прием не найден' });
//             }

//             await appointment.destroy();

//             res.status(200).json({ message: 'Прием успешно удален' });
//         } catch (error) {
//             console.error('Ошибка при удалении приема:', error);
//             res.status(500).json({ message: 'Ошибка сервера' });
//         }
//     }
// }

// module.exports = new AppointmentController();
