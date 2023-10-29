<%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 28/10/23
  Time: 2:10 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log In</title>
</head>
<body>
<h1>Login Page</h1>

<form method="post" action="/home">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required th:field="*{username}"><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required th:field="*{password}"><br><br>

    <input type="submit" value="Login">
</form>

</body>
</html>
