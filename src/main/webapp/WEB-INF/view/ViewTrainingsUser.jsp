<%@ page import="com.dk.bootwebapp.model.Training" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Trainings</title>
</head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous" />    <style>
        body {
            display: grid;
        }

        .table-container {

            text-align: center;
        }

        table {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
            margin-bottom: 20px; /* Adjust as needed */
        }

        th, td {
            padding: 15px; /* Adjust as needed */
            text-align: center;
        }

        h4 {
            margin-bottom: 20px; /* Adjust as needed */
        }

        footer{
            margin-top: 4rem;
        }


    </style>

<body>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/home">My Trainings</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
</nav>



<div class="container mt-4">
    <h3 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">Previous Trainings</h3>
    <table class="table table-primary">

        <thead>
        <tr>
            <th>Sr No.</th>
            <th>Topic</th>
            <th>Location</th>
            <th>Start Date</th>
            <th>End Date</th>
        </tr>
        </thead>
        <% List<Training> std = (List<Training>) request.getAttribute("previous");
            int srNO = 1;
            int sizeOutboxList = (std != null) ? std.size() : 0; // Add a null check here
            if (std != null) {
                for (Training training : std) { %>
        <%-- Arranging data in tabular form --%>
        <tr class="table-primary">
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

    <h3 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">Current Trainings</h3>
    <table class="table table-primary">

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
        <tr class="table-primary">
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

    <h3 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">Future Trainings</h3>
    <table class="table table-primary">

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
        <tr class="table-primary">
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
</div>

<footer class="text-center text-lg-start" style="background-color: #e3f2fd;">
    <div class="text-center p-3">
        Trainee Management System
    </div>
</footer>

</body>
</html>
