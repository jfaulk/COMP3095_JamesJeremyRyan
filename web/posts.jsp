<%--********************************************************************************************************************
* Project: COMP 3095 Message Board
* Assignment: Assignment 2
* Author(s): James Faulk
* Student Number: 100908684
* Date: 16 October 2015
* Description: posts.jsp checks if the user is logged in and gives an error message if not. Will be expanded on in a
               later assignment.
********************************************************************************************************************--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Posts</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<sql:setDataSource
        var="dataSource"
        driver="org.mariadb.jdbc.Driver"
        url="jdbc:mariadb://jamesfaulk.ca:6033/assignment2"
        user="comp3095" password="comp3095"
/>

<sql:query var="listPosts" dataSource="${dataSource}">
    SELECT * FROM posts
    INNER JOIN users
    WHERE posts.user_id = users.user_id
    ORDER BY post_timestamp
    DESC;
</sql:query>

<sql:query var="listComments" dataSource="${dataSource}">
    SELECT
    c.comment_id,
    c.comment_content,
    c.comment_timestamp,
    c.post_id,
    c.user_id,
    p.post_id,
    u.user_id,
    u.first_name,
    u.last_name
    FROM
    comments AS c,
    posts AS p
    INNER JOIN users AS u ON p.user_id = u.user_id
    WHERE
    c.post_id = p.post_id
    ORDER BY
    c.comment_timestamp DESC
</sql:query>

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
        <hr>
        <p><a href="newpost.jsp">Create a post!</a></p>
    </div>
    <c:forEach var="post" items="${listPosts.rows}">
        <div class="jumbotron">
            <h2>${post.post_title} - ${post.first_name}</h2>
            <p>${post.post_content}</p>
            <h6>Created: ${post.post_timestamp}</h6>
            <p align="right"><a href="comment.jsp?post=${post.post_id}">Post a comment</a></p>
            <hr>
            <c:forEach var="comment" items="${listComments.rows}">
            <c:if test="${comment.post_id == post.post_id}">
                <p>${comment.first_name} commented, "${comment.comment_content}" - ${comment.comment_timestamp}</p>
            </c:if>
            </c:forEach>
        </div>
    </c:forEach>
</div>
</body>
</html>

