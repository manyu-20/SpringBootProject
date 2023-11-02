
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
