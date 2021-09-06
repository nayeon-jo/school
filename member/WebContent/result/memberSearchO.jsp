<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3> Search Result</h3>
	<%
		String result=(String)request.getAttribute("result");
		if(result!=null){
			out.print(result);
		}else{
	%>
		<h3>
		${member.id} / ${member.pwd} / ${member.name} / ${member.email}  
		</h3>
	<%} %>
		
	<%@ include file="home.jsp" %>

</body>
</html>