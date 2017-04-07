var shopApp = angular.module('shopping', [ 'ui.router', 'ngResource' ]);

shopApp.factory("Cart", function() {
    var o = { };
    var items = [];
    return {
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
    };
});

shopApp.controller('shopController', ['$scope', 'Cart','$http', '$interval', function($scope, Cart, $http, $interval) {
    $scope.articles = [];
    $scope.articles = [
        {"id": "1", "name": "Pizza Vegetaria", "price": 5 },
        {"id": "2", "name": "Pizza Salami",    "price": 5.5 },
        {"id": "3", "name": "Pizza Thunfisch", "price": 6 },
        {"id": "4", "name": "Aktueller Flyer", "price": 0 }
    ];
    $scope.cart = Cart;

}]);

shopApp.controller('cartController', ['$scope', 'Cart','$http', '$interval', function($scope, Cart, $http, $interval) {



    $scope.cart = Cart;


}]);
