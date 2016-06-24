<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--********************************************************************************************************************
* Project: COMP 3095 Message Board
* Assignment: Assignment 2
* Author(s): James Faulk
* Student Number: 100908684
* Date: 16 October 2015
* Description: login.jsp is the login page for the application. If the user is already logged in then the input fields
               are disabled and an error message is shown. Page submits to the Login servlet.
*********************************************************************************************************************--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" scope="session" class="ca.jamesjeremyryan.UserBean"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>

<body>
<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation"><a href="${pageContext.request.contextPath}/">Home</a></li>
                <%
                    if (session.getAttribute("user") != null) {
                        out.print("<li role=\"presentation\"><a href=\"posts.jsp\">Posts</a></li>");
                        out.print("<li role=\"presentation\" class=\"active\"><a href=\"logout.jsp\">Logout</a></li>");
                    } else {
                        out.print("<li role=\"presentation\"><a href=\"login.jsp\">Login</a></li>");
                        out.print("<li role=\"presentation\"><a href=\"register.jsp\">Register</a></li>");
                    }
                %>
            </ul>
        </nav>
        <h3 class="text-muted">Assignment 2</h3>
    </div>
    <%
        Boolean isLoggedIn = false;
    %>

    <c:if test="${user.valid}">
        <%
            isLoggedIn = true;
        %>
    </c:if>

    <form action="${pageContext.request.contextPath}/Login" method="post">
        <h2>Please sign in</h2>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" class="form-control" id="email" name="email" placeholder="Email" required
                   autofocus <% if(isLoggedIn) out.print("disabled"); %>>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password"
                   required <% if(isLoggedIn) out.print("disabled"); %>>
        </div>

        <div class="checkbox">
            <label>
                <input type="checkbox" id="remember-me" name="remember-me" <% if(isLoggedIn) out.print("disabled"); %>>Remember
                me
            </label>
        </div>

        <hr>

        <button class="btn btn-md btn-primary" type="submit" <% if (isLoggedIn) out.print("disabled=\"disabled\""); %>>
            Sign in
        </button>
    </form>
    <br>
    <% if (isLoggedIn) out.print("<p style=\"color: #FF0000;\">You are already logged in!</p>"); %>
</div>
</body>
</html>