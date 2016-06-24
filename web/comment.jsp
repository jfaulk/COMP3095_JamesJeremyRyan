<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>New Comment</title>
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
    <form action="${pageContext.request.contextPath}/Comment" method="post">
        <h2>New Comment</h2>

        <div class="form-group">
            <label for="commentContent">Comment</label>
            <textarea class="form-control" id="commentContent" name="commentContent" required><% if(session.getAttribute("commentContent") != null) out.print(String.valueOf(session.getAttribute("commentContent"))); %></textarea>
            <input type="hidden" id="postId" name="postId" value="${param.post}"/>
            <div style="color: #FF0000;">${errorMessage}</div>
        </div>
        <hr>
        <div class="form-group">
            <button class="btn btn-md btn-primary" type="submit">Comment!</button>
        </div>
    </form>
</div>
</body>
</html>
