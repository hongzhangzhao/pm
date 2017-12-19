<%-- 
	描述： 验证用户登录
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%!final String welcomePage = "/jsp/frontend/dashboard.jsp";%>
<html>
	<head>
	</head>
	<%
		System.out.println("=======checkLogin=========");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserBO userBO = new UserBO();
		System.out.println("=======checkLogin_1=========");
		if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
			String error = "对不起,你的用户名或者密码不对 - 请重试.";
			request.setAttribute("error", error);
	%>
	<jsp:forward page="login.jsp"></jsp:forward>
	<%
		} else {
			User user = userBO.login(username, password);
			System.out.println("=======checkLogin_2=========");
			if (user == null) {
				String error1 = "对不起,你的用户名或者密码不对 - 请重试.";
				request.setAttribute("error", error1);
	%>
	<jsp:forward page="login.jsp"></jsp:forward>
	<%
		} else {
				session.setAttribute(Global.SESSION_USER, user);
				response.sendRedirect(request.getContextPath()
						+ welcomePage);
			}

		}
	%>
</html>
