;$(function() {
    $('#searchButton').on('click', function() {
        var userInput = $('#searchTerm').val();
        if (userInput.length > 0) {
            $.ajax({
                    url:      '/search',
                    dataType: 'json',
                    data:     { term: userInput },
                })
                .done(function(searchResults) {
                    $('#myModal').modal('show');
                    for (var index = 0; index < searchResults.length; index++) {
                    	  var re = new RegExp(userInput, 'ig');
                    	  var result = searchResults[index];
                    	  var userHTML = '<li><a href="';
                        if (result.hasOwnProperty('name')) {  //for user model
                        	userHTML += '/users/' + result.id + '">' + result.name + '</a></li>';
                        }else{   //for non-user model
                            userHTML += '/users/' + result.user_id + '">' + result.content + '</a></li>';
                        } 
                        $('.resultList').html(userHTML.replace(re, '<mark>'+userInput+'</mark>'));
                    }
                })
                //.fail( function(){} ).always( function(){} );
        } //else { } // user didn't enter any search keywords.
    });
});