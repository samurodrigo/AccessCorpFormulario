(function () {
    'use strict';

    angular.module('app', ['ngRoute'])
    .value("api", "http://localhost:54740/api/v1");
})();