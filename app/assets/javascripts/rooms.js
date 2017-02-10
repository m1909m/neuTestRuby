/**
 * Created by Marian on 10.02.2017.
 */
var myApp = angular.module('roomsContainer', ['ui.router', 'ngResource']);
myApp.config([
    '$stateProvider',
    '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('rooms', {
                url: '/administrator/rooms',
                templateUrl: '/rooms.html',
                controller: 'RoomCtrl',
                resolve: {
                    roomPromise: ['rooms', function(rooms){
                        return rooms.getAll();
                    }]
                }
            })
            .state('room', {
                url: '/rooms/{id}',
                templateUrl: '/calender.html',
                controller: 'CalendarCtrl'
            });

        $urlRouterProvider.otherwise('rooms');
    }]);
myApp.controller('RoomCtrl', ['$scope', 'room', function($scope, room) {
    $scope.rooms = room.index();

    $scope.addRoom = function() {
        visitor = room.save($scope.newRoom);

        $scope.visitors.push(room);
        $scope.newRoom = {};
    };

}]);
myApp.controller('CalendarCtrl', ['$scope', function($scope) {

}]);
myApp.factory("room", function($resource) {
    return $resource("rooms/:id", { id: '@id' }, {
        index:   { method: 'GET', isArray: true, responseType: 'json' },
        update:  { method: 'PUT', responseType: 'json' }
    });
});