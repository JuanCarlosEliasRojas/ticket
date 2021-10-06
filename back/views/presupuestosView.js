const prespuestosController = require('../controller/presupuestosController')

module.exports = async (app) => {
    //Mostrar productos
    app.get('/index',async(req,res) => {
        res.send(await prespuestosController.listaPresupuestos());
    });
};