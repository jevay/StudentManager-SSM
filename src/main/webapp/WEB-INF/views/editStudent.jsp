<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery/jquery.min.js"></script>
<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet">
<title>Student Management - EDIT</title>
</head>
<body>
	<div class="editDIV">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Edit Student</h3>
			</div>
			
			<div class="panel-body">
				<form method="post" action="/updateStudent" role="form">
					<table class="editTable">
						<tr>
							<td>ID:</td>
							<td><input type="text" name="student_id" id="student_id" value="${student.student_id}" placeholder="Input your student id"></td>
						</tr>
						<tr>
							<td>Name:</td>
							<td><input type="text" name="name" id="name" placeholder="Input your name"></td>
						</tr>
						<tr>
							<td>Age:</td>
							<td><input type="text" name="age" id="age" placeholder="Input your age"></td>
						</tr>
						<tr>
							<td>Sex:</td>
							<td>
								<input type="radio" class="radio radio-inline" name="sex" value="Male"> Male
								<input type="radio" class="radio radio-inline" name="sex" value="Female"> Female
							</td>
						</tr>
						
						<tr>
							<td>Birthday:</td>
							<td><input type="date" name="birthday" id="birthday" placeholder="Input your birthday"></td>
						</tr>
						
						<tr class="submitTR">
							<td colspan="2" align="center">
								<input type="hidden" name="id" value="${student.id}">
								<button type="submit" class="btn btn-success">Submit</button>							
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>