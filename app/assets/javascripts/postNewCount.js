;$(function() {

    $('#post_content').on('keyup', function() {
        var charCount = $(this).val().length;
        var charCountHTML;
        switch (true) {
            case (charCount > 100 && charCount <= 140):
                charCountHTML = '<kbd>' + (140 - charCount) + '</kbd>';
                break;
            case (charCount > 140):
                charCountHTML = '<code>' + (140 - charCount) + '</code>';
                break;
            default:
                charCountHTML = 140 - charCount
        }
        $(".charCount").html(charCountHTML);
    });  //The above code is for counting user input text for creating Post

    $('.vote').on('click', function() {
        button = $('span:last', this)
        var voteData = {
            voter_hash: button.attr('voter_hash'),
            vote:       button.attr('value'),
        };
        var postID = button.attr('data-id');
        $.ajax({
                url:      '/posts/' + postID + '/vote.json',
                dataType: 'JSON',
                data:     voteData,
            })
            .done(function(postCount) {
                button.text(postCount.vote_count);
            })
            //.fail(function() {}).always(function() { });
    }); //The above code is for voting post
});