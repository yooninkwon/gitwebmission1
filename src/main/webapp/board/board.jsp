<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url,user,pw);

String sql="select bno,bsubj,bwriter,bmemo,bdate,cnt from board order by bno";

Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(sql);

%>
<table width="500" border="2">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
<%
while(rs.next()){
%>	
	<tr>
		<td><%=rs.getInt("bno") %></td>
		<td><a href="boardDetail.jsp?c=<%=rs.getInt("bno")%>"><%=rs.getString("bsubj") %></a></td>
		<td><%=rs.getString("bwriter") %></td>
		<td><%=rs.getDate("bdate") %></td>
		<td><%=rs.getInt("cnt") %></td>
	</tr>
	
	
	<%	
}
%>

</table>
<br />
<a href="boardReg.jsp"><button>글 작성하기</button></a>


</body>
</html>
<%
stmt.close();
con.close();
rs.close();

%>
