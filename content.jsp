<%-- 
    Document   : content
    Created on : 2019-12-12, 17:03:43
    Author     : Administrator
--%>

<%@page import="com.bbs.model.AttentionBeanAction"%>
<%@page import="com.bbs.model.ReplyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.ReplyBeanAction"%>
<%@page import="com.bbs.model.TopicBeanAction"%>
<%@page import="com.bbs.model.TopicBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int RcurrentPage = 1;
    if (request.getParameter("RcurrentPage") != null) {
        RcurrentPage = Integer.parseInt(request.getParameter("RcurrentPage"));
    }
    ReplyBeanAction pba = new ReplyBeanAction();
    int pageSize = 5;

    int id = 1;
    if (request.getParameter("Id") != null) {
        id = Integer.parseInt(request.getParameter("Id"));
    }
    
    ArrayList pl = pba.getReplyByPage(pageSize, RcurrentPage, id);

    int totalPageCount = pba.RgetRowCount(id) / pageSize + 1;
    if (pba.RgetRowCount(id) % pageSize == 0) {
        totalPageCount--;
    }
    
    
%>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
            //TopicBean topic = (TopicBean)request.getAttribute("topic");
            int Id = 0;
            TopicBean topic = new TopicBean();
            //System.out.println("ffffffffffff======"+topic);
            if (request.getParameter("Id") != null) {
                String s = (String) request.getParameter("Id");
                Id = Integer.parseInt(s);
                TopicBeanAction tba = new TopicBeanAction();
                topic = tba.getTopicById(Id + "");
            }
    String user = (String)session.getAttribute("userName");
    String attentioner = (String)topic.getUserName();
    AttentionBeanAction ata = new AttentionBeanAction(); 
    System.out.println("*********user=" + user + "*********attentioner=" + attentioner);
            
        %>

    <title>菜鸟IT技术论坛</title>
    <script>
        function check() {
            var userName = document.getElementById("userName").value;
            console.log(userName);
            if (userName === null || userName === "") {
                alert("回复前请先登录。");
                location.href = "index.jsp";
                return false;
            }
            //                else {
            //                    alert("15161651。");
            //
            //                }
            var replyContent = document.getElementById("replyContent").value;
            if (replyContent === null || replyContent === "") {
                alert("请输入回复内容");
                return false;
            }
            return true;
        }      
    </script>

</head>

<body>
    <jsp:include flush="true" page="head.jsp"></jsp:include>
    
    <div class="pubWidth">
        <table width="90%" border="0" align="center" class="txthead">

            <%--
                关注开始
                --%>
            <tr>
                <%
                        if(user != null){
                    %>
                <form action="AttentionServlet">
                    <td align="left">
                        <%
                            if(ata.getAttention(user,attentioner) == 1){
                        %>
                        <input type="hidden" id="user" name="user" value="<%=user%>">
                        <input type="hidden" id="attentioner" name="attentioner" value="<%=attentioner%>">
                        <input type="hidden" id="id" name="id" value="<%=id%>">
                        <input type="submit" name="Submit2" value="取消关注" onclick="return check2()" />
                        <%
                            }else if(ata.getAttention(user,attentioner) == 0) {
                        %>
                        <input type="hidden" id="user" name="user" value="<%=user%>">
                        <input type="hidden" id="attentioner" name="attentioner" value="<%=attentioner%>">
                        <input type="hidden" id="id" name="id" value="<%=id%>">
                        <input type="submit" name="Submit3" value="关注" onclick="return check2()" />
                        <%
                            }
                        %>
    
                    </td>
                </form>
                <%}%>
            </tr>
    
            <%--
            关注结束
            --%>
    
            <tr>
                <form name="form1" action="Replyservlet" method="post">
                    <td class="txthead">
                        <table width="100%" border="1">
                            <tr>
                                <td>作者</td>
                                <td>内容</td>
                            </tr>
                            <%
                            if (topic!= null) {
                        %>
                            <tr>
                                <td><%=topic.getUserName()%></td>
                                <td>发表于:<%=topic.getTopicDate()%></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>标题:<%=topic.getTitle()%>
                            </tr>
                            <tr>
                                <td>头像</td>
                                <td><%=topic.getContent()%></br>
                                    <%
                                    if (!topic.getImgFileName().equals("")) {
                                        String s = "UserFiles/Images/" + topic.getImgFileName();%>
                                    <img src="<%=s%>" width="200" height="200">
                                    <%
                                    }
                                %>
                                </td>
                            </tr>
                            <%
                            }
                        %>
                            <tr>
                                <%--
                            回复框开始
                            --%>
    
                                <td colspan="2">
                                    <table width="100%" border="1">
                                        <tr>
                                            <td bgcolor="#00CCFF">回帖人</td>
                                            <td bgcolor="#00CCFF">内容</td>
                                            <td bgcolor="#00CCFF">发表日期</td>
                                        </tr>
                                        <%
                                        for (int n = 0; n < pl.size(); n++) {
                                            ReplyBean pb = (ReplyBean) pl.get(n);
                                    %>
    
                                        <tr>
                                            <td class="txthead"><%=pb.getUserName()%></td>
                                            <td class="txthead"><%=pb.getReplyContent()%></td>
                                            <td class="txthead"><%=pb.getReplyDate()%></td>
                                        </tr>
    
                                        <%
                                        }
                                    %>
                                    </table>
                                </td>
                                <%--
                                回复框结束
                                --%>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="right"> <%
                                if (RcurrentPage > 1) {
                                    %>
                                        <a href="content.jsp?Id=<%=id%>&RcurrentPage=<%=RcurrentPage - 1%>">上一页 </a>
                                        <%
                                        }
                                    %>
    
    
                                        <%
                                        if (RcurrentPage < totalPageCount & RcurrentPage > 0) {
                                    %>
                                        <a href="content.jsp?Id=<%=id%>&RcurrentPage=<%=RcurrentPage + 1%>">下一页 </a>
                                        <%
                                        }
                                    %>
    
                                        总页数:<%=totalPageCount%>
                                        当前页:<%=RcurrentPage%></div>
                                </td>
                            </tr>
    
                            <%
                            String s = "";
                            if (request.getSession().getAttribute("userName") != null) {
                                s = (String) request.getSession().getAttribute("userName");
                            }
                        %>
                            <input type="hidden" id="userName" name="userName" value="<%=s%>">
                            <input type="hidden" id="tId" name="topicId" value="<%=Id%>">
                            <tr>
                                <td colspan="2" align="center" valign="middle"><textarea name="replyContent" cols="100"
                                        rows="10" id="replyContent"></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="center">
                                        <input name="Submit" type="submit" class="txthead" value="回复"
                                            onclick="return check()" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </form>
            </tr>
        </table>
    </div>

    <jsp:include flush="true" page="tail.jsp"></jsp:include>
</body>

</html>