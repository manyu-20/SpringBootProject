<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<title>Home Trainee</title>
<style>
.card {
	width: 90%;
	min-height: 320px;
	margin: 10px;
	text-align: center;
	box-shadow: 0px 1px 10px lightgrey;
	border-radius: 10px;
	cursor: pointer;
	background-color: #e3f2fd;
	font-size: 13px;
	font-weight: 700;
	padding: 3rem 0px 20px;
	transition: transform 0.3s ease;

}
.card:hover {
	transform: translateY(-10px); /* Lift the div up by 10 pixels on hover */
}

.card-text{
    margin-top:25px;
    font-size:25px;
}

.logout{
	color:white;
	font-weight:bold;
	font-size:20px;
}

@media only screen and (min-width: 900px) {
	.card {
		width: calc(100%/ 4);
	}
}

.adminCrd {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	margin-top:5%;
}

.log{
	margin-top:20px;
}

h1 {
	text-align: center;
	margin-top: 3%;
}
.card-img-top{
width: 150px; 
height: 150px;
margin-right:auto;
margin-left: auto;
}
footer{
	margin-top: 10rem;
	justify-content: center;
}
</style>
</head>
<body>
	<div>
		<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
			<a class="navbar-brand" href="/home">Trainee Management</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="ml-auto">
				<a class="nav-link" href="/logout">Logout</a>
			</div>
		</nav>
		<h1>Welcome ${sessionScope.employeeName}</h1>
		<div class="adminCrd">
			<div class="card">
				<img class="card-img-top" src="/images/Password.png" alt="Card image cap" />
				<div class="card-body">
					<p class="card-text lead">
						<a href="/changePasswordUser"> Change Password </a>
					</p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="/images/phone.jpeg" alt="Card image cap" />
				<div class="card-body">
					<p class="card-text lead">
						<a href="/changePhone"> Change Phone No. </a>
					</p>
				</div>
			</div>

			<div class="card">
				<img class="card-img-top" src="/images/course.png" alt="Card image cap" />
				<div class="card-body">
					<p class="card-text lead">
						<a href="/viewTrainings?empId=${sessionScope.employeeId}"> Show my courses </a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<footer class="text-center text-lg-start" style="background-color: #e3f2fd;">
		<div class="text-center p-3">
			Trainee Management System
		</div>
	</footer>
</body>
</html>




