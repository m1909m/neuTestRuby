/**
 * Created by Marian on 10.02.2017.
 */
var myApp = angular.module('roomsContainer', ['ngRoute', 'ngResource']);
/*
myApp.config(function($routeProvider) {
    $routeProvider
        .when("/", {
            templateUrl : "room.html",
            controller : "RoomCtrrl"
        });
});*/
myApp.factory("Room", function($resource) {
    return $resource("rooms/:id", { id: '@id' }, {
        index:   { method: 'GET', isArray: true, responseType: 'json' },
        update:  { method: 'PUT', responseType: 'json' }
    });
});
myApp.controller('RoomCtrl', function($scope, Room) {
    $scope.rooms = Room.index();

    $scope.addRoom = function() {
        room = Room.save($scope.newRoom);

        $scope.rooms.push(room);
        $scope.newRoom = {};
    };

});/*
myApp.controller('CalendarCtrl', ['$scope', function($scope) {

}]);*/
