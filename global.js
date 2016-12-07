$(function() {

    $("form").submit(function(e) {
        e.preventDefault();

        //var url = "http://localhost:8090"
        var url = "http://www.kbresearch.nl/genre-classifier/";

        $.ajax({
            type: "GET",
            url: url,
            data: $("form").serialize(),
            success: function(data) {
                $('.output').html(markup(data));
            }
        });

    });

    $("form").submit();

});

function markup(data) {
    var json = $.parseJSON(data);
    var colors = ["#e0f3db","#ccebc5","#a8ddb5","#7bccc4","#4eb3d3","#2b8cbe","#0868ac","#084081"]
    //var colors = ["#edf8b1","#c7e9b4","#7fcdbb","#41b6c4","#1d91c0","#225ea8","#253494","#081d58"]
    //var colors = ["#a6cee3","#1f78b4","#b2df8a","#33a02c","#fb9a99","#e31a1c","#fdbf6f","#ff7f00"]
    html = ''
    i = 0
    for(var key in json) {
        html += '<p>' + key + ': ' + json[key] + '</p>';
        html += '<div class="bar" style="width: ' + 100 * json[key] + '%; background-color: ' + colors[i] + ';"></div>';
        i += 1;
    }
    return html;
}
