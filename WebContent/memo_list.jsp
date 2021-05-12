<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memo_list</title>
<link rel="stylesheet" href="memo.css">
</head>
<body>
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
	while(rs.next()) {
		int no = rs.getInt(1);
		String memo = rs.getString("memo");
		String wdate = rs.getString(3);
		
		out.println(no + " : " + memo + " : [" + wdate + "]");
		%><form method="post" action="memo_delete.jsp">
		<input class="submit" type="submit" value=" X " name="memo"></input> </p>
		</br>
		</form>
		<%
	}
	rs.close();
	pstmt.close();
	con.close();
	out.println("DB조회 성공");
%>
<form method="post" action="memo_form.html">
<input id="mainSubmit" type="submit" value="작성"></input>
</form>

</body>
</html>