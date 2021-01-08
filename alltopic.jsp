<%-- 
    Document   : alltopic
    Created on : 2019-12-20, 14:39:23
    Author     : Administrator
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.PersonAction"%>
<%
String user = (String)session.getAttribute("userName");
PersonAction pa = new PersonAction(); 
ArrayList pst = new ArrayList();

int AtcurrentPage = 1; 
if(request.getParameter("AtcurrentPage")!=null){
    AtcurrentPage = Integer.parseInt(request.getParameter("AtcurrentPage"));
}

int pageSize = 5;
pst = pa.getAllTopic(pageSize,AtcurrentPage,user);

System.out.println("pst=" + pst.size());
int totalPageCount=pa.getAtRowCount(pageSize,AtcurrentPage,user)/pageSize+1;
if(pa.getAtRowCount(pageSize,AtcurrentPage,user)%pageSize==0)
        totalPageCount--;
System.out.println("**************pst=" + pst.size());
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
    <table width="90%" border="0" align="center" class="txthead">

      <tr>
        <td>
          </br></br>
          <table width="100%" border="1">
            <tr align="center">
              <div>发过的帖子</div>
            </tr>
            <tr>
              <td bgcolor="#00CCFF">标题</td>
              <td bgcolor="#00CCFF">作者</td>
              <td bgcolor="#00CCFF">发表日期</td>
              <td bgcolor="#00CCFF">回复数</td>
            </tr>
            <%
              for(int i = 0;i < pst.size();i++){
                  TopicBean outpst = (TopicBean)pst.get(i);
          %>
            <tr>
              <td class="txthead"><a href="ContentServlet?Id=<%=outpst.getId()%>"><%=outpst.getTitle()%></a></td>
              <td class="txthead"><%=outpst.getUserName()%></td>
              <td class="txthead"><%=outpst.getTopicDate()%></td>
              <td class="txthead"><%=outpst.getReplyCount()%></td>
            </tr>
            <%
              }
        %>
  
          </table>
        </td>
      </tr>
      <tr>
        <td bgcolor="#00FFFF">
          <div align="right">
            <%
                if(AtcurrentPage>1)  
                {
                %>
            <a href="alltopic.jsp?AtcurrentPage=<%=AtcurrentPage-1%>">上一页 </a>
            <%
                }
                %>
  
            <%
                if(AtcurrentPage<totalPageCount&AtcurrentPage>0)  
                {
                %>
            <a href="alltopic.jsp?AtcurrentPage=<%=AtcurrentPage+1%>">下一页 </a>
            <%
                }
                %>
  
            总页数:<%=totalPageCount%>
            当前页:<%=AtcurrentPage%>
          </div>
        </td>
      </tr>
    </table>
  </div>

  <jsp:include flush="true" page="tail.jsp"></jsp:include>
</body>

</html>