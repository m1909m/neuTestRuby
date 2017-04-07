var shopApp = angular.module('shopping', [ 'ui.router', 'ngResource' ]);

shopApp.factory("Cart", function($resource) {
    var o = { };
    o.articles = [
        {"id": "1", "title": "Buch 1", "price": 5 }
];
    return o;
});

shopApp.controller('cartController', ['$scope', 'Cart','$http', '$interval', function($scope, Cart, $http, $interval) {
    $scope.articles = {};
    $scope.articles = Cart.articles;

}]);

