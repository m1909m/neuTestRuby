/**
 * Created by Marian on 10.02.2017.
 * 'daterangepicker'
 */
var myApp = angular.module('roomsContainer', ['daterangepicker', 'ui.router', 'ngResource', 'ui.calendar' ]);



myApp.factory("Room", function($resource) {

    var o = {
    };
    o.rooms = $resource("/rooms/:id", { id: '@id' }, {
            index:   { method: 'GET', isArray: true, responseType: 'json' },
            update:  { method: 'PUT', responseType: 'json' }
        });

    o.events = $resource("/c_events/:id", { id: '@id' }, {
        index: { method: 'GET', isArray: true, responseType: 'json' },
        update:  { method: 'PUT', responseType: 'json' }
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

    $scope.showEventCal = function($id) {
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
myApp.controller('calendarController', ['$scope', '$stateParams', 'Room', function($scope, $stateParams, Room) {
    $scope.roomId = $stateParams.id;
    $scope.events = [];
    $scope.events = Room.events.index({"roomid": $stateParams.id});
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var currentView = "month";

    /* config object */
    $scope.uiConfig = {
        locale: 'de',
        calendar:{
            locale: 'de',
            height: 550,
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
myApp.controller('eventController', ['$scope', '$stateParams', 'Room', function($scope, $stateParams, Room) {

    $scope.events = [];
    $scope.events = Room.events.index({"roomid": $stateParams.id});
    $scope.addEvent = function() {

        newEvent = $scope.newEvent;
        newEvent.start = $scope.datePicker.date.startDate;
        newEvent.end = $scope.datePicker.date.endDate;
        newEvent.room_id = $stateParams.id;
        newEvent.member = 0;
        newEvent.free = true;
        event = Room.events.save(newEvent);
        $scope.events.push(event);
        $scope.newEvent = {};
        $scope.datePicker.date = {};

    }
}]);
/*
myApp.config(function($routeProvider) {
    //$locationProvider.html5Mode(true);
    $routeProvider
        .when("/", {
            templateUrl : "../../assets/rooms.html",
            controller : "RoomCtrl"
        }).otherwise({ redirectTo: "/administrator/rooms" });
});*/

myApp.config([
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
            });

        $urlRouterProvider.otherwise('/');
    }]);