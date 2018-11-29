<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
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
	margin-top:20px;
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
	text-align:left;
	width:98%;
	font-size:16px;
}
</style>
<body>
<script type="text/javascript" src="../js/Calendar3.js"></script>

<div id="navi">
	<div id='naviDiv'>
		<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;铜网记录管理<span>&nbsp;
		<span><img src="../images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="<%=path%>/kzq/TongWang_query.action">记录列表</a><span>&nbsp;
	</div>
</div>
<div id="tips">
</div>
<div id="mainContainer">
<!-- 从session中获取学生集合 -->
<strong>添加铜网记录</strong>
<br>
<br>
<form name="addForm" action="<%=path%>/kzq/TongWang_add.action" method="post">
<table width="400" >
  <tr>
    <td width="30%">铜网编码：</td>
    <td><input type="text" name="bianma" /></td>
  </tr>
  <tr>
    <td width="30%">铜网名称：</td>
    <td><input type="text" name="tname" /></td>
  </tr>
  <tr>
    <td width="30%">铜网版本：</td>
    <td><input type="text" name="banben" /></td>
  </tr>
  <tr>
    <td width="30%">铜网类型：</td>
    <td><input type="text" name="type"  required/></td>
  </tr>
  <tr>
    <td width="30%">PCB编码：</td>
    <td><input type="text" name="pcbNo" /></td>
  </tr>
  <tr>
    <td width="30%">所述区域：</td>
    <td><input type="text" name="area" /></td>
  </tr>
  <tr>
    <td width="30%">位置编号：</td>
    <td><input type="text" name="placeNo" /></td>
  </tr>
  <tr>
    <td width="30%">铜网状态：</td>
    <td><input type="text" name="state" /></td>
  </tr>
  <tr>
    <td>是否ROHS：</td>
    <td><input type="radio" name="rohs" value="true" checked="checked"/>true<input type="radio" name="rohs" value="false"/>false</td>
  </tr>
    <tr>
    <td width="30%">铜网厂家：</td>
    <td><input type="text" name="changjia"  required/></td>
  </tr>
    <tr>
    <td>制作日期：</td>
    <td><input name="makedate" required="required" type="date" id="control_date" size="30"
      maxlength="10"/>
    </td>
  </tr>
<!--   <tr>
    <td>制作日期：</td>
    <td><input name="makedate" required="required" type="text" id="control_date" size="30"
      maxlength="10" onclick="new Calendar().show(this);" readonly="readonly"/>
    </td>
  </tr> -->
  <!--   <tr>
    <td>启用日期：</td>
    <td><input name="stardate" type="text" id="control_date" size="30"
      maxlength="10" onclick="new Calendar().show(this);" readonly="readonly"  required/>
    </td>
  </tr> -->
     <tr>
    <td>启用日期：</td>
    <td><input name="stardate" type="date" id="control_date" size="30" 
      maxlength="10" required/>
    </td>
  </tr>
  <tr>
    <td>录入人：</td>
    <td ><input name="lururen" value="${sessionScope.loginUserName}" readonly="readonly "  required /></td>
  </tr>
  <tr>
    <td>备注：</td>
    <td><input type="text" name="beizhu" /></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input class="button" type="submit" value="添加"></td>
  </tr>
</table>
</form>


</div>
</body>
</html>