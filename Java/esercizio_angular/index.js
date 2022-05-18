let app = angular.module("myApp", []);
app.controller("myCtrl", function($scope) {
    
    $scope.firstName = "Lucia";  
    console.log("index.js......")

    $scope.login = function () {

        console.log("index.js login......")
        $scope.firstName = "Lucia2";   
    }




  });

