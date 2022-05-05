const config = {
    rootId: 'app',
    routes: [
        {
            'hash': '#home',
            'component': 'HomeView'
        },
        {
            'hash': '#login',
            'component': 'LoginView'
        }]
}

class Router{
    constructor(config){
        this.config= config;
    }
    go(patch){
        const {component} = this.config.routesfind(el=> el.hash ===path);
        if(component){
            console.log("route trovato" + component);
        }
    }
}
export default new Router(config)