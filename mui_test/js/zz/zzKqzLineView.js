;
mui.init();

getNowPageData();
mui.ready(function () {
    mui('.mui-scroll-wrapper').scroll();
    mui('.mui-title')[0].innerText = window.unescape(getUrlParam('lName')) + '实时看板';
});

function getNowPageData() {
    var url='http://192.168.3.70:8080/Test_SH/students/Test1_test2.action';
    mui.ajax(url, {
       
      
        dataType: 'json', //服务器返回json格式数据
        type: 'post', //HTTP请求类型         
        success: function (lineData) {
            setLineDetailData(lineData);
        },
        error: function (xhr, type, errorThrown) {
            mui.alert('获得页面产线信息异常,\n错误描述:' + type, '系统错误', '关闭', null);
        }
    });
}

function setLineDetailData(lineData) {
    if (lineData == null) return;
    mui('li[role="orderInfo"]')[0].innerHTML = '<div align="center" style="color:#6495ed;font-weight:blod;font-size:xx-large;">' + lineData.nOrder + '<h6>当前订单</h6></div>';
    mui('li[role="orderPro"]')[0].innerHTML = '<div class="mui-row"><div class="mui-col-xs-6 mui-col-sm-6" align="center"  style="color:#800080; font-size:x-large;font-family:"Yu Gothic UI Semilight"">' + lineData.planQty + '<h6>计划数量</h6></div><div class="mui-col-xs-6 mui-col-sm-6" align="center"  style="color:#800080;font-size:x-large;">' + lineData.nowQty + '<h6>收卡数量</h6></div></div>';
    mui('li[role="liPro"]')[0].innerHTML = '<div class="mui-row"><div class="mui-col-xs-6 mui-col-sm-6" align="center" style="color:#ff8c00;font-size:x-large;">' + lineData.lineQty + '<h6>总收卡数</h6></div><div class="mui-col-xs-6 mui-col-sm-6" align="center" style="color:#ff8c00;font-size:x-large;">' + lineData.targetQty + '<h6>目标数量</h6></div></div>';
    mui('li[role="liRate"]')[0].innerHTML = '<div align="center" style="color:#ff0000;font-size:x-large;font-weight:blod;">' + lineData.rate + '<h6>产线完成率</h6></div>';
    setLineHourProChart(lineData.chartData);
}

function setLineHourProChart(chartData) {
    var chartOption = {
        chart: {
            type: 'bar'
        },
        title: {
            text: ''
        },
        subtitle: {
            text: '班组[' + getUrlParam('lCode') + ']各小时生产明细'
        },
        exporting: {
            enabled: false
        },
        credits: {
            enabled: false
        },
        legend: {
            enabled: false
        },
        xAxis: {
            categories: chartData.xValueList
        },
        yAxis: {
            min: 0,
            max: chartData.maxValue + 10,
            title: {
                text: '产线小时产量(台)',
                align: 'high'
            },
            plotLines: [{
                color: 'red',           //线的颜色，定义为红色
                dashStyle: 'solid',     //默认值，这里定义为实线
                value: chartData.standartValue,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                width: 2,                //标示线的宽度，2px
                label: {
                    text: chartData.standartValue,
                    align: 'left',
                    y: -25,
                    x: -5,
                    style: { color: 'red', fontWeight: 'bold' }
                }
            }]
        },
        tooltip: {
            valueSuffix: ' 台'
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        legend: {
            enabled: false
        },
        credits: {
            enabled: false
        },
        series: [{
            name: '小时产量',
            data: chartData.yValueList
        }]
    };
    Highcharts.chart('lineChart', chartOption);
}