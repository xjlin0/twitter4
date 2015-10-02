;$(function() {
    setTimeout(function() {
        var allTweetsWords = $('.tweets').text();
        if (allTweetsWords.length > 0) {

            var tfidfScoreThreshold = 0.92;
            var syndromes = {
                cold: 'cold sore throat cough coughed coughing sneeze sneezes sneezed sneezing stuffy running nose tissues flu fever sick ill illness',
                insomnia: 'insomnia tired bed fall asleep cannot couldn didn sleep slept sleeping pill pills drowsy anxious stressed headache awake wake waked fatigue concentrate coffee stay night bedtime',
            };

            var infoLinks = {
                cold: 'http://www.webmd.com/cold-and-flu/',
                insomnia: 'http://www.webmd.com/sleep-disorders/guide/insomnia-symptoms-and-causes',
            };

            var notifyOptions = {
                seconds: 9,
                icon: 'rebel',
            };

            var tfidf = new natural.TfIdf();
            for (var syndrome in syndromes) {
                tfidf.addDocument(syndromes[syndrome], syndrome);
            }
            tfidf.tfidfs(allTweetsWords, function(documentIndex, tfidfScore) {
                if (tfidfScore > tfidfScoreThreshold) {
                    var syndrome = tfidf.documents[documentIndex].__key;
                    notifyOptions.html = '<a href="' + infoLinks[syndrome] + '">' + "Maybe you'd like to know:<br>more about " + syndrome + '.</a>';
                    Notify(notifyOptions.html, notifyOptions.icon, notifyOptions.seconds);
                }
            });
        }
    }, 5000);  //waiting time before suggestion display
});