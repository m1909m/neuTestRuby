/**
 * Created by Marian on 10.02.2017.
 */
var myApp = angular.module('roomsContainer', ['ui.router', 'templates']);
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
    }])
myApp.controller('RoomCtrl', ['$scope', 'rooms', function($scope) {
    $scope.rooms = rooms.rooms;

}]);
myApp.controller('CalendarCtrl', ['$scope', function($scope) {

}]);
myApp.factory('rooms', [
    '$http',
    function($http){
        var o = {
            rooms: []
        };
        o.getAll = function() {
            return $http.get('/rooms.json').success(function(data){
                angular.copy(data, o.rooms);
            })};
        return o;
    }]);