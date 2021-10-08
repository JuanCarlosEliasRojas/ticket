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
                <td scope="row">${data[i].id_presupuesto}</td>
                <td>${data[i].fecha_creacion}</td>
                <td>${data[i].descripcion}</td>
                <td>${data[i].version}</td>
                
              </tr> `
           HTMLResponse.innerHTML +=`${tpl}`;
        } 
    }
    getPresupuestos();
}



async function logOut(){
    let token = await JSON.parse(localStorage.getItem('token')); 
    if (token != undefined) {
        localStorage.removeItem('token');
      
        window.location="./login.html";
    } else{
       
        window.location="./login.html";
    }
}



function aceptarEnv(){
    alert("Enviado correctamente.");
}
mostrarPresupuestos();