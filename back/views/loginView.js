const loginController = require('../controller/loginController')
const validation = require('../middleware/validation')

module.exports = async (app) =>{
    app.post('/login',async(req,res)=>{
        let user = req.body;
        res.send(await loginController.login(user));
    })
}
