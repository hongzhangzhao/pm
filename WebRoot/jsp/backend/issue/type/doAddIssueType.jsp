<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

<!-- 功能：添加问题类型 -->
<!-- @author: 许希光-->
<%
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    String iconUrl = request.getParameter("iconurl");

    boolean flag = false;
    String errMsg = "";
    if (StringUtils.isBlank(name)) {
        flag = true;
        errMsg += "the name can't be empty";
    }
    if (StringUtils.isBlank(iconUrl)) {
        flag = true;
        errMsg += "You must specify a URL for the icon of this new issue type. ";
    }
    if (flag) {
        request.setAttribute("error", errMsg);
%>
<jsp:forward page="viewIssueType.jsp"></jsp:forward>
<%
    }
    IssueTypehbm i = new IssueTypehbm();
    IssueType issueType = new IssueType();
    issueType.setName(name);
    issueType.setDescription(description);
    issueType.setIconUrl(iconUrl);
    issueType.setCreateDate(new java.util.Date());

    i.setName(name);
    i.setDescription(description);
    i.setIconUrl(iconUrl);
    i.setCreateDate(new java.util.Date());

    IssueTypeBO issueTypeBO = new IssueTypeBO();
    if (issueTypeBO.checkIssueType(i)) {
        issueTypeBO.addIssueType(i);
        out.println("添加成功");
%>
<jsp:forward page="viewIssueType.jsp"></jsp:forward>
<%
    } else {
        request.setAttribute("error", "the name already exist");
%>
<jsp:forward page="viewIssueType.jsp"></jsp:forward>
<%
    }
%>
