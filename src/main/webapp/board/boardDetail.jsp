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
String bno=request.getParameter("c");
String sql = "select bno,bsubj, bwriter,bmemo,bdate,cnt from board where bno="+bno;
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";
Connection con=DriverManager.getConnection(url,user,pw);
//실행
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(sql);
rs.next();


%>
<table class="twidth">
	<colgroup>
		<col width="15%" />
		<col width="35%" />
		<col width="15%" />
		<col width="35%" />
	</colgroup>
	<caption>Detail</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>
			<td><%=rs.getInt("bno") %></td>
			<th class="left">조회수</th>
			<td><%=rs.getInt("cnt") %></td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td><%=rs.getString("bwriter") %></td>
			<th class="left">작성시간</th>
			<td><%=rs.getDate("bdate") %></td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="bmemo"><%=rs.getString("bmemo") %></td>
		</tr>
		
	</tbody>
	
	<a href="board.jsp"> <button> 뒤로가기</button> </a>
	
</table>
</body>
</html>

<%  %>

