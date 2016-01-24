angular.module('listings').factory('Listings', function() {
    var listings = {
        entries : [
            {
                "event":"Wing Night",
                "time":"Monday, 8:30"
            },
            {
                "event":"SwampHacks",
                "time":"IT NEVER ENDS!"
            },
            {
                "event":"UF vs FSU Game",
                "time":"Game Time!"
            }
        ]
    }
        return listings.entries; 
});