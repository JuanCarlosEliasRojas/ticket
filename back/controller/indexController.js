const indexModel = require ('../model/indexModel')


module.exports.mostrar = (req,res) =>{
    let response = new indexModel();
    let res = await response.readUser();
    return res.render('index')
}