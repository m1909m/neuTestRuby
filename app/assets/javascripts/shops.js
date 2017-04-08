'use strict';

var shopApp = angular.module('shopping', [ 'ui.router' ]);


shopApp.controller('shopController', ['$scope' , '$rootscope', 'Cart','$http', '$interval', function($scope, $rootscope, Cart, $http, $interval) {
    $scope.articles = [];
    $scope.articles = [
        {"id": "1", "name": "Pizza Vegetaria", "price": 5 },
        {"id": "2", "name": "Pizza Salami",    "price": 5.5 },
        {"id": "3", "name": "Pizza Thunfisch", "price": 6 },
        {"id": "4", "name": "Aktueller Flyer", "price": 0 }
    ];
    $rootscope.items = {};
    $rootscope.items.push({"id": "1", "name": "Test 1", "price": 5 });
    $scope.cart = $rootscope.items;


}]);

shopApp.controller('cartController', ['$scope', '$rootscope', 'Cart','$http', '$interval', function($scope, $rootscope, Cart, $http, $interval) {

    $scope.cart = {};
    $scope.cart = $rootscope.items;

}]);
