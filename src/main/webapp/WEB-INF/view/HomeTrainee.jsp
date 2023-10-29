<%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 28/10/23
  Time: 2:11 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Trainee</title>
</head>
<body>

</body><p><a href="/logout"><button>Logout</button></a></p>
<h1>Hello ${sessionScope.employeeName}</h1>
<h1>Trainee Home</h1>
<p><a href="/changePasswordUser"><button>Change Password</button></a></p>
<p><a href="/changePhone"><button>Change Phone</button></a></p>
<p><a href="/viewTrainings?empId=${empId}"><button>Show my courses</button></a></p>

</html>
