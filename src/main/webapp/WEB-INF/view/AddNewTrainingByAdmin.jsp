<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Add new training</title>
    </head>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous" />
<style>

    body {
       text-align: center;
       justify-content: center;
    }

    h4 {
        margin-top: 10px;
        color: white;
        padding: 10px;
    }

    .form_container {
        width: 50%;
        height: auto;
        display: flex;
        border-radius: 10px;
        margin: 5rem auto;
        margin-bottom: 7rem;
        box-shadow: 0px 3px 3px -2px rgb(0 0 0 / 20%), 0px 3px 4px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
        padding-top: 3rem;
        padding-bottom: 3rem;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 20px auto;
    }

    label{
        display: flex;
        color: black;
        text-decoration: solid;
    }

    .one{
        height: 10px;
        font-size: large;
    }

    input {
        outline: none;
        border: none;
        width: 370px;
        padding: 15px;
        border-radius: 10px;
        background-color: #e3f2fd;
        font-size: 14px;
    }






</style>

<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/home">Add Training</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="ml-auto">
        <a class="nav-link text-dark" href="/home">Home</a>
    </div>
</nav>

    <div>
        <form class="form_container form-group" method="post" action="/addTraining">

            <label for="startDate">Start Date</label>
            <input type="date" id="startDate" name="startDate"><br><br>

            <label for="endDate">End Date</label>
            <input type="date" id="endDate" name="endDate" required><br><br>

            <label for="topic">Topic</label>
            <input type="text" id="topic" name="topic" placeholder="Topic" required><br><br>

            <label for="trainerName">Trainer Name</label>
            <input type="text" id="trainerName" name="trainerName" placeholder="Trainer Name" required><br><br>

            <label for="location">Location</label>
            <input type="text" id="location" name="location" placeholder="Location" required><br><br>

            <input class="btn btn-primary" type="submit" value="Add" style="width: 120px;">

        </form>
</div>

</body>
</html>
