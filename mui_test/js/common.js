;
function getIIsServerRoot(url, folder) {
    var pathName = window.document.location.pathname;
    var projectName = pathName.substring(0, pathName.substr(1).indexOf(folder));
//      alert(pathName +"#"+folder+"##"+pathName.substr(1).indexOf(folder));
    if (projectName == '') {
        projectName = '..';
    }
    if (url.indexOf('/') == 0) {
        return projectName + url;
    } else {
        return projectName + '/' + url;
    }
}

function getNowDay() {
    var date = new Date();
    var curDay = '';
    if (date.getHours() < 8) {
        date.setDate(date.getDate() - 1);
    }
    curDay = date.getFullYear() + '-' + getFormartTime(date.getMonth() + 1) + '-' + getFormartTime(date.getDate());
    return curDay;
}

function getFormartTime(obj) {
    if (obj >= 0 && obj <= 9) {
        return "0" + obj;
    }
    return obj;
}

function getNowDateTime() {
    var date = new Date();
    var currentdate = date.getFullYear() + '-' + getFormartTime(date.getMonth() + 1) + '-' + getFormartTime(date.getDate()) + " " + getFormartTime(date.getHours()) + ':' + getFormartTime(date.getMinutes()) + ':' + getFormartTime(date.getSeconds());
    return currentdate;
}

function getUrlParam(paraName) {
    var reg = new RegExp("(^|&)" + paraName + "=([^&]*)(&|$)");
    var res = window.location.search.substr(1).match(reg);
    if (res != null) return unescape(res[2]);
    return "";
}