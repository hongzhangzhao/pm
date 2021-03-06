<%-- 
	描述： 给用户组添加用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
<body>
    <%
        String groupName = request.getParameter("groupName");
        String typeStr = request.getParameter("users");

        String errMsg = "";
        if (groupName == null || groupName.equals("")) {
            errMsg = "Please select group(s) to edit";
            response.sendRedirect("BulkEditUserGroups!default.jsp?errMsg=" + errMsg);
            return;
        }

        GroupBO groupBO = new GroupBO();
        Grouphbm group = groupBO.getGroupInformation(groupName);

        if (typeStr == null || typeStr.equals("")) {

            errMsg += "Please select users to add to all the selected group(s)<br>";
        } else {
            String[] type1 = (typeStr).split(",");
            String type = "";
            for (int i = 0; i < type1.length; i++) {
<<<<<<< HEAD
=======
                
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
                type = type1[i];

                UserBO userBo = new UserBO();
                Userhbm user = userBo.getUser(type);

                if (!userBo.exist(type)) {
                    errMsg += "Cannot add user '" + type + "', user is not exist'<br> ";
                    response.sendRedirect(
                            "BulkEditUserGroups!default.jsp?groupName=" + groupName + "&errMsg=" + errMsg);
                    return;
                }

                GroupUserBO groupUserBO = new GroupUserBO();
                GroupUser groupUser = new GroupUser();

                groupUser.setGroupId(group.getId());
                groupUser.setUserId(user.getId());

                if (groupUserBO.groupUserExit(groupUser)) {
                    errMsg += "Cannot add user '" + type + "', user is already a member of '" + groupName
                            + "'<br> ";
                } else {
                    groupUserBO.addGroupUser(groupUser);
                }
            }
        }
        response.sendRedirect("BulkEditUserGroups!default.jsp?groupName=" + groupName + "&errMsg=" + errMsg);
    %>


</body>
</html>
