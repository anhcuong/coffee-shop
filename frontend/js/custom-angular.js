// AngularJS Routing Part
var myApp = angular.module('app', ['ngRoute','angular.filter']);
var BACKEND_URL="http://192.168.0.104:3000/";
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
    $http.get(BACKEND_URL.concat("types"))
    .success(function(response) {             
        $scope.types = response;                    
    })
    .error(function(response){        
        $scope.message = "Internal Server Error";
    });

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

myApp.controller('formController', function($scope,  $http) {  
    $scope.choices = [{id: '1'}];

    $scope.addNewChoice = function() {
        var newItemNo = $scope.choices.length+1;
        $scope.choices.push({'id':newItemNo});
    };

    $scope.removeChoice = function(key) {        
        $scope.choices.splice(key, 1);
    };
    var total = 0;

    $scope.addTotal = function(cost, quant){
        total = total + cost*quant;        
    }

    $scope.getTotal = function(){
        return total;      
    }
    
    $scope.submit = function() {
        console.log($scope.choices);
        if ($scope.data) {
          console.log($scope.data);
        }
    };
});

myApp.controller('adminformController', function($scope,  $http) {  
        
    $scope.addNewDrinkType = function(newtype) {
        if (newtype){
            console.log(newtype);
        }
    };

    $scope.addNewDrinkSize = function(newsize) {
        if (newsize){
            console.log(newsize);
        }
    };

    $scope.addNewProduct = function(newproduct) {
        
        if (newproduct){
            console.log(newproduct);
        }
    };
});


myApp.directive('ngConfirmClick', [
    function(){
        return {
            link: function (scope, element, attr) {
                var msg = attr.ngConfirmClick || "Are you sure?";
                var clickAction = attr.confirmedClick;
                element.bind('click',function (event) {
                    if ( window.confirm(msg) ) {
                        scope.$eval(clickAction)
                    }
                });
            }
        };
    }])
