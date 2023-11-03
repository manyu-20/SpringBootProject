<%@ page import="com.dk.bootwebapp.model.Training" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Trainings</title>
</head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            margin-bottom: 60px;
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

        header {
        background-color: #343a40;
        color: #ffffff;
        text-align: center;
        overflow: hidden;
        max-height: 100px;
    }

    </style>

<body>

    <header>
        <h2 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">All Trainings</h2>
        </header>

<div class="container mt-4">
    <h3 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">Previous Trainings</h3>
    <table class="table table-success table-striped">

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

    <h3 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">Current Trainings</h3>
    <table class="table table-success table-striped"">

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

    <h3 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">Future Trainings</h3>
    <table class="table table-success table-striped">

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
</div>

</body>
</html>
