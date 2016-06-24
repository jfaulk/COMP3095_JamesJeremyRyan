<%--********************************************************************************************************************
* Project: COMP 3095 Message Board
* Assignment: Assignment 2
* Author(s): James Faulk
* Student Number: 100908684
* Date: 16 October 2015
* Description: register.jsp is the new user registration page. Uses session attributes to make the form sticky.
*********************************************************************************************************************--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<%
    if (session.getAttribute("email") != null) {
        response.sendRedirect("index.jsp");
    }
%>

<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation"><a href="${pageContext.request.contextPath}/">Home</a></li>
                <%
                    if (session.getAttribute("user") != null) {
                        out.print("<li role=\"presentation\"><a href=\"posts.jsp\">Posts</a></li>");
                        out.print("<li role=\"presentation\"><a href=\"logout.jsp\">Logout</a></li>");
                    } else {
                        out.print("<li role=\"presentation\"><a href=\"login.jsp\">Login</a></li>");
                        out.print("<li role=\"presentation\" class=\"active\"><a href=\"register.jsp\">Register</a></li>");
                    }
                %>
            </ul>
        </nav>
        <h3 class="text-muted">Assignment 2</h3>
    </div>

    <form action="${pageContext.request.contextPath}/Register" method="post">
        <h2>Register</h2>

        <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name"
                   value="<% if(session.getAttribute("firstName") != null) out.print(String.valueOf(session.getAttribute("firstName"))); %>"
                   required autofocus>

            <p class="help-block">Must only contain alphabets. Spaces are not allowed.</p>
        </div>
        <div style="color: #FF0000;">${errorMessage}</div>
        <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name"
                   value="<% if(session.getAttribute("lastName") != null) out.print(String.valueOf(session.getAttribute("lastName"))); %>"
                   required>
            <div style="color: #FF0000;">${errorMessage}</div>
            <p class="help-block">Must only contain alphabets. Spaces are not allowed.</p>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Email"
                   value="<% if(session.getAttribute("email") != null) out.print(String.valueOf(session.getAttribute("email"))); %>"
                   required>

            <div style="color: #FF0000;">${errorMessage}</div>
            <p class="help-block">Must be a valid email address.</p>
        </div>

        <div class="form-group">
            <label for="emailVerify">Re-Enter Email</label>
            <input type="email" class="form-control" id="emailVerify" name="emailVerify" placeholder="Re-Enter Email"
                   value="<% if(session.getAttribute("email") != null) out.print(String.valueOf(session.getAttribute("email"))); %>"
                   required>

            <div style="color: #FF0000;">${errorMessage}</div>
            <p class="help-block">Must match the above email address.</p>
        </div>

        <div class="form-group">
            <label for="telephone">Telephone #</label>
            <input type="number" class="form-control" id="telephone" name="telephone" placeholder="Telephone"
                   value="<% if(session.getAttribute("telephone") != null) out.print(String.valueOf(session.getAttribute("telephone"))); %>"
                   required>

            <div style="color: #FF0000;">${errorMessage}</div>
            <p class="help-block">Must only contain numbers.</p>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>

            <div style="color: #FF0000;">${errorMessage}</div>
            <p class="help-block">Your account password. Must contain at least one letter and number.</p>
        </div>

        <div class="form-group">
            <label for="passwordVerify">Re-Enter Password</label>
            <input type="password" class="form-control" id="passwordVerify" name="passwordVerify"
                   placeholder="Re-Enter Password" required>

            <div style="color: #FF0000;">${errorMessage}</div>
            <p class="help-block">Must match the password entered above.</p>
        </div>

        <hr>

        <div class="form-group">
            <button class="btn btn-md btn-primary" type="submit">Register</button>
        </div>
    </form>
</div>
</body>
</html>