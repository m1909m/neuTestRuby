/*var shopApp = angular.module('shopping', [ 'ui.router', 'ngResource' ]);

shopApp.factory("Cart", function($ressource) {
    var o = { };
    o.articles = [
        {"id": "1", "title": "Buch 1", "price": 5 },
        {"id": "2", "title": "Buch 2", "price": 5.5 },
        {"id": "3", "title": "Buch 3", "price": 6 },
        {"id": "4", "title": "Buch 4", "price": 0 }
    ];
    return o;
});

shopApp.controller('cartController', ['$scope', 'Cart','$http', '$interval', function($scope, Cart, $http, $interval) {
    $scope.articles = Cart.articles;

}]);

    */