const sequelize = require('../db/conexion');

module.exports = class presupuestosModel {
    constructor(presupuesto){
        this.presupuesto = presupuesto;
    }
    async list (){
        let result = await sequelize.query("SELECT * FROM presupuesto");
        return result[0];
    }
    
    async createPresu (presupuesto){
        let result = await sequelize.query("INSERT INTO presupuesto (fecha_creacion,descripcion,version) VALUES ('" + presupuesto.fecha_creacion + "','" + presupuesto.descripcion + "'," + presupuesto.version + ");");
        
        return result;
    }

    async updatePresuVersion (presupuesto){
        let result = await sequelize.query("SELECT * FROM presupuesto WHERE id_presupuesto = " + presupuesto.id_presupuesto);
        if(result[0][0] != undefined){
            let result = await sequelize.query("UPDATE presupuesto SET [descripcion] = '"+presupuesto.descripcion+"',[version] = '"+presupuesto.version+"'WHERE [id_presupuesto]= '"+presupuesto.id_presupuesto+"';" );
       
            return result;
        } else {
            return "";
        }
    }

    async delete (id_presupuesto){
        let result = await sequelize.query("SELECT * FROM presupuesto WHERE id_presupuesto = " + id_presupuesto);
        if(result[0][0] != undefined){
            let result = await sequelize.query("DELETE FROM presupuesto WHERE id_presupuesto = " + id_presupuesto);
            return result;
        } else {
            return "";
        }
    }
}