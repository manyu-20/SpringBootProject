<%@ page import="com.dk.bootwebapp.model.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 28/10/23
  Time: 8:16 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
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

    h2 {
        background-color: aquamarine;
    }
</style>

<body>

  <div class="container mt-4">

      <h2 class="display-4 mb-2" style="text-align: center; padding-bottom: 1.5rem;">List of all Trainings</h2>
      </div>

      <div class="container mt-4">
          <table class="table table-success table-striped">

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
        <tr>
            <td><%= srNO %></td>
            <td><%= employee.getDob() %></td>
            <td><%= employee.getEmail() %></td>
            <td><%= employee.getName() %></td>
            <td><%= employee.getPhone() %></td>
        </tr>
        <% srNO++;
        }
        } %>
    </table>
</div>
</body>
</html>
