$(function() {

    $("form").submit(function(e) {
        e.preventDefault();

        //var url = "http://localhost:8090"
        var url = "/genre-classifier/";

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
    var colors = ["#e0f3db","#ccebc5","#a8ddb5","#7bccc4","#4eb3d3","#2b8cbe",
        "#0868ac","#084081"].reverse()
    html = ''
    i = 0
    for(var key in json) {
        html += '<p>' + key + ': ' + (100 * json[key]).toFixed(2) + '%</p>';
        html += '<div class="bar" style="width: ' + 100 * json[key] +
            '%; background-color: ' + colors[i] + ';"></div>';
        i += 1;
    }
    return html;
}
