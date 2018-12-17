<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style.css" />
<script src="js/jQuery-2.1.4.min.js"></script>
<script src="js/Ecalendar.jquery.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script type="text/javascript">
	$(function(){
		$("#ECalendar_date").ECalendar({
			 type:"time",   //模式，time: 带时间选择; date: 不带时间选择;
			 stamp : false,   //是否转成时间戳，默认true;
			 offset:[0,2],   //弹框手动偏移量;
			 format:"yyyy年mm月dd日",   //时间格式 默认 yyyy-mm-dd hh:ii;
			 skin:3,   //皮肤颜色，默认随机，可选值：0-8,或者直接标注颜色值;
			 step:10,   //选择时间分钟的精确度;
			 callback:function(v,e){} //回调函数
		});
	})
</script>
  <body>
    This is my JSP page. <br>
    <div class="calendarWarp">
	<input type="text" name="date" class='ECalendar' id="ECalendar_date"/>
</div>
  </body>
</html>
