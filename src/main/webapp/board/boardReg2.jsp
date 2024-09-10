<%@page import="java.sql.PreparedStatement"%>
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
String bwriter = request.getParameter("bwriter");
String bmemo = request.getParameter("bmemo");
String bsubj = request.getParameter("bsubj");

String sql = "insert into board values(board_seq.nextval,?,?,?,sysdate,0)";

Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";
Connection con=DriverManager.getConnection(url,user,pw);
//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, bsubj);
pstmt.setString(2, bwriter);
pstmt.setString(3, bmemo);
pstmt.executeUpdate();

response.sendRedirect("board.jsp");


%>


</body>
</html>
<%
pstmt.close();
con.close();

%>