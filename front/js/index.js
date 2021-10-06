function readPresupuestos() {
    async function getPresupuestos() {
        const HTMLResponse=document.querySelector('.readpresupuesto');
        HTMLResponse.innerHTML = '';
        let url = await fetch('http://localhost:3000/index');
        const data = await url.json(url);
        //console.log(data)
        let tpl=``;
        for (let i= 0; i < data.length; i++) {
           tpl=`
              <tr> 
                <td scope="row">${data[i].id_presupuesto}</td>
                <td>${data[i].fecha_creacion}</td>
                <td>${data[i].proyecto}</td>
                <td>${data[i].version}</td>
                <td><button id="btnModificar" class="w-40 btn btn-primary btn-lg btnModificar" type="button" onclick="modificar()"><i class="fas fa-pencil-alt"></i></button> <button id="btnEliminar" class="w-40 btn btn-danger btn-lg btnEliminar" type="button" data-toggle="modal" data-target="#modalEliminar"><i class="fas fa-trash-alt"></i></button></td>
              </tr> `
           HTMLResponse.innerHTML +=`${tpl}`;
        } 
    }
    getPresupuestos();

}


readPresupuestos();