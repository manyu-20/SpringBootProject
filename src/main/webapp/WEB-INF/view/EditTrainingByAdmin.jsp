<%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 28/10/23
  Time: 2:14 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="/updateTraining" method="post">
    <label for="id">Training ID: ${id}</label>
    <input type="hidden" id="id" name="id" value="${id}" required><br><br>

    <label>Choose the item to update:</label><br>
    <input type="radio" id="updateLocation" name="updateType" value="updateLocation">
    <label for="updateLocation">Update Location</label><br>

    <input type="radio" id="updateTopic" name="updateType" value="updateTopic">
    <label for="updateTopic">Update Topic</label><br>

    <input type="radio" id="updateStartDate" name="updateType" value="updateStartDate">
    <label for="updateStartDate">Update Start Date</label><br>

    <input type="radio" id="updateEndDate" name="updateType" value="updateEndDate">
    <label for="updateEndDate">Update End Date</label><br><br>

    <label for="newValue">New Value:</label>
    <input type="text" id="newValue" name="newValue" required><br><br>

    <input type="submit" value="Update Training">
</form>


</body>
</html>
