async function aceptarElim(){
    let token = await JSON.parse(localStorage.getItem('token')); 
    const id = document.getElementById("idBudget");
    const idBudget = String(id.value); 
    console.log("Este es el id: "+idBudget)

    if (token != null || token != undefined) {
        let url = await fetch('http://localhost:3000/deletePresupuesto/'+idBudget, {
            method: "DELETE"
        });
      
        const data = await url.text();
        console.log(data)
        if (data != "El presupuesto no existe.") {
            alert('Registro eliminado');
            window.location="./index.html"; 
        } else {
            alert('El registro no exite  y/o ya fue eliminado');
            window.location="./index.html";
        }
    } 
}


function guardarModificado(){
    async function modPresupuesto() {
        let id = document.getElementById('idPresupuesto').value;
        let descripcion = document.getElementById('descripcion').value;
        let version = document.getElementById('version').value;
        
        let token = await JSON.parse(localStorage.getItem('token')); 

        if (token != undefined || token != null) {
            let modificar = {
                id_presupuesto: id,
                descripcion: descripcion,
                version: version
            };
            let url = await fetch('http://localhost:3000/updatePresupuesto', {
                method: "POST",
                mode: "cors",
                headers: {
                  "Content-Type": "application/json",
                },
                body: JSON.stringify(modificar),
            });
            const data = await url.text();
            console.log(data)
            if (data != "El presupuesto no existe.") {
                alert("Presupuesto modificado correctamente.");
                window.location="./index.html"; 
            } else {
                alert("El presupuesto no pudo modificarse.")
                window.location="./index.html";
            }
        } 
    }
    modPresupuesto();
}

function cancelar(){
    window.location="./index.html";
}




function guardar(){
    async function newPresupuesto() {
        let fecha = document.getElementById('fecha').value;
        let proyecto = document.getElementById('nombre').value;
        let version = document.getElementById('version').value;

        let token = await JSON.parse(localStorage.getItem('token')); 

        if (token != undefined || token != null) {
            let dataInsert = {
                fecha_creacion: fecha,
                descripcion: proyecto,
                version: version
            };
            let url = await fetch('http://localhost:3000/createPresupuesto', {
                method: "POST",
                mode: "cors",
                headers: {
                  "Content-Type": "application/json",
                },
                body: JSON.stringify(dataInsert),
            });
            const data = await url.text();
            console.log(data)
            if (data == "Presupuesto creado.") {
                alert("Presupuesto creado correctamente.");
                window.location="./index.html"; 
            } else {
                alert("El presupuesto no pudo crearse.")
                window.location="./index.html";
            }
        } 
    }
    newPresupuesto();
}

function cancelar(){
    window.location="./index.html";
}