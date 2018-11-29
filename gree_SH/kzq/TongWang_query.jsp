<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<script type="text/javascript">
// 当前第几页数据
var currentPage = ${result.currentPage};
var pagNumbe=currentPage+1
// 总页数
var totalPage = ${result.totalPage};

function submitForm(actionUrl){
	var formElement = document.getElementById("stuForm");
	formElement.action = actionUrl;
	
	formElement.submit();
}

// 第一页
function firstPage(){
	if(currentPage == 1){
		alert("已经是第一页数据");
		return false;
	}else{	
			 pagNumbe=1 ;
	
		document.getElementById('seal').value=pagNumbe;
			submitForm("<%=path %>/kzq/TongWang_query.action");
		return true;
	}
}

// 下一页
function nextPage(){
	if(currentPage == totalPage){
		alert("已经是最后一页数据");
		return false;
	}else{
		 pagNumbe=currentPage+1 ;
	
		document.getElementById('seal').value=pagNumbe;
		submitForm("<%=path %>/kzq/TongWang_query.action");
		return true;
	}
}

// 上一页
function previousPage(){
	if(currentPage == 1){
		alert("已经是第一页数据");
		return false;
	}else{
		 pagNumbe=currentPage-1 ;
	
		document.getElementById('seal').value=pagNumbe;
		submitForm("<%=path %>/kzq/TongWang_query.action");
		return true;
	}
}

// 尾页
function lastPage(){
	if(currentPage == totalPage){
		alert("已经是最后一页数据");
		return false;
	}else{
		document.getElementById('seal').value= ${result.totalPage};
			submitForm("<%=path %>/kzq/TongWang_query.action");
		return true;
	}
}
</script>
<html>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">

	<link rel="stylesheet" type="text/css" href="../css/default.css" />
<style type="text/css">
* {
    background: none repeat scroll 0 0 transparent;
    border: 1 none;
    margin: 0;
    padding: 0;
    vertical-align: baseline;
	font-family:微软雅黑;
	overflow:hidden;
}
#navi{
	width:100%;
	position:relative;
	word-wrap:break-word;
	border-bottom:1px solid #065FB9;
	margin:0;
	padding:0;
	height:40px;
	line-height:40px;
	vertical-align:middle;
    background-image: -moz-linear-gradient(top,#EBEBEB, #BFBFBF);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),color-stop(1, 
#BFBFBF));
}
#naviDiv{
	font-size:14px;
	color:#333;
	padding-left:10px;
}
#tips{
	margin-top:10px;
	width:100%;
	height:40px;
}
#buttonGroup{
	padding-left:10px;
	float:left;
	height:35px;
}
.button{
	float:left;
	margin-right:10px;
	padding-left:10px;
	padding-right:10px;
	font-size:14px;
	width:70px;
	height:30px;
	line-height:30px;
	vertical-align:middle;
	text-align:center;
	cursor:pointer;
    border-color: #77D1F6;
    border-width: 1px;
    border-style: solid;
    border-radius: 6px 6px;
    -moz-box-shadow: 2px 2px 4px #282828;
    -webkit-box-shadow: 2px 2px 4px #282828;
    background-image: -moz-linear-gradient(top,#EBEBEB, #BFBFBF);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),color-stop(1, #BFBFBF));
}
#mainContainer{
	padding-left:10px;
	padding-right:10px;
	text-align:center;
	width:98%;
	font-size:12px;
}
</style>
<body >
<div id="navi">
	<div id='naviDiv'>
		<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;铜网记录管理<span>&nbsp;
		<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="<%=path%>/kzq/TongWang_query.action">记录列表</a><span>&nbsp;
	</div>
</div>
<div id="tips">
	<div id="buttonGroup">
		<div class="button" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
			<a href="<%=path%>/kzq/tongwang_add.jsp">添加记录</a>
		</div>
		
	</div>
</div>
<form action="<%=path%>/kzq/TongWang_queryAll.action"  id="stuForm"  style="margin: 10px;  text-align:center" >
<!-- 	开始日期:<input name="start" type="date" />&nbsp;&nbsp;&nbsp;
	结束日期:<input name="end" type="date"/>&nbsp;&nbsp;&nbsp; -->
	铜网编码:<input name="bianma" />
	<input name="pagNumber"  type="hidden"  id="seal"/>
	<input type="submit" value="查询记录" style="cursor:pointer;border-color: #77D1F6;border-width: 1px;border-style: solid; border-radius: 6px 6px;background-color:#f0f0f0;">
</form>
			
			
<div id="mainContainer">
<!-- 从session中获取学生集合 -->

<table class="default" width="100%">
	<col width="7%">
	<col width="7%">
	<col width="7%">
	<col width="7%">
	<col width="7%">
	<col width="7%">
	<col width="7%">
	<col width="7%">
	<col width="7%">
	<col width="7%">
	<col width="6%">
	<col width="6%">
	<col width="6%">
	<col width="6%">
	<col width="6%">
	<tr class="title">
		<td>铜网编码</td>
		<td>铜网名称</td>
		<td>铜网版本</td>
		<td>铜网类型</td>
		<td>PCB编码</td>
		<td>所述区域</td>
		<td>位置编号</td>
		<td>铜网状态</td>
		<td>是否ROHS</td>
		<td>铜网厂家</td>
		<td>制作日期</td>
		<td>启用日期</td>
		<td>录入日期</td>
		<td>录入人</td>
		<td>备注</td>
	</tr>
	
	<!-- 遍历开始 -->
	<s:iterator value="#session.list" var="tw">
	<tr class="list">
		<td><s:property value="#tw.bianma"/></td>
		<td><s:property value="#tw.tname"/></td>
		<td><s:property value="#tw.banben"/></td>
		<td><s:property value="#tw.type"/></td>
		<td><s:property value="#tw.pcbNo"/></td>
		<td><s:property value="#tw.area"/></td>
		<td><s:property value="#tw.placeNo"/></td>
		<td><s:property value="#tw.state"/></td>
		<td><s:property value="#tw.rohs"/></td>
		<td><s:property value="#tw.changjia"/></td>
		<td><s:date name="#tw.makedate" format="yyyy年MM月dd日"/></td>
		<td><s:date name="#tw.stardate" format="yyyy年MM月dd日"/></td>
		<td><s:date name="#tw.lurudate" format="yyyy年MM月dd日"/></td>
		<td><s:property value="#tw.beizhu2"/></td>
		<td><s:property value="#tw.beizhu"/></td>
		<%-- <td><a href="<%=path%>/students/Students_delete.action?sid=<s:property value="#stu.sid"/>" onclick="javascript: return confirm('真的要删除吗？');">删除</a></td>
	 --%></tr>
	</s:iterator>
	<!-- 遍历结束 -->
</table>

</div>
<br> 共${result.totalRecord }条记录&nbsp;&nbsp;共${result.totalPage }页&nbsp;&nbsp;当前第${result.currentPage }页&nbsp;&nbsp;
			<a href="#" onclick="firstPage();">首页</a>&nbsp;&nbsp; 
			<a href="#" onclick="nextPage();">下一页</a>&nbsp;&nbsp; 
			<a href="#" onclick="previousPage();">上一页</a>&nbsp;&nbsp;
			<a href="#"  onclick="lastPage();">尾页</a>	
</body>
</html>