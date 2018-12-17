<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>easyUI-domo</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">   
    <link rel="stylesheet" type="text/css" href="themes/icon.css">   
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="padding: 5px">
  
    	<div class="easyui-layout" data-options="fit:true">
   		<div data-options="region:'south',split:true " style="height: 150px" title="south" ></div>
   		<div data-options="region:'center',split:true, iconCls:'icon-add'" style="height: 150px" title="center" >
   			<div class="easyui-tabs" style="width:700px;height:250px;padding:10px" data-options="fit:true">
		<div title="About" style="padding:10px" >
				<table id="pg" class="easyui-propertygrid" style="width:300px" data-options="
				url:'propertygrid_data1.json',
				method:'get',
				showGroup:true,
				scrollbarSize:0
			">
	</table>
 
		</div>
		<div title="My Documents" style="padding:10px">
			<ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true"></ul>
		</div>
		<div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
		<div class="easyui-panel" title="Panel Footer" style="width:700px;height:200px;border: 3px" data-options="footer:'#ft',fit:'true'">
   				 </div>
   				     <div id="ft" style="padding:5px;">
        Footer Content.
    </div>
		</div>
	</div>
   		
   		
   		</div>
   		<div data-options="region:'west',split:true " style="width: 150px" title="west"></div>
   		<div data-options="region:'north',split:true " style="height: 150px" title="north"></div>
   		<div data-options="region:'east',split:true " style="width: 150px" title="east"></div>
   	<div id="mm" class="easyui-menu" style="width:120px;">
		<div>New</div>
		<div>
			<span>Open</span>
			<div class="menu-content" style="text-align:left;padding:10px">
				<div style="font-weight:bold;font-size:16px">Select your Language:</div>
				<ul style="margin:0;padding:0 0 0 40px">
					<li><a href="javascript:void(0)">Java</a></li>
					<li><a href="javascript:void(0)">Basic</a></li>
					<li><a href="javascript:void(0)">C++</a></li>
					<li><a href="javascript:void(0)">Fortran</a></li>
					<li>
						<span>Other</span>
						<input>
					</li>
				</ul>
				<div style="padding:10px 0 0 30px">
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">Ok</a>
				</div>
			</div>
		</div>
		<div data-options="iconCls:'icon-save'">Save</div>
		<div data-options="iconCls:'icon-print'">Print</div>
		<div class="menu-sep"></div>
		<div>Exit</div>
	</div>
  </body>
  <script type="text/javascript" src="js/easyUI/jquery.min.js"></script>
  <script type="text/javascript" src="js/easyUI/jquery.easyui.min.js"></script>
   <script>
   		$(function(){
			$(document).bind('contextmenu',function(e){
				e.preventDefault();
				$('#mm').menu('show', {
					left: e.pageX,
					top: e.pageY
				});
			});
		});
   </script>
</html>
