<%-- 
    Document   : top
    Created on : 2019-12-18, 16:44:49
    Author     : Administrator
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.TopAction"%>
<%
    TopAction ta = new TopAction();
    ArrayList tl = ta.getTop();
%>

<%@page import="com.bbs.model.TopicBean"%>
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
    <table width="90%" border="0" align="center" class="txthead" class="bianhuang">
      <tr>
        <td>
          <table width="100%" border="1">
            <tr>
              <td bgcolor="#00CCFF" width="44">人气排行</td>
              <td bgcolor="#00CCFF">标题</td>
              <td bgcolor="#00CCFF" width="100">作者</td>
              <td bgcolor="#00CCFF" width="150">发表日期</td>
              <td bgcolor="#00CCFF" width="20">回复数</td>
            </tr>
            <%
          for(int n=0;n<tl.size();n++){
             TopicBean tb = (TopicBean)tl.get(n);
      %>

            <tr>
              <td><%=n+1%></td>
              <td><a href="ContentServlet?Id=<%=tb.getId()%>"><%=tb.getTitle()%></a></td>
              <td><%=tb.getUserName()%></td>
              <td><%=tb.getTopicDate()%></td>
              <td><%=tb.getReplyCount()%></td>
            </tr>
            <%
          }
      %>


          </table>
        </td>
      </tr>
    </table>
  </div>

  <jsp:include flush="true" page="tail.jsp"></jsp:include>
</body>

</html>