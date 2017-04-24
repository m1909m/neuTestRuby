  /**
 * Created by Marian on 10.02.2017.
 * 'daterangepicker'
 */
'use strict';
var myApp = angular.module('roomsContainer', ['daterangepicker', 'ui.router', 'ngStorage', 'ngResource', 'ui.calendar', 'ui.bootstrap' ]);



myApp.factory("Room", function($resource) {

    var o = {
    };
    o.rooms = $resource("/rooms/:id", { id: '@id' }, {
            index:   { method: 'GET', isArray: true, responseType: 'json' },
            update:  { method: 'PUT', responseType: 'json' }
        });
    o.myEvents = $resource("/event/myEvent/", { }, {
            index:    { method: 'GET', isArray: true, responseType: 'json' }
        });
    o.membersByEvent = $resource("/membersAll/byEvent/:id", { id: '@id' }, {
            index:    { method: 'GET', isArray: true, resoinseType: 'json' }
    });
    o.events = $resource("/c_events/:id", { id: '@id' }, {
        index:   { method: 'GET', isArray: true, responseType: 'json' },
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

myApp.controller('RoomCtrl', ['$scope', 'Room', '$http', '$interval', function($scope, Room, $http, $interval) {
    $scope.myEvents = [];
    // Get Abfrage des c_events controller byEmail
    //$scope.myEvents = Room.myEvents.index();
    $http({
        method: "GET",
        url:"/event/myEvent"
    }).then( function (response) {
        $scope.myEvents = response.data;
    }, function error(response) {
        $scope.myEvents = response.statusText;
    });

    $interval(function () {
        $http({
            method: "GET",
            url:"/event/myEvent"
        }).then( function (response) {
            $scope.myEvents = response.data;
        }, function error(response) {
            $scope.myEvents = response.statusText;
        });
    }, 60000);

    $scope.rooms = [];
    $scope.rooms = Room.rooms.index();

    $scope.addRoom = function() {
        var room;
        room = Room.save($scope.newRoom);

        $scope.rooms.push(room);
        $scope.newRoom = {};
    };



}]);

myApp.controller('calendarController', ['$scope', 'Room', '$http', '$interval', '$location', '$window', function($scope, Room, $http, $interval, $location, $window) {
    $scope.roomId = (/administrator\/rooms\/(\d+)/.exec($location.absUrl())[1]);
    $scope.events = [];
    $scope.events = Room.events.index({"roomid": $scope.roomId });
    $scope.eventClickEdit = function(date, jsEvent, view) {
        $window.open('event/' + date.id, '_self')
    };
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var currentView = "month";

    /* config object */
    $scope.uiConfig = {
        calendar:{
            height: 560,
            header:{
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            editable: true,
            eventClick: function(date, jsEvent, view) {
                $window.open('/administrator/rooms/event/' + date.id, '_self')
            }
        }
    };
    $scope.uiConfig.calendar.dayNames = ["Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"];
    $scope.uiConfig.calendar.dayNamesShort = ["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"];
    $scope.uiConfig.calendar.monthNames = ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November",  "Dezember"];


    /* event sources array*/
    $interval(function () {
        $http({
            method: "GET",
            url:"/c_events?roomid=" + $stateParams.id
        }).then( function (response) {
            $scope.events = response.data;
        }, function error(response) {
            $scope.events = response.statusText;
        });
        //$scope.events = Room.events.index({"roomid": $stateParams.id});
        $scope.eventSources = [$scope.events];
    }, 60000);
    $scope.eventSources = [$scope.events];

}]);
myApp.controller('eventController', ['$scope', 'Room', '$location', function($scope, Room, $location) {

    $scope.events = [];
    var id = (/administrator\/rooms\/(\d+)/.exec($location.absUrl())[1]);
    $scope.events = Room.events.index({"roomid": id});

    $scope.addEvent = function() {
        var newEvent;
        var event;

        newEvent = $scope.newEvent;
        newEvent.start = $scope.datePicker.date.startDate;
        newEvent.end = $scope.datePicker.date.endDate;
        newEvent.startLogin =  $scope.datePicker.dateL.startDate;
        newEvent.endLogin =  $scope.datePicker.dateL.endDate;
        newEvent.room_id = $stateParams.id;
        newEvent.member = 0;
        newEvent.free = 1;
        event = Room.events.save(newEvent);
        $scope.events.push(event);
        $scope.newEvent = {};
        $scope.datePicker.date = {};

    }

}]);
myApp.controller('myEventController', ['$scope', '$location', '$stateParams', 'Room', '$http', '$interval', function($scope, $location, $stateParams, Room, $http, $interval) {

    $scope.members = [];
    var id = (/administrator\/rooms\/event\/members\/(\d+)/.exec($location.absUrl())[1]);
    $scope.members = Room.membersByEvent.index({"id": id});
    $interval(function(){
        $scope.members = Room.membersByEvent.index({"id": id});
    }, 60000);

    $scope.abmelden= function(member) {
        var url = "event/member/abmelden/" + member.id;
        $http({
            method: "GET",
            url: url
        }).then( function (response) {

        }, function error(response) {
            $scope.status = response.statusText;
        });
    };


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
            })
            .state('members', {
                url: '/event/members/{id}',
                templateUrl: '../../assets/event.html',
                controller: 'myEventController'
            });
            //.state('editEvent', {
            //    url: '/event/edit/{id]'
            //});

    }]);