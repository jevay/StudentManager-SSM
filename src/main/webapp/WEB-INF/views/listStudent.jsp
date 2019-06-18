<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDENT MANAGEMENT SYSTEM</title>
<script type="text/javascript" src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet">

<script type="text/javascript">
		$(function(){
			$("ul.pagination li.disabled a").click(function(){
				return false;
			});
		});
	</script>
</head>
<body>
	<div class="listDIV">
		<table
			class="table talbe-striped table-borded table-hover table-condensed">
			<caption>Student List - total ${page.total} persons</caption>
			<thead>
				<tr class="success">
					<th>Number</th>
					<th>Name</th>
					<th>Age</th>
					<th>Sex</th>
					<th>Birthday</th>

					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${students}" var="s" varStatus="status">
					<tr>
						<td>${s.student_id}</td>
						<td>${s.name}</td>
						<td>${s.age}</td>
						<td>${s.sex}</td>
						<td>${s.birthday}</td>

						<td><a href="/editStudent?id=${s.id}"><span
								class="glyphicon glyphicon-edit"></span></a></td>
						<td><a href="/deleteStudent?id=${s.id}"><span
								class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<nav class="pageDIV">
		<ul class="pagination">
			<li <c:if test="${!page.hasPreviouse}" class="disabled" </c:if>>
				<a href="?page.start=0"> 
					<span>«</span>
				</a>
			</li>
			<li <c:if test="${!page.hasPreviouse}" class="disabled" </c:if>>
				<a href="?page.start=${page.start-page.count}"> 
					<span>‹</span>
				</a>
			</li>

			<c:forEach begin="0" end="${page.totalPage - 1}" varStatus="status">
				<c:if
					test="#{status.index*page.count-page.start <=30 && status.count*page.count - page.start >= -10}">
					<li
						<c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
						<a href="?page.start=${status.index*page.count}"
							<c:if test="${status.index*page.count==page.start}">class="current"</c:if>>${status.count}
						</a>
					</li>
				</c:if>
			</c:forEach>

			<li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
				<a
					href="?page.start=${page.start+page.count}"> <span>›</span>
				</a>
			</li>
			
			<li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
				<a href="?page.start=${page.last}"> <span>»</span>
				</a>
			</li>
		</ul>
	</nav>
	
	<div class="addDiv">
		<div class="panel-heading">
			<h3 class="panel-title">Add student</h3>
		</div>
		
		<div class="panel-body">
			<form method="post" action="/addStudent" role="form">
				<table class="addTable">
					<tr>
						<td>ID:</td>
						<td><input type="text" name="student_id" id="student_id" placeholder="Input student id"></td>
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
							<button type="submit" class="btn btn-success">Submit</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>