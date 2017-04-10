'use strict';
angular.module('myModule', ['ngStorage', 'ngResource']).factory("Cart", function($window, $rootScope, $resource) {

    var o = { };
    o.cards = $resource("/cards/:id", { id: '@id' }, {
        index:   { method: 'GET', isArray: true, responseType: 'json' },
        update:  { method: 'PUT', responseType: 'json' }
    });
    o.items = [];
    var count = 0;

    o.addItems = function(article) {
        var items = [];
        if($window.sessionStorage.getItem("warenkorb")) {
            items = angular.fromJson($window.sessionStorage.getItem("warenkorb"));
        }
        // TODO anzahl articel
        items.push(article);
        $window.sessionStorage.setItem("warenkorb", JSON.stringify(items));
        o.items = items;

        //o.items.push(JSON.stringify(article));
    };
    o.clearItem = function() {
        $window.sessionStorage.removeItem("warenkorb");
        o.items = [];
    };
    o.getItems = function() {
        /*var items = [];
        o.items = angular.fromJson($window.sessionStorage.getItem("warenkorb"));
        return o.items;*/
        return angular.fromJson($window.sessionStorage.getItem("warenkorb"));
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
shopApp.run( ["$rootScope", function($rootScope) {
    $rootScope.articles = [];
}]);

shopApp.controller('shopController', ['$scope' , 'Cart', '$http', '$interval', function($scope, Cart, $http, $interval) {
    /*
    $scope.articles = [
        {"id": "1", "name": "Pizza Vegetaria", "price": 5 },
        {"id": "2", "name": "Pizza Salami",    "price": 5.5 },
        {"id": "3", "name": "Pizza Thunfisch", "price": 6 },
        {"id": "4", "name": "Aktueller Flyer", "price": 0 }
    ]; */
    $scope.articles = Cart.cards.index({"site": "batkf"});

  //  Cart.addItems({"id": "1", "name": "Test 1", "price": 5 });
  //  $scope.cart = Cart.getItems();
    $scope.addArticle = function(article) {
        Cart.addItems(article);
        /*
        $http({
            method: "GET",
            url:"/cards/counterDown/{{article.id}}"
        }).then( function (response) {

        }, function error(response) {

        });*/
    };



}]);

// var cartApp = angular.module('cartApp', [ 'myModule', 'shopping', 'ui.router' ]);

shopApp.controller('cartController', ['$scope', 'Cart','$http', '$interval', function($scope, Cart, $http, $interval) {


/*
    $scope.$watch(function () {
        $scope.cards = Cart.getItems();
    }, function () {
    });*/

    $scope.card = Cart.getItems();
    $scope.getCard = function() {
        return Cart.getItems();
    };
  //  $scope.cart = Cart.getItems();

    $scope.removeArticle = function(article) {
        var items = [];
        var articles = Cart.getItems();
        Cart.clearItem();
        for(var i = 0; i < articles.length; i++) {
            if(articles[i].id == article.id) {

            } else {
                Cart.addItems(articles[i]);
            }
        }
    };


}]);

shopApp.controller('bookingContainer', ['$scope','$stateParams', 'Cart', '$http', '$interval', function($scope, $stateParams, Cart, $http, $interval) {

    $scope.cart = {};
    $scope.cart = Cart.getItems();
    $scope.sum = 0;
    for(var i = 0;i < $scope.cart.length; i++) {
        $scope.sum += $scope.cart[i].price;
    }
    $scope.addCard = function(){
        var newPerson;
        var articles;
        newPerson = $scope.newPerson;
        //newPerson.articles = $scope.cart;
        articles = $scope.cart;
        var json = [];
        json.push(newPerson);
        json.push(articles);
        newPerson.articles = articles;
        Cart.cards.save(newPerson);

        $scope.newPerson = {};
        Cart.clearItem();

    };

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