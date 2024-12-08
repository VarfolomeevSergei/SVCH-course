const { Department, Service } = require("../models/models");

class ServiceController {
    async createService(req, res) {
        try {
            const { Name, Price, Specialization, DepartmentId } = req.body;

            // Создание новой услуги
            const newService = await Service.create({
                Name,
                Price,
                Specialization,
                DepartmentId,
            });

            res.status(201).json(newService);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Failed to create service" });
        }
    }
    async deleteServiceById(req, res) {
        try {
            const serviceId = req.params.Id; // Use req.params.Id
    
            // Удаление услуги по ID
            const deletedService = await Service.destroy({
                where: { Id: serviceId },
            });
    
            if (!deletedService) {
                return res.status(404).json({ error: "Service not found" });
            }
    
            res.status(200).json({ success: true });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Failed to delete service" });
        }
    }

    async getServiceById(req, res) {
        try {
            const serviceId = req.params.Id;

            // Поиск услуги по ID
            const service = await Service.findByPk(serviceId);

            if (!service) {
                return res.status(404).json({ error: "Service not found" });
            }

            res.status(200).json(service);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Failed to get service by ID" });
        }
    }

    async getServiceList(req, res) {

            const {DepartmentId} = req.query
            let services;
            if (!DepartmentId) {
                services = await Service.findAll()
            }
            if (DepartmentId) {
                services = await Service.findAll({where:{DepartmentId}})
            }
            return res.json(services)
            
    }
}
module.exports = new ServiceController();