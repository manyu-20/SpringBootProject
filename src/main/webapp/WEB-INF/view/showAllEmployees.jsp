<%@ page import="com.dk.bootwebapp.model.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 28/10/23
  Time: 8:16 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous" /><html>
<head>
    <title>Trainee List</title>
</head>

<style>

    .table-container {
        text-align: center;
    }

    th, td {
        text-align: center;
    }

    header {
        background-color: #343a40;
    }
</style>

<body>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/home">Employee List</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="ml-auto">
        <a class="nav-link text-dark" href="/home">Home</a>
    </div>
</nav>

      <div class="container mt-4">
          <table class="table table-primary">

        <tr>
            <th>Sr No.</th>
            <th>DOB</th>
            <th>Email</th>
            <th>Name</th>
            <th>Phone</th>
        </tr>
        <% List<Employee> std = (List<Employee>) request.getAttribute("listOfTrainees");
            int srNO = 1;
            int sizeOutboxList = (std != null) ? std.size() : 0; // Add a null check here
            if (std != null) {
                for (Employee employee : std) { %>
        <%-- Arranging data in tabular form --%>
        <tr class="table-primary">
            <td><%= srNO %></td>
            <td><%= employee.getDob() %></td>
            <td><%= employee.getEmail() %></td>
            <td><%= employee.getName() %></td>
            <td><%= employee.getPhone() %></td>
            <td> <a href="/RemoveEmployeeTrainingById?employeeId=<%=employee.getId()%>&trainingId=${trainingId}"> <button type="button" class="btn btn-light">Explore</button> </a> </td>

        </tr>
        <% srNO++;
        }
        } %>
    </table>
</div>
</body>
</html>
