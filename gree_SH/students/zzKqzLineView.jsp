<%@page import="org.hibernate.Session"%>
<%@page import="org.apache.struts2.interceptor.SessionAware"%>
<%@page import="entity.Students"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%=session.getAttribute("students_list2")%>