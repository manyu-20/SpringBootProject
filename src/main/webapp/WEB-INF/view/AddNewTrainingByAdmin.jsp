<html>
    <head>
        <title>Add new training</title>
    </head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style>

    body {
       text-align: center;
       background: #3bb19b;
       justify-content: center;
       overflow: hidden;
    }

    h4 {
        margin-top: 10px;
        color: white;
        padding: 10px;
    }

    .form-container{
        background-color: white;
        padding: 15px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        margin-bottom: 50px;
        display: inline-block;
    }

    .form{
        margin: 0 auto;
        max-width: 400px;
        display: block;
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
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color:white;
            color: black;
            border: none;
            font-size: 20px;
            max-width: 150px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #095245;
            color: #92f0df;
        }

        header {
        background-color: grey;
        text-align: center;
        overflow: hidden;
        margin-bottom: 20px;
        }

</style>

<body>
    <header>
    <h4 class="display-4">Add New Trainings</h4>
    </header>

    <div>
    <form class="form" method="post" action="/addTraining">

    <label for="startDate">Start Date:</label>
    <input type="date" id="startDate" name="startDate"><br><br>

    <label for="endDate">End Date:</label>
    <input type="date" id="endDate" name="endDate" required><br><br>

    <label for="topic">Topic:</label>
    <input type="text" id="topic" name="topic" required><br><br>

    <label for="trainerName">Trainer Name:</label>
    <input type="text" id="trainerName" name="trainerName" required><br><br>

    <label for="location">Location:</label>
    <input type="text" id="location" name="location" required><br><br>

 <div class="one">
    <input type="submit" value="Add">
    </div>
</form>
</div>

</body>
</html>
