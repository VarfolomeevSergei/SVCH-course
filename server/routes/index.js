const Router = require('express');
const router = new Router();


const departmentRouter = require('./departmentRouter');
const doctorRouter = require('./doctorRouter');
const serviceRouter = require("./serviceRouter");
const usersRouter = require("./usersRouter");


router.use('/users', usersRouter);
router.use('/service', serviceRouter);
router.use('/doctor', doctorRouter);
router.use('/department', departmentRouter);


module.exports = router;