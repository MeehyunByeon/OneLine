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
	String no = request.getParameter("no");

	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "bmh@392766";
	Connection con = null;
	String sql = "delete from oneline where no = (" + no +")";
	PreparedStatement pstmt = null;

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, passwd);

	pstmt = con.prepareStatement(sql);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
	out.println("삭제 성공!");
	response.sendRedirect("memo_list.jsp");
%>


</body>
</html>