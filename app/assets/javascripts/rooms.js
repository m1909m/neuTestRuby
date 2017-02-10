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

            });

        $urlRouterProvider.otherwise('rooms');
    }]);
myApp.factory("RRoom", function($resource) {
    return $resource("rooms/:id", { id: '@id' }, {
        index:   { method: 'GET', isArray: true, responseType: 'json' },
        update:  { method: 'PUT', responseType: 'json' }
    });
});
myApp.controller('RoomCtrl', ['$scope', 'room', function($scope, Room) {
    $scope.rooms = Room.index();

    $scope.addRoom = function() {
        visitor = Room.save($scope.newRoom);

        $scope.visitors.push(Room);
        $scope.newRoom = {};
    };

}]);
myApp.controller('CalendarCtrl', ['$scope', function($scope) {

}]);
