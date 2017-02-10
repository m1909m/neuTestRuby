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
                url: '/rooms',
                templateUrl: '/rooms.html',
                controller: 'RoomCtrl'
            })
            .state('room', {
                url: '/rooms/{id}',
                templateUrl: '/calender.html',
                controller: 'CalendarCtrl'
            });

        $urlRouterProvider.otherwise('rooms');
    }])
myApp.controller('RoomCtrl', ['$scope', 'rooms', function($scope) {

}]);
myApp.controller('CalendarCtrl', ['$scope', function($scope) {

}]);
myApp.factory('rooms', [
    '$http',
    function($http){
        var o = {
            rooms: []
        };
        return o;
    }]);