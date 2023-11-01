<%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 28/10/23
  Time: 2:12 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Phone</title>

</head>
<body>
<h1>Input password number</h1>
<h2>Name : ${sessionScope.employeeName}</h2>
<h2>Email : ${sessionScope.user}</h2>
<h2>DOB  : ${sessionScope.dob}</h2>
<h2>DOJ  : ${sessionScope.doj}</h2>
<form method="post" action="/changePassword">
    <label for="password">password:</label>
    <input type="text" id="password" name="password" required th:field="*{password}"><br><br>


    <input type="submit" value="Update">
</form>
</body>
</html>
