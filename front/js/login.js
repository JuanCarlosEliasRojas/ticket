

function validacion() {
    user = document.getElementById("user").value;
    pass = document.getElementById("pass").value;
    if(user == null || user.length == 0 || /^\s+$/.test(user)) {
        alert('ERROR: El campo usuario debe llenarse.');
        return false;
    } else if(pass == null || pass.length == 0 || /^\s+$/.test(pass)) {
        alert('ERROR: El campo contraseña debe llenarse.');
        return false;
    }
    return true;
}

async function login(){
    user = document.getElementById("user").value;
    password = document.getElementById("pass").value;
    let login = {
        user:user,
        password:password
    };   
    let url = await fetch('http://localhost:3000/login', {
        method: "POST",
        mode: "cors",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(login),
    });
 
    const data = await url.json();
    console.log(data.token);
    if (data.token != "Usuario no autenticado." && data.token != undefined) {
        localStorage.setItem('Presupuestos_token',JSON.stringify(data.token)) 
       
        window.location="./index.html"; 
    } else {
        alert("Usuario o contraseña incorrectos.")
        console.log(data);
    }
}