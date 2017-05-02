angular.module('myModule', ['ngStorage', 'ngResource','daterangepicker']).factory("Cart", function($window, $rootScope, $resource, $http) {
    /*
     angular.element($window).on('storage', function(event) {
     if (event.key === 'warenkorb') {
     $rootScope.$apply();
     }
     }); */
    var o = { };
    o.events = $resource("/c_events/:id", { id: '@id' }, {
        index:   { method: 'GET', isArray: true, responseType: 'json' },
        update:  { method: 'PUT', responseType: 'json' }
    });
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

shopApp.controller('shopController', ['$scope', 'Cart', '$window', function($scope, Cart, $window) {
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
                    if(sessionarticle[i].id == articles[j].id && articles[j].anzahl > 0 && articles[j].anzahl != null) {
                        sessionarticle[i].anzahl = sessionarticle[i].anzahl + articles[j].anzahl;
                        sessionarticle[i].sum = sessionarticle[i].anzahl * sessionarticle[i].price;
                    } else {
                        if(sessionarticle[i].id == articles[j].id && articles[j].anzahl < 0) {
                            $window.alert("Bitte keine negativen Bestellungen!");
                        }
                    }
                }
            }
            Cart.clearItem();
            for(var i = 0; i < sessionarticle.length; i++) {
                Cart.addItems(sessionarticle[i]);
            }
        } else {
            for(var i = 0; i < articles.length; i++) {
                if(articles[i].anzahl > 0 && articles[i].anzahl != null) {
                    articles[i].sum = articles[i].price * articles[i].anzahl;
                    Cart.addItems(articles[i]);
                } else {
                    if(articles[i].anzahl < 0 ) {
                        $window.alert("Bitte keine negativen Bestellungen!");
                    }
                }
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

    $scope.removeArticle = function(article) {
        var items = [];
        var articles = Cart.getItemsWaren();
        Cart.clearItem();
        for(var i = 0; i < articles.length; i++) {
            if(articles[i].id == article.id) {
                if(articles[i].anzahl > 1) {
                    articles[i].anzahl = articles[i].anzahl - 1;
                    articles[i].sum = articles[i].sum - articles[i].price;
                    Cart.addItems(articles[i]);
                }
            } else {
                Cart.addItems(articles[i]);
            }
        }
    };


}]);

shopApp.controller('bookingContainer', ['$scope', 'Cart', function($scope, Cart) {
    $scope.sum = 0;

    if(Cart.getItemsWaren() != null) {
        $scope.cart = Cart.getItemsWaren();
        for(var i = 0;i < $scope.cart.length; i++) {
            $scope.sum += $scope.cart[i].sum;
        }
    } else {
        $scope.cart = {};
        $scope.sum = 0;
    }

    $scope.removeArticle = function(article) {
        var items = [];
        var articles = Cart.getItemsWaren();
        Cart.clearItem();
        for(var i = 0; i < articles.length; i++) {
            if(articles[i].id == article.id) {
                if(articles[i].anzahl > 1) {
                    articles[i].anzahl = articles[i].anzahl - 1;
                    articles[i].sum = articles[i].sum - articles[i].price;
                    Cart.addItems(articles[i]);
                }
            } else {
                Cart.addItems(articles[i]);
            }
        }

        if(Cart.getItemsWaren() != null) {
            $scope.cart = Cart.getItemsWaren();
            $scope.sum = 0;
            for(var i = 0;i < $scope.cart.length; i++) {
                $scope.sum += $scope.cart[i].sum;
            }
        } else {
            $scope.cart = {};
            $scope.sum = 0;
        }

    };

    $scope.addCard = function() {
        var newPerson;
        var articles;
        newPerson = $scope.newPerson;
        if(newPerson.nameR == "") {
            newPerson.nameR = newPerson.name;
            newPerson.vornameR = newPerson.vorname;
            newPerson.dienstelleR = newPerson.dienstelle;
            newPerson.adresseR = newPerson.adresse;
            newPerson.ortR = newPerson.ort;
            newPerson.emailR = newPerson.email;
        }
        //newPerson.articles = $scope.cart;
        articles = $scope.cart;

        newPerson.articles = articles;
        Cart.cards.save(newPerson);

        $scope.newPerson = {};
        Cart.clearItem();

    };

}]);
shopApp.controller('eventController', function($scope, Cart) {

    $scope.events = [];
    // var id = (/administrator\/rooms\/(\d+)/.exec($location.absUrl())[1]);
    var id = 1;
    $scope.events = Cart.events.index({"roomid": id});

    $scope.addEvent = function() {
        var newEvent;
        var event;

        newEvent = $scope.newEvent;
        newEvent.start = $scope.date.startOne;
        newEvent.end = $scope.date.endOne;
        newEvent.startSecond = $scope.date.startTwo;
        newEvent.endSecond = $scope.date.endTwo;
        newEvent.startThird = $scope.date.startThree;
        newEvent.endThird = $scope.date.endThree;
        newEvent.startLogin =  $scope.datePicker.dateL.startDate;
        newEvent.endLogin =  $scope.datePicker.dateL.endDate;
        newEvent.room_id = id;
        newEvent.member = 0;
        newEvent.free = 1;

        event = Room.events.save(newEvent);

        $scope.events.push(event);
        $scope.newEvent = {};
        $scope.datePicker.date = {};

    }

});