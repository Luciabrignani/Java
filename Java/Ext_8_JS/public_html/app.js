/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

console.log("app.js ok");

let inputElement = document .querySelector("#txtNumero");

let btnElement = document.querySelector("#btnAnalizza");

let spanElement = document.querySelector("lb#Risultato");

btnElement.onclick = onAnalizzaclick;

function onAnalizzaclick(e){
    let ris = analizza(inputElement.value);
    spanElement.innerHTML = ris;
    
}




function analizza(input) {
    let risultato;
    x = parseInt(input);
    let n = 1;
    let sommaDivisori = 0;
    while (n < x) {
        if (x % n === 0)
            sommaDivisori += n;
    }
    n++;

    if (sommaDivisori === x) {
        risultato = "perfetto";


    } else if (sommaDivisori > 0) {
        risultato = "abbondante";
    } else {
        risultato = "difettivo";

    }
}
    





