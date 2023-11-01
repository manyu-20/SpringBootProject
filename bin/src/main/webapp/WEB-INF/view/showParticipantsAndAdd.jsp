<%@ page import="com.dk.bootwebapp.model.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 29/10/23
  Time: 11:57 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Participants</title>
</head>
<body>
<h1>Already Enrolled</h1>

<table>

  <tr>
    <th>Sr No.</th>
    <th>DOB</th>
    <th>Email</th>
    <th>Name</th>
    <th>Phone</th>
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
  </tr>
  <% srNO++;
  }
  } %>






</table>

<h1>Not enrolled</h1>

<table>

  <tr>
    <th>Sr No.</th>
    <th>DOB</th>
    <th>Email</th>
    <th>Name</th>
    <th>Phone</th>
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
    <td> <a href="/AssignTrainingById?employeeId=<%=employee.getId()%>&trainingId=${trainingId}"> <button>Assign</button> </a> </td>
  </tr>
  <% srNO++;
  }
  } %>






</table>

</body>
</html>
