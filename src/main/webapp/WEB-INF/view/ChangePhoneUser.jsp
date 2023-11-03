<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous" />
    <title>Title</title>
    <style>
        .form_container {
            width: 50%;
            height: auto;
            display: flex;
            border-radius: 10px;
            margin: 5rem auto;
            margin-bottom: 7rem;
            box-shadow: 0px 3px 3px -2px rgb(0 0 0 / 20%), 0px 3px 4px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px auto;
        }


        input {
            outline: none;
            border: none;
            width: 370px;
            padding: 15px;
            border-radius: 10px;
            background-color: #e3f2fd;
            margin: 5px 0;
            font-size: 14px;
        }
    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/home">Edit Contact</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
</nav>

<div class="form_container">
    <form method="post" action="/changePhone" >
        <h1 class="display-4" style="padding: 1rem;">Update Mobile No</h1>
        <input
                type="text"
                id="Name"
                value="${sessionScope.employeeName}"
                disabled
        />
        <input
                type="text"
                id="Email"
                value="${sessionScope.user}"
                disabled
        />
<%--        <input
                type="text"
                id="Date of Birth"
                value="${sessionScope.dob}"
                disabled
        />
        <input
                type="text"
                id="Date of Joining"
                value="${sessionScope.doj}"
                disabled
        />--%>
        <input
                placeholder="Phone No."
                type="text"
                id="phone"
                name="phone"
                required
                th:field="*{phone}"
        />
        <input class="btn btn-primary" type="submit" value="Update" style="width: 120px;">

<%--        <button type="submit">
            Update
        </button>--%>
    </form>
</div>
<footer class="text-center text-lg-start" style="background-color: #e3f2fd;">
    <div class="text-center p-3">
        Trainee Management System
    </div>
</footer>
</body>
</html>


