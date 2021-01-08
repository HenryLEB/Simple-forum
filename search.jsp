<%-- 
    Document   : search
    Created on : 2019-12-17, 21:22:01
    Author     : Administrator
--%>

<%@page import="com.bbs.model.TopicBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.SearchAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int ScurrentPage = 1;
    if (request.getParameter("ScurrentPage") != null) {
        ScurrentPage = Integer.parseInt(request.getParameter("ScurrentPage"));
    }
    SearchAction sa = new SearchAction();
    int pageSize = 5;

    String searchthing = (String)request.getAttribute("searchthing");
    
    ArrayList sl = sa.searchTopicByPage(pageSize, ScurrentPage, searchthing);

    int totalPageCount = sa.SgetRowCount(searchthing) / pageSize + 1;
    if (sa.SgetRowCount(searchthing) % pageSize == 0) {
        totalPageCount--;
    }
%>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>菜鸟IT技术论坛</title>
</head>

<body>
    <jsp:include flush="true" page="head.jsp"></jsp:include>

    <div class="pubWidth">
        <table width="90%" border="0" class="txthead" align="center">
            <tr>
                <%
                        if (sl.size() != 0) {
                    %>
                <td>
                    <table width="100%" border="1">


                        <tr>
                            <td bgcolor="#00CCFF">标题</td>
                            <td bgcolor="#00CCFF">作者</td>
                            <td bgcolor="#00CCFF">内容</td>
                            <td bgcolor="#00CCFF">发表日期</td>
                            <td bgcolor="#00CCFF">回复数</td>
                        </tr>
                        <%
            for(int n=0;n<sl.size();n++){
               TopicBean tb = (TopicBean)sl.get(n);
        %>
                        <tr>
                            <td class="txthead"><a href="ContentServlet?Id=<%=tb.getId()%>"><%=tb.getTitle()%></a></td>
                            <td class="txthead"><%=tb.getUserName()%></td>
                            <td class="txthead"><%=tb.getContent()%></td>
                            <td class="txthead"><%=tb.getTopicDate()%></td>
                            <td class="txthead"><%=tb.getReplyCount()%></td>

                        </tr>
                        <%
            }
        %>

                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#00FFFF">
                    <div align="right"> <%
                  if(ScurrentPage>1)  
                  {
                  %>
                        <a href="SearchServlet?searchthing=<%=searchthing%>&ScurrentPage=<%=ScurrentPage-1%>">上一页 </a>
                        <%
                  }
                  %>


                        <%
                  if(ScurrentPage<totalPageCount&ScurrentPage>0)  
                  {
                  %>
                        <a href="SearchServlet?searchthing=<%=searchthing%>&ScurrentPage=<%=ScurrentPage+1%>">下一页 </a>
                        <%
                  }
                  %>

                        总页数:<%=totalPageCount%>
                        当前页:<%=ScurrentPage%>
                    </div>
                </td>
            </tr>
            <%}else {
                %>
            <td>
                <div align="middle">无该搜索记录。</div>
            </td>
            <%
                    }
                %>
        </table>
    </div>

    <jsp:include flush="true" page="tail.jsp"></jsp:include>
</body>

</html>