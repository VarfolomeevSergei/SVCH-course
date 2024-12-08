const { Router } = require('express');
const router = new Router();
const departmentController = require('../controllers/departmentController');

router.get("/", departmentController.getDepartmentList);
router.get("/:Id", departmentController.getDepartmentById);
router.post("/create", departmentController.createDepartment);

module.exports = router;