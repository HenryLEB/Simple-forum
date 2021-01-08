<%-- 
    Document   : part
    Created on : 2019-12-18, 21:45:39
    Author     : Administrator
--%>
<%@page import="com.bbs.model.TopicBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.TopicBeanAction"%>
<%
int PcurrentPage = 1; 
int pageSize = 5;
if(request.getParameter("PcurrentPage")!=null){
    PcurrentPage = Integer.parseInt(request.getParameter("PcurrentPage"));
}

//String sort = (String)session.getAttribute("sort");
String sort = "";
if(request.getParameter("sort")!=null){
    sort = request.getParameter("sort");
}

TopicBeanAction tba = new TopicBeanAction();
ArrayList pl = tba.getTopicByPart(pageSize, PcurrentPage, sort);

int totalPageCount=tba.getRowCountPart(sort)/pageSize+1;
if(tba.getRowCountPart(sort)%pageSize==0)
        totalPageCount--;
System.out.println("******************totalPageCount=" + totalPageCount
         + "PcurrentPage=" + PcurrentPage);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>菜鸟IT技术论坛</title>
</head>

<body>
  <jsp:include flush="true" page="head.jsp"></jsp:include>
  
  <div class="pubWidth">
    <table width="90%" border="0" align="center" class="txthead">
      <tr>
        <td>
          <table width="100%" border="1">
            <tr>
              <td bgcolor="#00CCFF">标题</td>
              <td bgcolor="#00CCFF">作者</td>
              <td bgcolor="#00CCFF">发表日期</td>
              <td bgcolor="#00CCFF">回复数</td>
            </tr>
            <%
          for(int n=0;n<pl.size();n++){
             TopicBean tb = (TopicBean)pl.get(n);
      %>
            <tr>
              <td class="txthead"><a href="ContentServlet?Id=<%=tb.getId()%>"><%=tb.getTitle()%></a></td>
              <td class="txthead"><%=tb.getUserName()%></td>
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
                if(PcurrentPage>1)  
                {
                %>
            <a href="part.jsp?sort=<%=sort%>&PcurrentPage=<%=PcurrentPage-1%>">上一页 </a>
            <%
                }
                %>
  
  
            <%
                if(PcurrentPage<totalPageCount&PcurrentPage>0)  
                {
                %>
            <a href="part.jsp?sort=<%=sort%>&PcurrentPage=<%=PcurrentPage+1%>">下一页 </a>
            <%
                }
                %>
  
            总页数:<%=totalPageCount%>
            当前页:<%=PcurrentPage%>
          </div>
        </td>
      </tr>
    </table>
  </div>

  <jsp:include flush="true" page="tail.jsp"></jsp:include>
</body>

</html>