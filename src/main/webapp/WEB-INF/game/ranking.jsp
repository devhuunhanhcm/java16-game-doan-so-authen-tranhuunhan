<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ page import="cybersoft.javabackend.gamedoanso.util.JspConst"%>
<!doctype html>
<html lang="en">
<head>
<title>Ranking board</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<section class="container mt-5 w-60">
	<a href="<%= request.getContextPath() + JspConst.HOME%>" class="btn btn-primary">Quay về trang chủ</a>
		<section class="row h-100 justify-content-center align-content-center">
			<h1>Ranking board</h1>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Rank</th>
						<th scope="col">Username</th>
						<th scope="col">Point</th>
						<th scope="col">Timestamp</th>
						<th scope="col">ID</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="rank" items="${ ranks }" varStatus="loop">
						<tr>
							<th scope="row">${loop.index + 1 }</th>
							<td>${rank.player.username }</td>
							<td>${rank.point }</td>
							<td>${rank.finishDate}</td>
							<td>${rank.id }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	</section>



	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>