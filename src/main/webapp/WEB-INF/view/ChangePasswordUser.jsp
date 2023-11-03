<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous" />    <title>Password Update Form</title>
    <style>
        .container {
            margin-top: 2rem;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/home">Edit Password</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
</nav>
<div class="container">
    <h1 class="display-4">Password Update</h1>
    <form method="post" action="/changePassword">
        <div class="mb-3">
            <label for="newPassword" class="form-label">New Password</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            <small id="passwordHelp" class="form-text text-muted">Your password must be at least 8 characters long.</small>
        </div>
        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm New Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
        </div>
        <button type="submit" class="btn btn-primary">Update Password</button>
    </form>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");
        const newPassword = document.getElementById("newPassword");
        const confirmPassword = document.getElementById("confirmPassword");

        form.addEventListener("submit", function (event) {
            // Reset previous validation messages
            newPassword.setCustomValidity("");
            confirmPassword.setCustomValidity("");
            console.log(newPassword.value.length)
            if (newPassword.value.length < 8) {
                newPassword.setCustomValidity("Password must be at least 8 characters long.");
            }
            console.log("new pass", newPassword.value);
            console.log("current pass", confirmPassword.value)
            if (newPassword.value !== confirmPassword.value) {
                confirmPassword.setCustomValidity("Passwords do not match.");
            }

            if (form.checkValidity() === false) {
                event.preventDefault(); // Prevent form submission if there are validation errors
                event.stopPropagation();
            }
        });
    });
</script>

</body>
</html>






<%--
<html>
    <style>

    body {
        text-align: center;
        margin: 0%;
    }

    input {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-top: 6px;
        margin-bottom: 16px;
      }

      /* Style the submit button */
      input[type=submit] {
        background-color: 3bb19b;
        color: white;
        max-width: 40%;
        border-radius: 12px;
      }


      /* Style the container for inputs */
      .container {
        background-color: #f1f1f1;
        padding: 20px;
        width: 30%;
        margin-left: 600px;
      }

      form {
       display: inline-block;
      }

      #message {
        display:none;
        background: #f1f1f1;
        color: #000;
        position: relative;
        padding: 20px;
        width: 30%;
        margin-left: 600px;
        margin-top: 10px;
      }

      #message p {
        padding: 10px 15px;
        font-size: 16px;
        font-weight: 100;
        font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
      }

      /* Add a green text color and a checkmark when the requirements are right */
      .valid {
        color: green;
      }

      .valid:before {
        position: relative;
        left: -35px;
      }

      label {
        font-size: 30px;
        font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
      }

      /* Add a red text color and an "x" icon when the requirements are wrong */
      .invalid {
        color: red;
      }

      .invalid:before {
        position: relative;
        left: -35px;
      }

      input[type="submit"]:hover {
            background-color: #095245;
            color: #92f0df;
        }

        header {
            background-color: 3bb19b;
            margin-bottom: 160px;
            max-width: 100%;
            height: 60px;
            padding: 10px;
            font-size: larger;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        h3 {
          color: white;
          margin-bottom: 10px;
          font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        h4 {
          color: black;
          font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

    </style>
<body>

    <header>
        <h3>Change Password</h3>
    </header>

<div class="container">
    <form action="/action_page.php">
      <!-- <label for="usrname">Username</label>
      <input type="text" id="usrname" name="usrname" required> -->

      <label for="psw"><b>New Password</b></label>
    <input type="password" id="psw" name="psw" pattern="(?=.\d)(?=.[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>

      <input type="submit" value="Submit">
    </form>
  </div>

  <div id="message">
    <h4>Password must contain the following:</h4>
    <p id="letter" class=" invalid">A <b>lowercase</b> letter</p>
    <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
    <p id="number" class="invalid">A <b>number</b></p>
    <p id="length" class="invalid">Minimum <b>8 characters</b></p>
  </div>

  <script>
    var myInput = document.getElementById("psw");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");

    myInput.onfocus = function() {
      document.getElementById("message").style.display = "block";
    }

    myInput.onblur = function() {
      document.getElementById("message").style.display = "none";
    }

    myInput.onkeyup = function() {
      var lowerCaseLetters = /[a-z]/g;
      if(myInput.value.match(lowerCaseLetters)) {
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
}

  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("invalid");
    number.classList.add("valid");
  }

  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>

</body>
  </html>--%>
