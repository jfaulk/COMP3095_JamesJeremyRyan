<%--********************************************************************************************************************
* Project: COMP 3095 Message Board
* Assignment: Assignment 2
* Author(s): James Faulk
* Student Number: 100908684
* Date: 16 October 2015
* Description: logout.jsp is a simple page that invalidates the session and redirects to index.jsp
*********************************************************************************************************************--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" scope="session" class="ca.jamesjeremyryan.UserBean">
  <jsp:setProperty name="user" property="valid"/>
</jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Logout</title>
</head>
<body>
${user.valid = false}
<%
  session.setAttribute("user", null);
  session.invalidate();
  response.sendRedirect("index.jsp");
%>
</body>
</html>
