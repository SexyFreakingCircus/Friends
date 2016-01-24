angular.module('listings').controller('friendController', ['$scope', 'Listings',
    function($scope, Listings) {

        $scope.listings = Listings;
        $scope.detailedInfo = undefined;
        $scope.selectedListing = "";
        $scope.updatedListing = {};

        // functions ---------------------------------------------------------------

        $scope.addListing = function(listing) {
            if(!listing){
                return;
            }

            // add the copy to the listings array
            $scope.listings.push(listing);

            // clear the input listing
            $scope.inputListing = "";

        };


        $scope.deleteListing = function(index){
            if($scope.selectedListing == $scope.listings[index])
            $scope.selectedListing = "";

        $scope.listings.splice(index,1);
        };

        $scope.showDetails = function(index) {

            $scope.selectedListing = $scope.listings[index];
            
        };
    }
]);