/**
 * Created by Marian on 10.02.2017.
 */
var myApp = angular.module('roomsContainer', ['ngRoute', 'ngResource', 'ui.calendar']);



myApp.factory("Room", function($resource) {

    var o = {
    };
    o.rooms = $resource("/rooms/:id", { id: '@id' }, {
            index:   { method: 'GET', isArray: true, responseType: 'json' },
            update:  { method: 'PUT', responseType: 'json' }
        });

    o.events = $resource("/c_events/:id", { id: '@id' }, {
            index: { method: 'GET', isArray: true, responseType: 'json' }
        });
    return o;
});

/*
myApp.factory("CEvent", function($resource) {
    return $resource("/c_events/:id", { id: '@id' }, {
        index: { method: 'GET', isArray: true, responseType: 'json' }
    });
});*/

myApp.controller('RoomCtrl', ['$scope', 'Room', function($scope, Room) {
    $scope.rooms = [];
    $scope.rooms = Room.rooms.index();

    $scope.addRoom = function() {
        room = Room.save($scope.newRoom);

        $scope.rooms.push(room);
        $scope.newRoom = {};
    };

    $scope.showEventCal = function($id){
        $scope.events = [];
       // $scope.events = Room.events.index([{'id': $id}]);
        $scope.events = Room.events.index({"roomid": $id});
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var currentView = "month";

        /* config object */
        $scope.uiConfig = {
            calendar:{
                height: 500,
                editable: true,
                selectable: true,
                selectHelper: true,
                header:{
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                }
            }
        };

        /* event sources array*/
        $scope.eventSources = [$scope.events];
    };

}]);
myApp.controller('calendarController', ['$scope', 'CEvent', function($scope, CEvent) {
    $scope.events = [];
    $scope.events = CEvent.index([{'id': $id}]);
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var currentView = "month";

    /* config object */
    $scope.uiConfig = {
        calendar:{
            height: 500,
            editable: true,
            selectable: true,
            selectHelper: true,
            header:{
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            }
        }
    };

    /* event sources array*/
    $scope.eventSources = [$scope.events];
}]);
myApp.config(function($routeProvider) {
    //$locationProvider.html5Mode(true);
    $routeProvider
        .when("/", {
            templateUrl : "../assets/index.html",
            controller : "RoomCtrl"
        }).otherwise({ redirectTo: "/administrator/rooms" });
});