<%-- 
    Document   : index
    Created on : 2019-11-15, 16:34:31
    Author     : Administrator
--%>

<%@page import="com.bbs.model.PartAction"%>
<%@page import="com.bbs.model.TopicBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.TopicBeanAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int currentPage = 1; 
if(request.getParameter("currentPage")!=null){
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
TopicBeanAction tba = new TopicBeanAction();
int pageSize = 5;
ArrayList al = tba.getTopicByPage(pageSize, currentPage);

PartAction pa = new PartAction();
ArrayList pl = pa.Partnum();

int totalPageCount=tba.getRowCount()/pageSize+1;
if(tba.getRowCount()%pageSize==0)
        totalPageCount--;

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

      <%----
      分区开始
    ---%>
      <table width="100%" class="bianhuang_td">
        <!--<td>-->
        <tr>
          <%
              for(int n=0;n<pl.size();n++){
                  String sort = (String)pl.get(n);
                  if((n%5==0)&(n!=0)){
                      
          %>
        </tr>
        <%
                  }
          %>
        <td style="border: 1px dashed #ccc;">
          <a href="part.jsp?sort=<%=sort%>"><%=sort%></a>
        </td>
        <%
              
              }
          %>
  
        <!--</td>-->
      </table>
      <%----分区结束
    ---%>
  
        
        
          <table width="100%" border="1" style="margin-top: 100px;" class="bianhuang">
            <tr>
              <td bgcolor="#00CCFF">标题</td>
              <td bgcolor="#00CCFF">作者</td>
              <td bgcolor="#00CCFF">发表日期</td>
              <td bgcolor="#00CCFF">回复数</td>
            </tr>
            <%
          for(int n=0;n<al.size();n++){
             TopicBean tb = (TopicBean)al.get(n);
      %>
            <tr>
              <td class="txthead"><a href="ContentServlet?Id=<%=tb.getId()%>"><%=tb.getTitle()%></a></td>
              <td class="txthead" width="100"><%=tb.getUserName()%></td>
              <td class="txthead" width="150"><%=tb.getTopicDate()%></td>
              <td class="txthead" width="102"><%=tb.getReplyCount()%></td>
            </tr>
  
            <%
          }
      %>
  
          </table>
        </td>
      </tr>
      <tr>
        <td bgcolor="#00FFFF">
          <div align="right" style="margin: 20px 20px 0 0; font-size: 18px;">
            <%
                if(currentPage>1)  
                {
                %>
            <a href="index.jsp?currentPage=<%=currentPage-1%>">上一页 </a>
            <%
                }
                %>
  
            <%
                if(currentPage<totalPageCount&currentPage>0)  
                {
                %>
            <a href="index.jsp?currentPage=<%=currentPage+1%>">下一页 </a>
            <%
                }
                %>
                    <%=currentPage%> / 
                    <%=totalPageCount%>

          </div>
        </td>
      </tr>
    </table>
  </div>
  <jsp:include flush="true" page="tail.jsp"></jsp:include>
</body>

</html>