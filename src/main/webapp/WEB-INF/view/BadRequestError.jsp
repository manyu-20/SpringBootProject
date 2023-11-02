<%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 02/11/23
  Time: 10:30 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <title>Success Page</title>
</head>
<body class="bg-light d-flex flex-column justify-content-center align-items-center" style="height: 100vh;">

<div class="text-center">
    <h1 class="display-3 mb-4">Bad Request</h1>
    <h2 class="lead">Redirecting to Home page in <span id="countdown" class="text-primary">5</span> seconds</h2>
</div>

<script>
    var seconds = 5; // Number of seconds for the countdown
    var countdownElement = document.getElementById("countdown");

    function countdown() {
        if (seconds > 0) {
            countdownElement.innerText = seconds;
            seconds--;
            setTimeout(countdown, 1000); // Update every second (1000 milliseconds)
        } else {
            window.location.href = "/home"; // Redirect to the target page
        }
    }

    countdown(); // Start the countdown
</script>

<!-- Include Bootstrap 5 JavaScript (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
