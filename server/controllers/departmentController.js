const { Department } = require("../models/models");

class DepartmentController {
    async getDepartmentById(req, res) {
        try {
            const departmentId = req.params.id;

            // Поиск отдела по ID
            const department = await Department.findByPk(departmentId);

            if (!department) {
                return res.status(404).json({ error: "Department not found" });
            }

            res.status(200).json(department);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Failed to get department by ID" });
        }
    }

    async getDepartmentList(req, res) {
        try {
            // Получение списка всех отделов
            const departments = await Department.findAll();

            res.status(200).json(departments);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Failed to get department list" });
        }
    }

    async createDepartment(req, res){
        try {
            const { Name,Specialization, } = req.body;

            // Создание нового отделения
            const newDepartment = await Department.create({
                Name,
                
                Specialization,
                
            });

            res.status(201).json(newDepartment);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Failed to create department" });
        }
    }
}

module.exports = new DepartmentController();
