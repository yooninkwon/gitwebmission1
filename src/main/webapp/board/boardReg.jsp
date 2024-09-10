<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>게시글 작성</h3>

<form action="boardReg2.jsp" method="post">
	작성자 : <input type="text" name="bwriter" />
	제목 : <input type="text" name="bsubj" /> <br />
	내용 : 
	<textarea name="bmemo" id="bmemo" >내용을 입력해주세요</textarea> <br />
	<input type="submit" value="게시하기" />
	<a href="board.jsp"><input type="button" value="취소하기" /></a>




</form>
</body>
</html>