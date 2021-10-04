const indexController = require('../controller/indexController')

module.exports = async (app)=>{
    app.get('/index',async(req,res)=>{
        res.render('index')
    })
}