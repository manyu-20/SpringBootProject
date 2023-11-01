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
	padding: 20px 0px;
	cursor: pointer;
	transition: all 0.15s ease-in-out;
	background-color: white;
	font-size: 13px;
	font-weight: 700;
	color: gray;
}

.card-text{
    margin-top:25px;
    font-size:25px;
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

.nvbr {
	background-color: #5a9c97;
	height: 50px;
	display: flex;
	padding: 5px 20px;
	justify-content: space-between;
	align-items: center;
	box-shadow: -1px 1px 4px rgb(168, 168, 168);
	color: white;
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
</style>
</head>
<body>
	<div>
		<div class="nvbr">
			<p class="log">
				<a href="/logout"> Logout </a>
			</p>
		</div>
		<h1>Hello ${sessionScope.employeeName}</h1>
		<div class="adminCrd">
			<div class="card">
				<img class="card-img-top" src="/images/Password.png" alt="Card image cap" />
				<div class="card-body">
					<p class="card-text">
						<a href="/changePasswordUser"> Change Password </a>
					</p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="/images/phone.jpeg" alt="Card image cap" />
				<div class="card-body">
					<p class="card-text">
						<a href="/changePhone"> Change Phone No. </a>
					</p>
				</div>
			</div>

			<div class="card">
				<img class="card-img-top" src="/images/course.png" alt="Card image cap" />
				<div class="card-body">
					<p class="card-text">
						<a href="/viewTrainings?empId=${empId}"> Show my courses </a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>




