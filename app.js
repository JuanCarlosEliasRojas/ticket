const express = require('express');

require('dotenv').config();
const sequileze = require('./back/db/conexion');
const indexView = require('./back/views/indexView');



const app = express();
const session = require('express-session');

app.use(session({
    secret:'secret',
    resave:true,
    saveUninitialized:true
}));

app.use(express.json())

app.use(express.urlencoded({extended:false}));

app.use(express.static(__dirname + '/public'));
app.set('view engine','ejs');
app.set('views', __dirname + '/views');
app.use('/resources',express.static('public'));
app.use('/resource',express.static(__dirname + '/public'));


async function serverStart() {
    try {
        await sequileze.authenticate();
        console.log("Conexión estabilizada correctamente")
        app.listen(process.env.PORT, function () {
            console.log(`Sistema iniciado en htt://${process.env.HOST}:${process.env.PORT}`);
        });
    } catch (error) {
        console.error('No se pudo conectar correctamebte con la Base de datos:', error);
    }
}

serverStart();

indexView(app);





