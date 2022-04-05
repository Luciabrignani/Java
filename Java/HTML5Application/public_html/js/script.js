/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function caricadati (){

let objnotizia = document.getElementById("spnome");
objnotizia.innerHTML = "iniziato corso web htnml5";
let objtit = document.getElementById("titolo");
objtit.innerHTML = "AVVIO HTML5!!!";
let file = "https://catfact.ninja/fact"

fetch(file)  // chiamata al server rest che restituisce testo json
        .then(x => { // in x 
            let res = x.json();
            return res;
        }
        )
        .then(y => objnotizia.innerHTML =
                    y.fact + "<br>" + y.length);

}

