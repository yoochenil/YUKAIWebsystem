<!DOCTYPE HTML>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="Referrer" content="origin">
    <meta name="viewport" content="width=1100">
    <meta name="description" content="Websystem's Description">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico">


    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/websystem.css">

    <script src="${pageContext.request.contextPath }/resources/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/chart/Chart.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/chart/utils.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/websystem.js"></script>

</head>
<body>

<div class="container"></div>
<script>
    var labels = [];
    var uriage_data = [];
    var genka_data = [];
    $(document).ready(function(){
        $.ajax({
            url: '/chart/ajaxGetMonthlySalesAndCost',
            type: 'post',
            dataType: 'json',
            async: false,
            data: {
                "from": '2018-10-01',
                "to":'2018-11-30',
                "storeid":'1'
            },
            success: function (result) {

                $(result).each(function () {
                    labels.push(
                        $(this).attr('date')
                    );
                    uriage_data.push(
                        $(this).attr('uriage')
                    );
                    genka_data.push(
                        $(this).attr('genka')
                    )
                });
                console.log(labels);
                console.log(uriage_data);
                console.log(genka_data);
            }
        });

        var container = document.querySelector('.container');

        [{
            title: '週間売上',
            gridLines: {
                display: true
            }
        }].forEach(function(details) {
            var div = document.createElement('div');
            div.classList.add('chart-container');

            var canvas = document.createElement('canvas');
            div.appendChild(canvas);
            container.appendChild(div);

            var ctx = canvas.getContext('2d');
            var config = createConfig(details.gridLines, details.title);
            new Chart(ctx, config);
        });

        function createConfig(gridlines, title) {
            return {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'My First dataset',
                        backgroundColor: window.chartColors.red,
                        borderColor: window.chartColors.red,
                        data: [18000, 248100, 96000, 186100, 208500, 258100],
                        fill: false,
                    }, {
                        label: 'My Second dataset',
                        fill: false,
                        backgroundColor: window.chartColors.blue,
                        borderColor: window.chartColors.blue,
                        data: [9000, 124000, 48000, 93000, 104200, 129200],
                    }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: title
                    },
                    scales: {
                        xAxes: [{
                            gridLines: gridlines
                        }],
                        yAxes: [{
                            gridLines: gridlines,
                            ticks: {
                                min: 0,
                                max: 1000000,
                                stepSize: 100000
                            }
                        }]
                    }
                }
            };
        };
    });






</script>


<%--<canvas id="myChart" width="400" height="100"></canvas>
<script>
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
</script>--%>
</body>
</html>