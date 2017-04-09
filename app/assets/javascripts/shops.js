'use strict';
angular.module('myModule', ['ngStorage']).factory("Cart", function($window) {

    var o = { };
    o.items = [];
    var count = 0;


    o.addItems = function(article) {
        var items = [];
        items = $window.sessionStorage.getItem("warenkorb");
        items.push(JSON.stringify(article));
        $window.sessionStorage.setItem("warenkorb", JSON.stringify(items));


        //o.items.push(JSON.stringify(article));
    };
    o.getItems = function() {
        var items = [];
        for(var i=0, len=o.items.length; i<len; i++) {
            console.log("items =>" + o.items[i]);
        }/*
        $.each($window.sessionStorage, function(i, v){
            o.items.push(v);
            console.log("Ivar: " + i + "=> V Vari: " + v + " => JSON: " + v );
        });*/
        console.log("Items Wraenkorb: " + $window.sessionStorage.getItem("warenkorb") );
        o.items = $window.sessionStorage.getItem("warenkorb");
        console.log("O.Items: " + o.items);
        /*
        for(var i=0, len=$window.sessionStorage.length; i<len; i++) {
            var key = $window.sessionStorage.key(i);
            var value = $window.sessionStorage[key];
            o.items.push(value);
            console.log("items =>" + o.items);
            console.log(key + " => " + value);
        }*/
        return o.items;
    };
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
var shopApp = angular.module('shopping', [ 'myModule', 'ui.router' ]);
shopApp.run( function() {

});

shopApp.controller('shopController', ['$scope' , 'Cart','$http', '$interval', function($scope, Cart, $http, $interval) {
    $scope.articles = [];
    $scope.articles = [
        {"id": "1", "name": "Pizza Vegetaria", "price": 5 },
        {"id": "2", "name": "Pizza Salami",    "price": 5.5 },
        {"id": "3", "name": "Pizza Thunfisch", "price": 6 },
        {"id": "4", "name": "Aktueller Flyer", "price": 0 }
    ];
    $scope.cart = {};
    Cart.addItems({"id": "1", "name": "Test 1", "price": 5 });
    $scope.cart = Cart.getItems();
    $scope.addArticle = function(article) {
        Cart.addItems(article);
    };


}]);

// var cartApp = angular.module('cartApp', [ 'myModule', 'shopping', 'ui.router' ]);

shopApp.controller('cartController', ['$scope', 'Cart','$http', '$interval', function($scope, Cart, $http, $interval) {

    $scope.cart = {};
    $scope.cart = Cart.getItems();

}]);

shopApp.controller('bookingContainer', ['$scope', 'Cart', '$http', '$interval', function($scope, Cart, $http, $interval) {

    $scope.cart = {};
    $scope.cart = Cart.getItems();
    $scope.sum = 0;
    for(var i = 0;i < $scope.cart.length; i++) {
        $scope.sum += $scope.cart[i].price;
    }

}]);
/*
shopApp.config([
    '$stateProvider',
    '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('/', {
                url: '/',
                templateUrl: '../../assets/rooms.html',
                //templateUrl: '/rooms.html',
                controller: 'RoomCtrl'
            })
            .state('rooms', {
                url: '/{id}',
                // parent: rooms,
                templateUrl: '../../assets/calendar.html',
                controller: 'calendarController'
            })
            .state('create', {
                url: '/{id}/new',
                templateUrl: '../../assets/new.html',
                controller: 'eventController'
            })
            .state('members', {
                url: '/event/members/{id}',
                templateUrl: '../../assets/event.html',
                controller: 'myEventController'
            });
        //.state('editEvent', {
        //    url: '/event/edit/{id]'
        //});

    }]); */