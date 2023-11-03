<%@ page import="com.dk.bootwebapp.model.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 29/10/23
  Time: 11:57 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous" />
<html>
<head>
    <title>Course Participants</title>
</head>

<style>

  body {
      display: grid;
    min-height: 100vh;
  }

  .table-container {
      text-align: center;
  }

  table {
      width: 100%;
      margin: 0 auto;
      border-collapse: collapse;
  }

  th, td {
      text-align: center;
  }

  h4 {
    text-align: center;
padding-bottom: 1.5rem;
    padding-top: 1.2rem;
  }


  h1 {
      margin: 20px;
  }

  footer{
    margin-top: 10rem;
  }

</style>

<body>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
  <a class="navbar-brand" href="/home">All Trainings</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="ml-auto">
    <a class="nav-link text-dark" href="/home">Home</a>
  </div>
</nav>

    <div class="container mt-4">
    <h4 class="display-4 mb-2"> Already Enrolled</h4>
    <table class="table table-primary">

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
  <tr class="table-primary">
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

      <h4 class="display-4 mb-2"> Not Enrolled </h4>
    <table class="table table-primary">

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
  <tr class="table-primary">
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
