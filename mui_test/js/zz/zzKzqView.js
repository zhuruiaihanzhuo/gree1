;

mui.init();
var _proDayPicker = null, _nowDay = getNowDay(), _nowUrl ='http://192.168.3.70:8080/Test_SH/students/Test1_test.action';
getNowPageData();
mui.ready(function () {
    setDateInfo();
    mui('.mui-scroll-wrapper').scroll();
    document.getElementById('txtWorkDay').addEventListener('tap', function () {
        if (_proDayPicker != null) {
            _proDayPicker.show(function (nowItem) {
                document.getElementById('txtWorkDay').value = nowItem.text;
                _nowDay = nowItem.text;
                getNowPageData();
            });
        }
    });
});

function setDateInfo() {
    _proDayPicker = new mui.DtPicker({
        type: "date"
    });
    _proDayPicker.setSelectedValue(_nowDay);
    document.getElementById('txtWorkDay').value = _nowDay;
}

function getNowPageData() {
    //var url = _nowUrl + '?now=' + Math.random();
    var url=_nowUrl;
    mui.ajax(url, {
      /*  data: {
            kzqFlag: 'zzKzqView',
            proDay: _nowDay
        },*/
        dataType: 'json', //服务器返回json格式数据
        headers:{'Content-Type':'application/json'},
        type: 'post', //HTTP请求类型       
        success: function (conData) {
            setConProDetailData(conData);
            mui('h6')[0].innerText = getNowDateTime();
           //	document.getElementById('ce').innerHTML =  template('template',conData);
			//document.getElementById('lineDiv').innerHTML =template('datalist',conData);
        },
        error: function (xhr, type, errorThrown) {
            mui.alert('获得页面各产线信息异常,\n错误描述:' + type, '系统错误', '关闭', null);
        }
    });
}

function setConProDetailData(conData) {
    if (conData == null) return;
    mui('tr[role$="Total"]').each(function () {
        this.style.backgroundColor = '#FCFCFC';
    });
    mui('#totalPro')[0].innerText = conData.allPro;
    mui('#totalRate')[0].innerText = conData.allRate;
    mui('#dayPro')[0].innerText = conData.dayPro;
    mui('#dayRate')[0].innerText = conData.dayRate;
    mui('#nightPro')[0].innerText = conData.nightPro;
    mui('#nightRate')[0].innerText = conData.nightRate;
    if (conData.dayColor != '') {
        mui('tr[role="dayTotal"]').each(function () {
            this.style.backgroundColor = '#52AEE7';// conData.dayColor;
        });
    }
    if (conData.nightColor != '') {
        mui('tr[role="nightTotal"]').each(function () {
            this.style.backgroundColor = '#ff8366'; //conData.nightColor;
        });
    }
    var lineStr = ''; var lineDiv = '';
   if (conData.lineList != null) {
        for (var index in conData.lineList) {
            lineStr += '<a class="mui-control-item';
            lineDiv += '<div id="div' + conData.lineList[index].lineCode + '" class="mui-control-content';
           if (index == 0) {
                lineStr += ' mui-active';
                lineDiv += ' mui-active';
            }
            lineStr += '" href="#div' + conData.lineList[index].lineCode + '">' + conData.lineList[index].lineName + '</a>';
            lineDiv += '" style="margin-top: 2px"><div class="mui-row mui-text-center" style="background-color: #FCFCFC;"><span style="font-weight:bold;font-family:"Arial","Microsoft YaHei","黑体","宋体"，sans-serif;">' + conData.lineList[index].lineName + '进度明细</span></div>';
            lineDiv += '<table class="myTable"><tr><td>生产班组</td><td>' + conData.lineList[index].lineCode + '</td></tr><tr role="day' + conData.lineList[index].lineCode + '"><td style="width: 55%;">白班(完工/计划)</td><td style="width: 45%;">' + conData.lineList[index].dayPro + '</td></tr><tr role="day' + conData.lineList[index].lineCode + '"><td>白班完工比例</td><td>' + conData.lineList[index].dayRate + '</td></tr>';
            lineDiv += '<tr role="night' + conData.lineList[index].lineCode + '"><td>晚班(完工/计划)</td><td>' + conData.lineList[index].nightPro + '</td></tr><tr role="night' + conData.lineList[index].lineCode + '"><td>晚班完工比例</td><td>' + conData.lineList[index].nightRate + '</td></tr>';
            lineDiv += '<tr><td>产线类型</td><td>' + conData.lineList[index].workType + '</td></tr><tr><td>最新扫描时间</td><td>' + conData.lineList[index].scanTime + '</td></tr><tr><td>日完工比例</td><td>' + conData.lineList[index].lineRate + '</td></tr><tr><td colspan="2"><a href="zzKqzLineView.html?lCode=' + conData.lineList[index].lineCode + '&lName=' + window.escape(conData.lineList[index].lineName) + '"><span style="text-shadow:0.1em .1em 1px lightgrey;font-weight:bold;">查看当前产线实时生产明细</span></a></td></tr></table></div>';
        }
    }
   
   mui('.mui-content > .mui-segmented-control-inverted > .mui-scroll')[0].innerHTML = lineStr;
    
    mui('#lineDiv')[0].innerHTML = lineDiv;
    //document.getElementById('ce').innerHTML =  template('template',conData);
	//document.getElementById('lineDiv').innerHTML =template('datalist',conData);
    if (conData.lineList != null) {
        for (var index in conData.lineList) {
            if (conData.lineList[index].dayColor != '') {
                mui('tr[role="day' + conData.lineList[index].lineCode + '"]').each(function () {
                    this.style.backgroundColor = '#52AEE7';// conData.lineList[index].dayColor;
                });
            }
            if (conData.lineList[index].nightColor != '') {
                mui('tr[role="night' + conData.lineList[index].lineCode + '"]').each(function () {
                    this.style.backgroundColor = '#ff8366';// conData.nightColor;
                });
            }
        }
    }
}
