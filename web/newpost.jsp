<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2015-11-27
  Time: 3:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>New Post</title>
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
</div>
<form action="${pageContext.request.contextPath}/Posts" method="post">
    <h2>New Post</h2>

    <div class="form-group">
        <label for="postTitle">Post Title</label>
        <input type="text" class="form-control" id="postTitle" name="postTitle" placeholder="Post Title"
               value="<% if(session.getAttribute("postTitle") != null) out.print(String.valueOf(session.getAttribute("postTitle"))); %>"
               required autofocus>

    </div>
    <div style="color: #FF0000;">${errorMessage}</div>
    <div class="form-group">
        <label for="postContent">Post Content</label>
        <textarea class="form-control" id="postContent" name="postContent" required><% if(session.getAttribute("postContent") != null) out.print(String.valueOf(session.getAttribute("postContent"))); %></textarea>
        <div style="color: #FF0000;">${errorMessage}</div>
    </div>
    <hr>
    <div class="form-group">
        <button class="btn btn-md btn-primary" type="submit">Post!</button>
    </div>
</form>
</div>
</body>
</html>
