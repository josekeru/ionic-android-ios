angular.module('myApp', ['ionic'])

.controller('MyCtrl', function($scope, $ionicLoading, $timeout) {
  
  $scope.data = {
    "filter" : 'cat',
    "animals": [
      {
        type : "cat",
        name : "Persian"
      },
      {
        type : "cat",
        name : "Siamese"
      },
      {
        type : "dog",
        name : "Labrador"
      },
      {
        type : "dog",
        name : "Mallamute"
      },
      {
        type : "bird",
        name : "Cockateel"
      },
      {
        type : "bird",
        name : "Parrot"
      },
      {
        type : "bird",
        name : "Starling"
      },

    ]
  };
  
});