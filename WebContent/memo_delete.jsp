<%@page import="com.sun.jdi.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memo_delete</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String memo = request.getParameter("memo");

	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "bmh@392766";
	Connection con = null;
	String sql = "delete from oneline where memo = ? ";
	PreparedStatement pstmt = null;

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, passwd);

	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, memo);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
	response.sendRedirect("memo_list.jsp");
%>


</body>
</html>