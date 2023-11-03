<%@ page import="com.dk.bootwebapp.model.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 29/10/23
  Time: 11:57 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<html>
<head>
    <title>Course Participants</title>
</head>

<style>

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

  header {
      background-color: #343a40;
      color: #ffffff;
      text-align: center;
      overflow: hidden;
      max-height: 100px;
  }

  h1 {
      margin: 20px;
  }

  footer{
    margin-top: 10rem;
  }

</style>

<body>

  <header>
    <h1 class="display-5"><b>Trainee Participants</b></h1>
  </header>

    <div class="container mt-4">
    <h4 class="display-5 mb-2" style="text-align: center; padding-bottom: 1.5rem;"><b>Already Enrolled</b></h4>
    <table class="table table-success table-striped">

  <tr>
    <th>Sr No.</th>
    <th>DOB</th>
    <th>Email</th>
    <th>Name</th>
    <th>Phone</th>
    <th> Remove </th>
  </tr>
  <% List<Employee> std = (List<Employee>) request.getAttribute("current");
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
    <td> <a href="/RemoveEmployeeTrainingById?employeeId=<%=employee.getId()%>&trainingId=${trainingId}"> <button type="button" class="btn btn-light">Remove</button> </a> </td>
  </tr>
  <% srNO++;
  }
  } %>

</table>

<h4 class="display-5 mb-2" style="text-align: center; padding-bottom: 1.5rem;"><b>Not Enrolled</b></h4>
    <table class="table table-success table-striped">

  <tr>
    <th>Sr No.</th>
    <th>DOB</th>
    <th>Email</th>
    <th>Name</th>
    <th>Phone</th>
    <th> Assign </th>
  </tr>
  <% std = (List<Employee>) request.getAttribute("rest");
    srNO = 1;
    if (std != null) {
      for (Employee employee : std) { %>
  <%-- Arranging data in tabular form --%>
  <tr>
    <td><%= srNO %></td>
    <td><%= employee.getDob() %></td>
    <td><%= employee.getEmail() %></td>
    <td><%= employee.getName() %></td>
    <td><%= employee.getPhone() %></td>
    <td> <a href="/AssignTrainingById?employeeId=<%=employee.getId()%>&trainingId=${trainingId}"> <button type="button" class="btn btn-light">Assign</button> </a> </td>
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
