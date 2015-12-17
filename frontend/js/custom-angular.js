// AngularJS Routing Part
var myApp = angular.module('app', ['ngRoute']);
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
        .when('/history', {
            templateUrl : 'pages/history.html',
            controller  : 'historyController'
        })
        .otherwise({
          redirectTo: '/'
      	});      	
});

myApp.controller('appCtrl', function($scope,  $http) {
    
  
});


myApp.controller('orderController', function($scope,  $http) {
    
  
});

myApp.controller('historyController', function($scope,  $http) {
    
  
});

