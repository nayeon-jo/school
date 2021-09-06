<%@ page language="java" contentType="text/html; charset=EUC-KR"
	import="java.util.ArrayList"
	import="com.dev.vo.MemberVO"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
	ArrayList<MemberVO> list=(ArrayList<MemberVO>)request.getAttribute("list");
	if(!list.isEmpty()){
	%>
		<table>
			<tr><th>ID</th><th>PassWord</th><th>Name</th><th>E-Mail</th></tr>
			<% for(int i=0; i<list.size(); i++){
					MemberVO member=list.get(i);
				%>
					<tr>
						<td><%= member.getId() %></td>
						<td><%= member.getPwd() %></td>
						<td><%= member.getName() %></td>
						<td><%= member.getMail() %></td>
					</tr>
					<%}
			}else{
				out.print("No Member!!");
			}
			%>
		</table>
</body>
</html>