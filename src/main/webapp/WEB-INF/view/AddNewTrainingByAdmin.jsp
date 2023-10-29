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
    <title>Add Trainings</title>
</head>
<body>
<h1>Add new training</h1>
<form method="post" action="/addTraining">
    <label for="startDay">Start Day:</label>
    <input type="number" id="startDay" name="startDay" required><br><br>

    <label for="startMonth">Start Month:</label>
    <input type="number" id="startMonth" name="startMonth" required><br><br>

    <label for="startYear">Start Year:</label>
    <input type="number" id="startYear" name="startYear" required><br><br>

    <label for="endDay">End Day:</label>
    <input type="number" id="endDay" name="endDay" required><br><br>

    <label for="endMonth">End Month:</label>
    <input type="number" id="endMonth" name="endMonth" required><br><br>

    <label for="endYear">End Year:</label>
    <input type="number" id="endYear" name="endYear" required><br><br>

    <label for="topic">Topic:</label>
    <input type="text" id="topic" name="topic" required><br><br>

    <label for="trainerName">Trainer Name:</label>
    <input type="text" id="trainerName" name="trainerName" required><br><br>

    <label for="location">Location:</label>
    <input type="text" id="location" name="location" required><br><br>

    <input type="submit" value="Add Training">
</form>
</body>
</html>
