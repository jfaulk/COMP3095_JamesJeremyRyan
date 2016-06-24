<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--********************************************************************************************************************
* Project: COMP 3095 Message Board
* Assignment: Assignment 2
* Author(s): James Faulk
* Student Number: 100908684
* Date: 16 October 2015
* Description: index.jsp is the entry point for the web application. Checks if user is logged in and changes the page
               based on that. If user is not logged in a link for New User and Login are visible. If the user is logged
               in already then a link for logout and posts is shown.
*********************************************************************************************************************--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" scope="session" class="ca.jamesjeremyryan.UserBean"></jsp:useBean>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<%
    Boolean isLoggedIn = false;
%>

<c:if test="${user.valid}">
    <%
        isLoggedIn = true;
    %>
</c:if>

<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
                <%
                    if (isLoggedIn) {
                        out.print("<li role=\"presentation\"><a href=\"posts.jsp\">Posts</a></li>");
                        out.print("<li role=\"presentation\"><a href=\"logout.jsp\">Logout</a></li>");
                    } else {
                        out.print("<li role=\"presentation\"><a href=\"login.jsp\">Login</a></li>");
                        out.print("<li role=\"presentation\"><a href=\"register.jsp\">Register</a></li>");
                    }
                %>
            </ul>
        </nav>
        <h3 class="text-muted">Assignment 2</h3>
    </div>

    <div class="jumbotron">
        <h1>COMP 3095 Message Board</h1>
        <p>
            Welcome, ${user.firstName}
        </p>
    </div>

    <% // This is messy and needs to be refactored.
        if (!isLoggedIn) {
            out.print("    <div class=\"row marketing\">\n" +
                    "        <div class=\"col-lg-6\">\n" +
                    "            <h4>New Users</h4>\n" +
                    "\n" +
                    "            <p><a class=\"btn btn-primary btn-lg\" href=\"register.jsp\" role=\"button\">Register</a></p>\n" +
                    "        </div>\n" +
                    "\n" +
                    "        <div class=\"col-lg-6\">\n" +
                    "            <h4>Login</h4>\n" +
                    "\n" +
                    "            <p><a class=\"btn btn-primary btn-lg\" href=\"login.jsp\" role=\"button\">Login</a></p>\n" +
                    "        </div>\n" +
                    "    </div>");
        }
    %>

</div>
</body>
</html>