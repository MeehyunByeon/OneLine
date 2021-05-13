<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>memo</title>
<link rel="stylesheet" href="memo.css">
</head>

<%
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "bmh@392766";
	Connection con = null;
	String sql = "select * from oneline";
	PreparedStatement pstmt = null;

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, passwd);

	pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>

<body>
	<div id=container>
	<h1 class="memo">OneLine Memo</h1><hr>
	
	<form method="post" action="memo_write.jsp">
	<input id="mainText" type="text" name="memo" autofocus placeholder="메모를 입력하세요">
	<input id="mainSubmit" type="submit" value="등록"></input>
	</form>
	
    <%
	while(rs.next()) {
		int no = rs.getInt(1);
		String memo = rs.getString("memo");
		String wdate = rs.getString(3);
		
		out.println("<p>["+ wdate + "]" + memo +"<input class=\"button\" type=\"button\" value=\"X\" onClick=\"location.href='memo_delete.jsp?no="+no+"'\"><br>");
	}	
    %>
	<hr>  
	</div>
</body>
</html>
<%
	rs.close();
	pstmt.close();
	con.close();
%>
