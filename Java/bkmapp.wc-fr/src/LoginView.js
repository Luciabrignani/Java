export default class LoginView extends HTMLElement{
    
    constructor(){
        super();
        this.root = this.attachShadow({mode: 'open'})


    }
    connetedCallback(){
        console.log("BkmTest connectedCallback")
        this.root.innerHTML = this.render();
        const cmdLogin = this.root.getElementById("cmdLogin");
        cmdLogin.addEventListener("click", e => this.onLogin(e));

    }

    render(){
        return`
        <h1>Bkmtest web component</h1>
        <form action="">
        <input type="text" name="" id="id"/>
        </form>        `
    }

    onLogin(e){
        e.preventDefault();
        console.log("onLogin()...")
    }
}

customElements.define('bkm-login',LoginView)