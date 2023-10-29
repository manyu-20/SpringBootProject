<%@ page import="com.dk.bootwebapp.model.Training" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 28/10/23
  Time: 2:12 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My trainings</title>
</head>
<body>
<p><a href="/home"><button>Go back to Home</button></a></p>

<h2>Previous Training</h2>
<table>

    <tr>
        <th>Sr No.</th>
        <th>Topic</th>
        <th>Location</th>
        <th>Start Date</th>
        <th>End Date</th>
    </tr>
    <% List<Training> std = (List<Training>) request.getAttribute("previous");
        int srNO = 1;
        int sizeOutboxList = (std != null) ? std.size() : 0; // Add a null check here
        if (std != null) {
            for (Training training : std) { %>
    <%-- Arranging data in tabular form --%>
    <tr>
        <td><%= srNO %></td>
        <td><%= training.getTopic() %></td>
        <td><%= training.getLocation() %></td>
        <td><%= training.getStartDate().toString()%></td>
        <td><%= training.getEndDate().toString() %></td>
    </tr>
    <% srNO++;
    }
    } %>

</table>

<h2>Current Training</h2>

<table>

    <tr>
        <th>Sr No.</th>
        <th>Topic</th>
        <th>Location</th>
        <th>Start Date</th>
        <th>End Date</th>
    </tr>
    <% std = (List<Training>) request.getAttribute("current");
        srNO = 1;
        if (std != null) {
            for (Training training : std) { %>
    <%-- Arranging data in tabular form --%>
    <tr>
        <td><%= srNO %></td>
        <td><%= training.getTopic() %></td>
        <td><%= training.getLocation() %></td>
        <td><%= training.getStartDate().toString()%></td>
        <td><%= training.getEndDate().toString() %></td>
    </tr>
    <% srNO++;
    }
    } %>

</table>

<h2>Future Training</h2>

<table>

    <tr>
        <th>Sr No.</th>
        <th>Topic</th>
        <th>Location</th>
        <th>Start Date</th>
        <th>End Date</th>
    </tr>
    <% std = (List<Training>) request.getAttribute("future");
        srNO = 1;
        if (std != null) {
            for (Training training : std) { %>
    <%-- Arranging data in tabular form --%>
    <tr>
        <td><%= srNO %></td>
        <td><%= training.getTopic() %></td>
        <td><%= training.getLocation() %></td>
        <td><%= training.getStartDate().toString()%></td>
        <td><%= training.getEndDate().toString() %></td>
    </tr>
    <% srNO++;
    }
    } %>

</table>





</body>
</html>
