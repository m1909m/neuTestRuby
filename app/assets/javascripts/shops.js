'use strict';

var shopApp = angular.module('shopping', [ 'ui.router']);

shopApp.factory("Cart", function() {
    var o = { };
    o.items = [];
    /*return {
        getItems: function() {
            return items;
        },
        addArticle: function(article) {
            items.push(article);
        },
        sum: function() {
            return items.reduce(function(total, article) {
                return total + article.price;
            }, 0);
        }
//        {"id": "1", "title": "Buch 1", "price": 5 }
    };*/
    return o;
});

shopApp.controller('shopController', ['$scope', 'Cart','$http', '$interval', function($scope, Cart, $http, $interval) {
    $scope.articles = [];
    $scope.articles = [
        {"id": "1", "name": "Pizza Vegetaria", "price": 5 },
        {"id": "2", "name": "Pizza Salami",    "price": 5.5 },
        {"id": "3", "name": "Pizza Thunfisch", "price": 6 },
        {"id": "4", "name": "Aktueller Flyer", "price": 0 }
    ];
    Cart.items.push({"id": "1", "name": "Test 1", "price": 5 });
    $scope.cart = Cart.items;
    $scope.addArticle = function(article) {
        Cart.items.push(article);
    };

}]);

shopApp.controller('cartController', ['$scope', 'Cart','$http', '$interval', function($scope, Cart, $http, $interval) {

    $scope.cart = {};
    $scope.cart = Cart.items;

}]);
