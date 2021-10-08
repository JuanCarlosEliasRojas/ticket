function mostrarPresupuestos() {
    async function getPresupuestos() {
        const HTMLResponse=document.querySelector('.mPresupuestos');
        HTMLResponse.innerHTML = '';
        let url = await fetch('http://localhost:3000/presupuestos');
        const data = await url.json(url);
        //console.log(data)
        let tpl=``;
        for (let i= 0; i < data.length; i++) {
           tpl=`
              <tr> 
                <td scope="row">${data[i].idBudget}</td>
                <td>${data[i].creationDate}</td>
                <td>${data[i].project}</td>
                <td>${data[i].version}</td>
                
              </tr> `
           HTMLResponse.innerHTML +=`${tpl}`;
        } 
    }
    getPresupuestos();
}

function modificar(){
    window.location="./modificar.html";
}

async function logOut(){
    let token = await JSON.parse(localStorage.getItem('Presupuestos_token')); //Obtencion del token
    if (token != undefined) {
        localStorage.removeItem('Presupuestos_token');
      
        window.location="./login.html";
    } else{
       
        window.location="./login.html";
    }
}

function nuevo(){
    window.location="./nuevo.html"; 
}

function aceptarEnv(){
    alert("Enviado correctamente.");
}

async function aceptarElim(){
    let token = await JSON.parse(localStorage.getItem('Presupuestos_token')); 
    const id = document.getElementById("idBudget");
    const idBudget = String(id.value); 
    console.log("Este es el id: "+idBudget)

    if (token != null || token != undefined) {
        let url = await fetch('http://localhost:3000/deletePresupuesto/'+idBudget, {
            method: "DELETE"
        });
        //Regreso de la respuesta
        const data = await url.text();
        console.log(data)
        if (data != "El presupuesto no existe.") {
            alert('Registro eliminado');
            window.location="./index.html"; 
        } else {
            alert('El registro no exite  y/o ya fue eliminado');
            window.location="./index.html";
        }
    } else{
        alert("No puede realizar la eliminación de un presupuesto. Su sesión ha cadudado.")
        window.location="./login.html";
    }
}

mostrarPresupuestos();