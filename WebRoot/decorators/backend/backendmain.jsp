<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<html>
<head>
<title><decorator:title default="项目管理软件 v0.1" /></title>
<link href="<%=request.getContextPath()%>/includes/css/main.css" media="all" rel="StyleSheet" type="text/css" />
<decorator:head />
</head>
<body onload="load()">
    <%@include file="../top.jsp"%>
    <%@include file="../menu.jsp"%>

    <table width="100%">
        <tr>
            <td width="100" valign="top"><%@include file="leftmenu.jsp"%></td>
            <td valign="top">
                <decorator:body />
            </td>
        </tr>
    </table>



</body>
</html>
