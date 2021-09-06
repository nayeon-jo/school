<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		//1.JDBC Driver 로딩
		Class.forName("com.mysql.jdbc.Driver");
	
		//2. Server Connection
		String url="jdbc:mysql://localhost:3306/memberdb?serverTimezone=Asia/Seoul";
		Connection conn=DriverManager.getConnection(url, "root", "0516");
		
		Statement stmt=conn.createStatement();
		
		stmt.executeUpdate("insert into member values('b','b','b','b');");
		
		stmt.close();
		conn.close();
	%>
	okay
</body>
</html>