<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

<!-- 功能：添加问题类型 -->
<!-- @author: 张磊-->
<%
    String name = request.getParameter("name");
    String description = request.getParameter("description");

    if (StringUtils.isBlank(name)) {
        request.setAttribute("error", "the name can't be empty");
%>
<jsp:forward page="viewResolutions.jsp"></jsp:forward>
<%
    }

    Resolution resolution = new Resolution();
    Resolutionhbm r = new Resolutionhbm();
    ResolutionBO rb = new ResolutionBO();
    List<Resolutionhbm> list = rb.getAllResolutions();
    if (list == null || list.size() <= 0) {
        resolution.setName(name);
        resolution.setDescription(description);
        resolution.setIsDefault(1);
        
        r.setName(name);
        r.setDescription(description);
        r.setIsDefault(1);
        rb.addResolution(r);
    } else {
        resolution.setName(name);
        resolution.setDescription(description);
        resolution.setIsDefault(0);
        
        r.setName(name);
        r.setDescription(description);
        r.setIsDefault(0);
        if (!rb.checkExistResolution(r)) {
            rb.addResolution(r);
%>
<jsp:forward page="viewResolutions.jsp"></jsp:forward>
<%
    } else {
            request.setAttribute("error", "the name already exist");
%>
<jsp:forward page="viewResolutions.jsp"></jsp:forward>
<%
    }
    }
%>
