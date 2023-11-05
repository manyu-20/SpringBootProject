<%@ page import="com.dk.bootwebapp.model.Training" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 28/10/23
  Time: 2:13 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous" />
<style>
    body {
        min-height: 100vh;
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
        color: #ffffff;
        text-align: center;
        max-height: 150px;
    }

    h2 {
        margin-bottom: 120px;
    }
    footer{
        margin-top: 5rem;
    }
</style>
<html>
<head>
    <title>Assign Training</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/home">My Trainings</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="ml-auto">
        <a class="nav-link text-dark" href="/home">Home</a>
    </div>
</nav>


    <h1></h1>

        <div class="container mt-4">

            <div class="card" style="background-color: #e3f2fd; margin-bottom: 1.5rem">
                <div class="card-body">
                    <h5 class="card-title">${name}</h5>
                    <p class="card-text">Employee ID ${eid}</p>
                    <a href="/getAllTrainings" class="card-link">Assign Trainings</a>
                </div>
            </div>
            <h3 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">Ongoing Unassigned</h3>


            <table class="table table-primary">

        <tr>
            <th>Sr No.</th>
            <th>Topic</th>
            <th>Location</th>
            <th>Start Date</th>
            <th>End Date</th>
        </tr>
        <% List<Training> std = (List<Training>) request.getAttribute("currentUnassigned");
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



            <h3 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">Ongoing Assigned</h3>
        <table class="table table-primary">

            <tr>
                <th>Sr No.</th>
                <th>Topic</th>
                <th>Location</th>
                <th>Start Date</th>
                <th>End Date</th>
            </tr>
            <% std = (List<Training>) request.getAttribute("currentAssigned");
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




            <h3 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">Future Unassigned</h3>
            <table class="table table-primary">

                <tr>
                    <th>Sr No.</th>
                    <th>Topic</th>
                    <th>Location</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                </tr>
                <% std = (List<Training>) request.getAttribute("FutureUnassigned");
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



            <h3 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">Future Assigned</h3>
                <table class="table table-primary">

                    <tr>
                        <th>Sr No.</th>
                        <th>Topic</th>
                        <th>Location</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                    </tr>
                    <% std = (List<Training>) request.getAttribute("FutureAssigned");
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
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        Trainee Management System
    </div>
</footer>


</body>
</html>
