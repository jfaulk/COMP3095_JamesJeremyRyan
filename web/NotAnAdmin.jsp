<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Not An Admin</title>
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
                        out.print("<li role=\"presentation\" class=\"active\"><a href=\"posts.jsp\">Posts</a></li>");
                        out.print("<li role=\"presentation\"><a href=\"logout.jsp\">Logout</a></li>");
                    } else {
                        out.print("<li role=\"presentation\"><a href=\"login.jsp\">Login</a></li>");
                        out.print("<li role=\"presentation\"><a href=\"register.jsp\">Register</a></li>");
                    }
                %>
            </ul>
        </nav>
        <h3 class="text-muted">Assignment 2</h3>
        <p>WARNING: You are attempting to access an Administrator only section of this web site.</p>
    </div>
</div>
</body>
</html>
