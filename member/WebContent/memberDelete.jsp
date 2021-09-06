<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="com.dev.vo.MemberVO"%>
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
		<input type="hidden" name="job" value="delete">
		<input type="submit" value="Search">
	</form>
	
	<% MemberVO member=(MemberVO)request.getAttribute("member");
		if(member!=null) {
	%>
		<h3>Delete Member</h3>
		${member.id} /${member.pwd }/${member.name }/${member.email } <br>
		
		<form action="memberDelete.do" method="post">
			<input type="hidden" name="id" value="${member.id}"><br>
			<input type="submit" value="Delete?">
		</form>
		
	<%} else{ %>
		${result }
	<%} %>
</body>
</html>


