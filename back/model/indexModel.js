const sequelize = require("../db/conexion")

module.exports = class Users{
    constructor(proyect){
        this.proyect=proyect;
    }
    

    async readUser(){
        let result = await sequelize.query("SELECT * FROM Presupuesto");
        return result;
    }
    async createUser(fecha_creacion,proyecto,version){
        let result = await sequelize.query("INSERT INTO  Presupuesto (fecha_creacion,proyecto,version)VALUES('"+fecha_creacion+"','"+proyecto+"','"+version+"')");
        return result
        
    }
    async deleteUser(id_presupuesto){
        let result = await sequelize.query("DELETE FROM Presupuesto WHERE id_presupuesto =  '"+id_presupuesto+"'");
    }

    async updateUser(user){
        let result = await sequelize.query("UPDATE users SET [nombre] = '"+user.nombre+"',[primer_ap] = '"+user.primer_ap+"',[segundo_ap] = '"+user.segundo_ap+"',[password] = '"+user.password+"',[correo] = '"+user.correo+"',[num_cel] = '"+user.num_cel+"' WHERE [usuario]= '"+user.usuario+"';" );
        return result
    }
}