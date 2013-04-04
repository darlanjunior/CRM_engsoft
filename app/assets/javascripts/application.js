//= require jquery182
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap
//= require chosen.jquery
//= require jquery.uniform
//= require jquery.knob
//= require jquery.piety
//= require jquery.simplePagination

//= require jquery.gritter
//= require notifications

//= require maps/jquery-jvectormap
//= require maps/world-map
//= require maps/map-init

//= require faq
//= require docs

//= require sliders
//= require circles

//= require load-image

//= require extensions/bootstrap-tags
//= require tags
//= require extensions/bootstrap-modalmanager
//= require extensions/bootstrap-modal
//= require extensions/bootstrap-datepicker
//= require extensions/bootstrap-image-gallery
//= require dataTables/jquery.dataTables

//= require flot/jquery.flot
//= require flot/jquery.flot.resize
//= require flot/jquery.flot.pie
//= require charts

//= require fullcalendar/fullcalendar
//= require fullcalendar/data
//= require fullcalendar/gcal

//= require justgage/raphael.2.1.0.min
//= require justgage/justgage
//= require gauges
//= require ie-hacks
//= require rails.validations
//= require jquery.maskedinput-1.2.2


$(document).ready(function(){
    $(".generate-charts").submit(function(){
            $.ajax({
            type: 'GET',
            url: $(this).attr("action"),
            data: $(this).serialize(),
            success: function(data){
            },
            dataType: "script"
        });
        return false;
    });
});


// Load the Visualization API and the piechart package.
google.load('visualization', '1.0', {'packages':['corechart']});


function drawChartLine(dados, colunas, id_div) {

    console.log("Line");

    // Create the data table.
    var data = new google.visualization.DataTable();

    for (var i = 0; i < colunas.length; i++) {
        data.addColumn(colunas[i][0], colunas[i][1]);
    }

    data.addRows(dados);

    // Set chart options
    var options = {
        'height': 500,
        'width' : 680,
        'vAxis': {maxValue: 1, minValue: 0}
    };



    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.LineChart(document.getElementById(id_div));
    chart.draw(data, options);
}



function drawChartPie(slice_name_label, slice_value_label, dados, chart_div,title) {

    console.log("Pie");
    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', slice_name_label);
    data.addColumn('number', slice_value_label);
    data.addRows(dados);

    var options = {
        'width':500,
        'height':300,
        title:title
    };

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById(chart_div));
    chart.draw(data, options);
}
