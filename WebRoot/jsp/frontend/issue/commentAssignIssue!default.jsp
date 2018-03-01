<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String issueKey = request.getParameter("issueKey");
			IssueBO ib = new IssueBO();
			Issue issue = ib.getIssueDetailByKey(issueKey);
			String status = request.getParameter("status");
			User user = (User) session.getAttribute(Global.SESSION_USER);
%>
<table cellspacing="0" cellpadding="0" border="0" width="100%">
    <tbody>
        <tr>
            <td bgcolor="#f0f0f0" width="200" valign="top">
                <table cellspacing="0" cellpadding="0" border="0" width="200">
                    <tbody>
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="3" border="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td bgcolor="#dddddd">
                                                <span style="float: left;">
                                                    <b>问题详情</b>
                                                </span>
                                                <span class="small" style="float: right;"> </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table id="issuedetails" cellspacing="0" cellpadding="3" border="0">
                                    <tbody>
                                        <tr>
                                            <td valign="top">
                                                <b>Key:</b>
                                            </td>
                                            <td valign="top">
                                                <b>
                                                    <a id="issue_key_SMS-2" href="issueDetailLayout.jsp?issueKey=<s:property value="issueKey"/>&action=forMe"><s:property value="issueKey"/></a>
                                                </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <b>类型:</b>
                                            </td>
                                            <td valign="top">
                                                <img height="16" border="0" width="16" alt="" src="<%=request.getContextPath()%><s:property value="#issue.issueTypeIcon"/>" /><s:property value="#issue.issueTypeName"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <b>状态:</b>
                                            </td>
                                            <td valign="top">
                                                <img height="16" border="0" width="16" alt="" src="<%=request.getContextPath()%><s:property value="#issue.issueStatusIcon"/>" />
                                                <s:property value="#issue.issueStatusName"/>
                                            </td>
                                        </tr>
                                        <s:if test="issueStatus==true">
                                        <tr>
                                            <td valign="top">
                                                <b>解决:</b>
                                            </td>
                                            <td valign="top">
                                                <s:property value="#issue.resolution"/>
                                            </td>
                                        </tr>
                                        </s:if>
                                        <tr>
                                            <td valign="top">
                                                <b>优先级:</b>
                                            </td>
                                            <td valign="top">
                                                <img height="16" border="0" width="16" alt="" src="<%=request.getContextPath()%><s:property value="#issue.priorityLevelIcon"/>" />
                                                <s:property value="#issue.priorityLevel"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <b>开发者:</b>
                                            </td>
                                            <td valign="top">
                                                <a href="/secure/ViewProfile.jspa?name=zhang"><s:property value="#issue.assignee"/></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <b>报告人:</b>
                                            </td>
                                            <td valign="top">
                                                <a href="/secure/ViewProfile.jspa?name=kris"><s:property value="#issue.reporter"/></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td bgcolor="#ffffff" valign="top">
                <table border="0" width=100%>
                    <tr>
                        <td valign="top">
                            <div id="issueContent" style="padding: 0px 10px;">
                                <form action="commentAssignIssue.jsp">
                                    <table class="simpleform maxWidth">
                                        <tbody>
                                            <tr>
                                                <td class="simpleformheader" colspan="2">
                                                    <h3 class="formtitle">
                                                    <s:if test="status==close">
                                                                                                        关闭问题
                                                    </s:if>
                                                    <s:if test="status==resolved">
                                                                                                        解决问题
                                                    </s:if>
                                                    <s:if test="reopen">
                                                                                                        回复开启问题
                                                    </s:if>          
                                                    </h3>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="simpleformheader" colspan="2">关闭问题表示此问题没有其他的工作要做了,而且已经验证完成了.</td>
                                            </tr>
                                            <tr id="resolutionFieldArea" class="fieldArea">
                                                <td class="fieldLabelArea">
                                                    <label for="resolution">
                                                        <span class="required" title="斜体字是必填的">
                                                            <sup> * </sup>
                                                                                                                        解决:
                                                        </span>
                                                    </label>
                                                </td>
                                                <td class="fieldValueArea">
                                                    <select id="newId_select" name="newId">
                                                        <s:iterator value="#resolutions" var="r">
                                                        <option value=<s:property value="#r.id"/>><s:property value="#r.name"/></option>
                                                        </s:iterator>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr id="resolutionFieldArea" class="fieldArea">
                                                <td class="fieldLabelArea"></td>
                                                <td class="fieldValueArea"></td>
                                            </tr>
                                            <tr id="fixVersionsFieldArea" class="fieldArea">
                                                <td class="fieldLabelArea">
                                                    <label for="fixVersions"> 修复版本: </label>
                                                </td>
                                                <td class="fieldValueArea">未知</td>
                                            </tr>
                                            <tr id="assigneeFieldArea" class="fieldArea">
                                                <td class="fieldLabelArea">
                                                    <label for="assignee"> 开发者: </label>
                                                </td>
                                                <td class="fieldValueArea">
                                                    <script type="text/javascript">
                                                    function sendTo(name) {
                                                        //alert(name);
                                                        document.getElementById("assignee").value = name;
                                                    }                                                                                                                                                            
                                                    </script>
                                                    <select id="assignee" name="assignee">
                                                        <option value="-1">
															-自动-
														</option>
                                                        <option value=<s:property value="userId"/>><s:property value="userName"/></option>
                                                        <optgroup label="---------------">
                                                        <s:iterator value="#users" var="u">
                                                        <s:if test="#u.name==#issue.assignee">
                                                        <option selected value="<s:property value="#u.id"/>">
															<s:property value="#u.name"/>
                                                        </option>
                                                        </s:if>
                                                        <s:else>
                                                        <option value="<s:property value="#u.id"/>">
															<s:property value="#u.name"/>
                                                        </option>
                                                        </s:else>                                   
                                                            </s:iterator>
                                                        </optgroup>
                                                    </select>
                                                    <a href="javascript:sendTo('<%=user.getId()%>');">分配给我</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#ffffff" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#f0f0f0" colspan="2">
                                                    <b>备注</b>
                                                    : (可以用一个备注来描述这个更新)
                                                </td>
                                            </tr>
                                            <tr id="commentFieldArea" class="fieldArea">
                                                <td class="fieldLabelArea">
                                                    <label for="comment"> 备注: </label>
                                                </td>
                                                <td class="fieldValueArea">
                                                    <textarea id="comment" class="textarea" cols="10" rows="15" name="comment"></textarea>
                                                </td>
                                            </tr>
                                            <tr class="hidden">
                                                <td>
                                                <s:if test="status==close">
                                                      
                                                </s:if>
                                                <s:if test="status==resolved">
                                                
                                                </s:if>
                                                <s:if test="status==reopen">
                                                
                                                </s:if>
                                                    <%
                                                        if (status.equals("close")) {
                                                            out.println("<input type=hidden value=close name=status />");
                                                        }
                                                        if (status.equals("resolved")) {
                                                            out.println("<input type=hidden value=resolved name=status />");
                                                        }
                                                        if (status.equals("reopen")) {
                                                            out.println("<input type=hidden value=reopen name=status />");
                                                        }
                                                    %>
                                                    <input id="id" type="hidden" value="<%=issue.getId()%>" name="id" />
                                                    <input id="id" type="hidden" value="<%=issue.getIssueKey()%>" name="issueKey" />
                                                    <input id="id" type="hidden" value="forMe" name="action" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fullyCentered simpleformfooter" colspan="2">
                                                    <%
                                                        if (status.equals("close")) {
                                                            out.println("<input type=submit value=关闭问题 name=status />");
                                                        }
                                                        if (status.equals("resolved")) {
                                                            out.println("<input type=submit value=解决 name=status />");
                                                        }
                                                        if (status.equals("reopen")) {
                                                            out.println("<input type=submit value=恢复开启问题 name=status />");
                                                        }
                                                    %>
                                                    <input id="cancelButton" type="button" onclick="window.history.back();" value="取消" name="/browse/SMS-2" title="取消 (Alt + `)" accesskey="`" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>