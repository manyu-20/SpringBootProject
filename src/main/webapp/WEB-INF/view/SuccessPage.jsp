<%--
  Created by IntelliJ IDEA.
  User: abhimanyusaini
  Date: 28/10/23
  Time: 8:53 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Success Page</title>
</head>
<body>

<h1>Success Page</h1>
<h1>Redirecting to Home page in <span id="countdown">5</span> seconds</h1>

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
</body>
</html>
