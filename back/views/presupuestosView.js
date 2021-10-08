const prespuestosController = require('../controller/presupuestosController')

module.exports = async (app) => {
    
    app.get('/presupuestos',async(req,res) => {
        res.send(await prespuestosController.listaPresupuestos());
    });
    app.post('/createPresupuesto',async(req,res) => {
        let presupuesto = req.body;
       
        res.send(await prespuestosController.createPresupuesto(presupuesto));
    });
    app.post('/updatePresupuesto',async(req,res) => {
        let presupuesto = req.body;
        res.send(await  prespuestosController.updatePresupuesto(presupuesto));
    });
    app.delete('/deletePresupuesto/:id',async (req, res) => {
        let id_presupuesto = req.params.id
        res.send(await prespuestosController.deletePresupuesto(id_presupuesto));
    })
};