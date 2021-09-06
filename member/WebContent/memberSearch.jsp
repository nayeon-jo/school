<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	${error}
	<form action="memberSearch.do" method="post">
		ID:<input type="text" name="id">
		<input type="hidden" name="job" value="search">
		<input type="submit" value="Search">
	</form>
</body>
</html>