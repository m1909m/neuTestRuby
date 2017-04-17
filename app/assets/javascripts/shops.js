'use strict';
angular.module('myModule', ['ngStorage', 'ngResource']).factory("Cart", function($window, $rootScope, $resource) {
    /*
    angular.element($window).on('storage', function(event) {
        if (event.key === 'warenkorb') {
            $rootScope.$apply();
        }
    }); */
    var o = { };
    o.cards = $resource("/cards/:id", { id: '@id' }, {
        index:   { method: 'GET', isArray: true, responseType: 'json' },
        update:  { method: 'PUT', responseType: 'json' }
    });
    o.items = [];

    o.addItems = function(article) {
        var items = [];
        if($window.sessionStorage.getItem("warenkorb")) {
            items = angular.fromJson($window.sessionStorage.getItem("warenkorb"));
        }
        // TODO anzahl articel
        items.push(article);
        o.items = items;
        $window.sessionStorage.setItem("warenkorb", JSON.stringify(items));
        //o.items = items;

        //o.items.push(JSON.stringify(article));
    };
    o.clearItem = function() {
        $window.sessionStorage.removeItem("warenkorb");
        o.items = [];
    };
    o.getItemsWaren = function() {
        /*var items = [];
        o.items = angular.fromJson($window.sessionStorage.getItem("warenkorb"));
        return o.items;*/
        return angular.fromJson($window.sessionStorage.getItem("warenkorb"));
    };
    o.getLastItem = function() {
        var items = [];
        if($window.sessionStorage.getItem("warenkorb")) {
            items = angular.fromJson($window.sessionStorage.getItem("warenkorb"));
            return items[items.length - 1];
        }
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
var shopApp = angular.module('shopping', [ 'myModule' ]);
shopApp.run( ["$rootScope", function($rootScope) {
    $rootScope.articles = [];
    $rootScope.card = [];
}]);







// var cartApp = angular.module('cartApp', [ 'myModule', 'shopping', 'ui.router' ]);

shopApp.controller('cartController', ['$scope', 'Cart', function($scope, Cart) {
/*
    $scope.$watch(function () {
        $scope.cards = Cart.getItems();
    }, function () {
    });*/

    $scope.card = [];

    $scope.card = Cart.getItemsWaren;
    /*
    this.getCard = function() {
        this.card.push(Cart.getLastItem());
    };*/

  //  $scope.cart = Cart.getItems();

    this.removeArticle = function(article) {
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

shopApp.controller('bookingContainer', ['$scope', 'Cart', function($scope, Cart) {

    $scope.cart = {};
    $scope.sum = 0;
    $scope.cart = Cart.getItemsWaren();

    for(var i = 0;i < $scope.cart.length; i++) {
        $scope.sum += $scope.cart[i].price;
    }

    $scope.removeArticle = function(article) {
        var items = [];
        var articles = Cart.getItemsWaren();
        Cart.clearItem();
        for(var i = 0; i < articles.length; i++) {
            if(articles[i].id == article.id) {

            } else {
                Cart.addItems(articles[i]);
            }
        }
        $scope.sum = 0;
        $scope.cart = Cart.getItemsWaren();

        for(var i = 0;i < $scope.cart.length; i++) {
            $scope.sum += $scope.cart[i].price;
        }
    };

    $scope.addCard = function() {
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