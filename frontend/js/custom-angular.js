// AngularJS Routing Part
var myApp = angular.module('app', ['ngRoute','angular.filter']);
var BACKEND_URL="http://172.23.0.39:3000/";
var BACKEND_PORT = 3000;
var FRONTEND_PORT = 8000;

// configure our routes
myApp.config(function($routeProvider) {
    $routeProvider
        // route for the home page
        .when('/', {
            templateUrl : 'pages/order.html',
            controller  : 'orderController'
        })

        // route for the about page
        .when('/admin', {
            templateUrl : 'pages/admin.html',
            controller  : 'adminController'
        })
        .otherwise({
          redirectTo: '/'
      	});      	
});

myApp.controller('appCtrl', function($scope,  $http) {
    
  
});


myApp.controller('orderController', function($scope,  $http) {       

    $http.get(BACKEND_URL.concat("sizes"))
    .success(function(response) {             
        $scope.sizes = response;                    
    })
    .error(function(response){        
        $scope.message = "Internal Server Error";
    });

    $http.get(BACKEND_URL.concat("products"))
    .success(function(response) {             
        $scope.products= response;            
    })
    .error(function(response){        
        $scope.message = "Internal Server Error";
    });        
});

myApp.controller('adminController', function($scope,  $http) {
    
  
});

myApp.controller('formController', function($scope,  $http) {
  
    $scope.choices = [{id: 'product1'}, {id: 'product2'}];

    $scope.addNewChoice = function() {
        var newItemNo = $scope.choices.length+1;
        $scope.choices.push({'id':'product'+newItemNo});
    };

    $scope.removeChoice = function(key) {        
        $scope.choices.splice(key, 1);
    };
  
});


