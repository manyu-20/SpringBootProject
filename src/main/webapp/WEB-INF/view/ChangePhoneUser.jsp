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
    <title>Title</title>
</head>
<body>

<h1>Input Phone number</h1>
<form method="post" action="/changePhone">
    <label for="phone">phone:</label>
    <input type="text" id="phone" name="phone" required th:field="*{phone}"><br><br>


    <input type="submit" value="Update">
</form>

</body>
</html>
