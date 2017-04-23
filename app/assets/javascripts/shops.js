'use strict';
angular.module('myModule', ['ngStorage', 'ngResource']).factory("Cart", function($window, $rootScope, $resource, $http) {
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
    o.create = function(card) {
        $http.post('/cards.json', card).success(function(data){

        });
    };
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

shopApp.controller('shopController', ['$scope', 'Cart', function($scope, Cart) {
    /*
     $scope.articles = [
     {"id": "1", "name": "Pizza Vegetaria", "price": 5 },
     {"id": "2", "name": "Pizza Salami",    "price": 5.5 },
     {"id": "3", "name": "Pizza Thunfisch", "price": 6 },
     {"id": "4", "name": "Aktueller Flyer", "price": 0 }
     ]; */
    $scope.articles = [];
    $scope.setArticles = function() {
        $scope.articles = Cart.cards.index({"site": "batkf"});
    };
    $scope.init = function () {

        $scope.articles = Cart.cards.index({"site": "batkf"});

    };


    //  Cart.addItems({"id": "1", "name": "Test 1", "price": 5 });
    //  $scope.cart = Cart.getItems();
    $scope.addArticle = function(articles) {
        var sessionarticle = Cart.getItemsWaren();
        if(sessionarticle != null && sessionarticle.length > 0) {
            for(var i = 0; i < sessionarticle.length; i++) {
                for(var j = 0; j < articles.length; j++) {
                    if(sessionarticle[i].id == articles[j].id) {
                        sessionarticle[i].anzahl = sessionarticle[i].anzahl + articles[j].anzahl;
                        sessionarticle[i].sum = sessionarticle[i].anzahl * sessionarticle[i].price;
                    }
                }
            }
            Cart.clearItem();
            for(var i = 0; i < sessionarticle.length; i++) {
                Cart.addItems(sessionarticle[i]);
            }
        } else {
            for(var i = 0; i < articles.length; i++) {
                articles[i].sum = articles[i].price * articles[i].anzahl;
                Cart.addItems(articles[i]);
            }
        }
        $scope.articles = Cart.cards.index({"site": "batkf"});
    };
    /*
     $scope.$watch('addArticle', function () {
     $scope.card.push(Cart.getLastItem());
     }, function () {
     });*/



}]);

// var cartApp = angular.module('cartApp', [ 'myModule', 'shopping', 'ui.router' ]);

shopApp.controller('cartController', ['$scope', 'Cart', function($scope, Cart) {
    /*
     $scope.$watch(function () {
     $scope.cards = Cart.getItems();
     }, function () {
     });*/

    $scope.card = [];

    $scope.card = Cart.getItemsWaren();
    /*
     this.getCard = function() {
     this.card.push(Cart.getLastItem());
     };*/

    //  $scope.cart = Cart.getItems();

    this.removeArticle = function(article) {
        var items = [];
        var articles = Cart.getItemsWaren();
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