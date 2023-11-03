<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<title>Login</title>
	<style>
		body {
			background-color: #f8f9fa;
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100vh;
		}
		.container {
			text-align: center;
			border: 1px solid #dcdcdc;
			border-radius: 10px;
			padding: 20px;
			box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
			max-width: 700px;
			width: 100%;
			background-color: #e3f2fd;

		}
		.alert {
			display: none; /* Initially hide the error banner */
			margin-top: 20px;
		}
		.image-container {
			text-align: center; /* Center the image horizontally */
			margin-bottom: 20px;
		}
		.login-image {
			max-width: 100%;
			max-height: 600px;
		}
	</style>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-6"> <!-- Adjust the column size as needed -->
			<div class="image-container">
				<img src="./images/login1.png" alt="Image" class="login-image">
			</div>
		</div>
		<div class="col-md-6"> <!-- Adjust the column size as needed -->
			<h2 class="mb-4">Training Management Sign In</h2>
			<c:if test="${param.error != null}">
				<div class="alert alert-danger">
					<p>${param.error}</p>
				</div>
			</c:if>
			<form method="post" action="/home">
				<div class="mb-3">
					<label for="email" class="form-label">Email</label>
					<input type="email" class="form-control border-0 border-bottom border-info" id="username" name="username" required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password</label>
					<input type="password" class="form-control border-0 border-bottom border-info" id="password" name="password" required>
				</div>
				<button type="submit" class="btn btn-info">Login</button>
			</form>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
	// Show the error banner if there's an error
	const errorBanner = document.querySelector(".alert");
	if (errorBanner && errorBanner.textContent.trim() !== "") {
		errorBanner.style.display = "block";
	}
</script>
</body>
</html>









<%--
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<style>
.form_container {
	margin: auto;
	margin-top: 16%;
	width: 50%;
	height: 400px;
	display: flex;
	border-radius: 10px;
	box-shadow: 0px 3px 3px -2px rgb(0 0 0/ 20%), 0px 3px 4px 0px
		rgb(0 0 0/ 14%), 0px 1px 8px 0px rgb(0 0 0/ 12%);
}
.error{
color:red;
font-size: 25px;
 font-weight: bold;

}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 20px auto;
}


.button {
	border: none;
	outline: none;
	padding: 12px 0;
	background-color: white;
	border-radius: 20px;
	width: 180px;
	font-weight: bold;
	font-size: 14px;
	cursor: pointer;
	background-color: #3bb19b;
	color: white;
	margin: 10px;
}

input {
	outline: none;
	border: none;
	width: 370px;
	padding: 15px;
	border-radius: 10px;
	background-color: #edf5f3;
	margin: 5px 0;
	font-size: 14px;
}
</style>
</head>
<body>
	<div class="form_container">


		<form method="post" action="/home">
			<h1>Login to Your Account</h1>
			<input type="text" id="username" name="username"
				placeholder="Email" required th:field="*{username}"><br>
			<br> <input type="password" id="password" name="password"
				placeholder="Password" required th:field="*{password}"><br>
				
				<c:if test="${param.error != null}">
    <div class="error">
        <p>${param.error}</p>
    </div>
</c:if>
			<br> <input type="submit" class="button" value="Login">
		</form>
	</div>
</body>
</html>
--%>
