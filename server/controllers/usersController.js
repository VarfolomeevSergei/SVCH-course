 const ApiError = require('../error/ApiError')
 const bcrypt = require("bcrypt");
 const jwt = require("jsonwebtoken");

 class usersController {

    async registration (req, res){
        try {
            const { Name, BirthDate,  Number, Adress, email, password } = req.body;
    
            // Проверка, существует ли уже пользователь с таким email
            const existingUser = await Users.findOne({ where: { email } });
            if (existingUser) {
                return res.status(401).json({ error: "Registration failed" });
            }
    
            // Хеширование пароля перед сохранением в базу данных
            const hashedPassword = await bcrypt.hash(password, 5);
    
            // Создание нового пациента
            const newPatient = await Patient.create({
                Name,
                BirthDate,
                
                Number,
                Adress
            });
    
            // Создание нового пользователя с привязкой к созданному пациенту
            const newUser = await Users.create({
                email: email,
                password: hashedPassword,
                Role: patient,
                PatientId: newPatient.Id  // Используйте id созданного пациента
            });
            
            const generateJwt = (Id, email, Role) => {
                return jwt.sign(
                    { Id, email, Role},
                    process.env.SECRET_KEY,
                    { expiresIn: '24h' }
                );
            }

            const token= generateJwt( newUser.Id, newUser.email, newUser.Role );
            res.status(201).json({ token });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Registration failed", details: error.message });
        }
    }
    
    
    async login (req, res){
        
    }
    async auth (req, res, next){
        const {Id} = req.query
        if(!Id){
            return next(ApiError.badRequest('не задан id'))
        }
        res.json(Id)
    }
 }
 module.exports = new usersController()