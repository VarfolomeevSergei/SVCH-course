const { Router } = require('express');
const router = new Router();
const serviceController = require('../controllers/serviceController');

router.post("/create", serviceController.createService);
router.get("/", serviceController.getServiceList);
router.get("/:Id", serviceController.getServiceById);
router.delete("/delete/:Id", serviceController.deleteServiceById);

module.exports = router;
