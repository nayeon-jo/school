<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="com.dev.vo.MemberVO"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>Search Id</h3>
	${error}
	<form action="memberSearch.do" method="post">
		ID:<input type="text" name="id">
		<input type="hidden" name="job" value="update">
		<input type="submit" value="Search">
	</form>
	
	<% MemberVO member=(MemberVO)request.getAttribute("member");
		if(member!=null) {
	%>
		<h3>Update Member</h3>
		<form action="memberUpdate.do" method="post">
			ID: <input type="text" name="id" readonly value="${member.id}"><br>
			Password: <input type="password" name="pwd" value="${member.pwd}"><br>
			Name: <input type="text" name="name" value="${member.name}"><br>
			E-mail: <input type="text" name="email" value="${member.email}"><br>
			<input type="submit" value="Update">
		</form>
		
	<%} else{ %>
		${result }
	<%} %>
</body>
</html>