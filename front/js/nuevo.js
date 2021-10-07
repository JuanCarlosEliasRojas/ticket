

function guardar(){
    async function createPresupuesto() {
        let fecha = document.getElementById('fechaC').value;
        let proyecto = document.getElementById('nombP').value;
        let version = document.getElementById('version').value;

        let token = await JSON.parse(localStorage.getItem('Presupuestos_token')); //Obtencion del token

        if (token != undefined || token != null) {
            let dataInsert = {
                creationDate: fecha,
                project: proyecto,
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
                window.location="./index.html"; //Redirigir a la pagina
            } else {
                alert("El presupuesto no pudo crearse.")
                window.location="./index.html";
            }
        } else {
            alert("No puede realizar la creación de un presupuesto. Su sesión ha cadudado.")
            window.location="./login.html";
        }
    }
    createPresupuesto();
}

function cancelar(){
    window.location="./index.html";
}