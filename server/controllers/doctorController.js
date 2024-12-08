const {Users, Department,  Doctor } = require("../models/models");
const uuid = require('uuid')
const path = require('path')

class DoctorController {
    async createDoctor(req, res) {
        try {
            const { Name, Specialization,  DepartmentId, } = req.body;
            const {img} = req.files
            let filename = uuid.v4() + ".jpg"
            img.mv(path.resolve(__dirname, '..', 'static', filename))
            const newDoctor = await Doctor.create({
                Name,
                Specialization,
                DepartmentId,
                img:filename
            });

            res.status(201).json(newDoctor);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Failed to create doctor" });
        }
    }

    async deleteDoctorById(req, res) {
        try {
            const doctorId = req.params.id;

            // Удаление доктора по ID
            const deletedDoctor = await Doctor.destroy({
                where: { Id: doctorId },
            });

            if (!deletedDoctor) {
                return res.status(404).json({ error: "Doctor not found" });
            }

            res.status(200).json({ success: true });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Failed to delete doctor" });
        }
    }

    async getDoctorById(req, res) {
        try {
            const doctorId = req.params.Id;

            // Поиск доктора по ID
            const doctor = await Doctor.findByPk(doctorId);

            if (!doctor) {
                return res.status(404).json({ error: "Doctor not found" });
            }

            res.status(200).json(doctor);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Failed to get doctor by ID" });
        }
    }
    async getDoctorList(req, res) {
        try {
            // Получение списка всех докторов
            const doctors = await Doctor.findAll();
            
            const simplifiedDoctors = doctors.map(doctor => ({
                doctorId: doctor.Id,
                name: doctor.Name,
                specialization: doctor.Specialization,
            }));

            res.status(200).json(simplifiedDoctors);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Failed to get doctor list" });
        }
    }

    
}

module.exports = new DoctorController();
