<%-- 
    Document   : allreply
    Created on : 2019-12-20, 15:12:56
    Author     : Administrator
--%>

<%@page import="com.bbs.model.PersonAction"%>
<%@page import="java.util.ArrayList"%>
<%
String user = (String)session.getAttribute("userName");
PersonAction pa = new PersonAction(); 
ArrayList psp = new ArrayList();

int ApcurrentPage = 1; 
if(request.getParameter("ApcurrentPage")!=null){
    ApcurrentPage = Integer.parseInt(request.getParameter("ApcurrentPage"));
}

int pageSize = 5;

psp = pa.getAllReply(pageSize,ApcurrentPage,user);
int totalPageCount=pa.getApRowCount(pageSize,ApcurrentPage,user)/pageSize+1;
if(pa.getApRowCount(pageSize,ApcurrentPage,user)%pageSize==0)
        totalPageCount--;

%>

<%@page import="com.bbs.model.TopicBean"%>
<%@page import="com.bbs.model.ReplyBean"%>
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
      <td>
          </br></br>
        <table width="100%" border="1">
        <tr align="center">
          <div>回复过的帖子</div>
        </tr>
          <tr>
            <td bgcolor="#00CCFF">标题</td>
            <td bgcolor="#00CCFF">作者</td>
            <td bgcolor="#00CCFF">发表日期</td>
            <td bgcolor="#00CCFF">回复内容</td>
      <td bgcolor="#00CCFF">回复时间</td>
          </tr>
            <%
                for(int i = 0;i < psp.size();i++){
                    ReplyBean outpsp = (ReplyBean)psp.get(i);
                    String sub = outpsp.getReplyContent();
                    if(sub.length() > 11)sub = sub.substring(0,10);
                    TopicBean flag = new TopicBean();
                    flag = pa.getTopic(outpsp.getTopicId());
            %>       
          <tr>
            <td class="txthead"><a href="ContentServlet?Id=<%=outpsp.getTopicId()%>"><%=flag.getTitle()%></a></td>
            <td class="txthead"><%=flag.getUserName()%></td>
            <td class="txthead"><%=flag.getTopicDate()%></td>
            <td class="txthead"><%=sub%></td>
            <td class="txthead"><%=outpsp.getReplyDate()%></td>
          </tr>
          <%
            }
          %>
    
        </table></td>
      </tr>
      
      <tr>
          <td bgcolor="#00FFFF"><div align="right">
                  <%
                  if(ApcurrentPage>1)  
                  {
                  %>            
                  <a href="allreply.jsp?ApcurrentPage=<%=ApcurrentPage-1%>">上一页 </a>             
                  <%
                  }
                  %>
                                                                                                   
                  <%
                  if(ApcurrentPage<totalPageCount&ApcurrentPage>0)  
                  {
                  %>                                                                                           
                  <a href="allreply.jsp?ApcurrentPage=<%=ApcurrentPage+1%>">下一页 </a>
                   <%
                  }
                  %>
                
                  总页数:<%=totalPageCount%>
                  当前页:<%=ApcurrentPage%>
              </div></td>
      </tr>
    </table>
  </div>

  <jsp:include flush="true" page="tail.jsp"></jsp:include>
</body>

</html>