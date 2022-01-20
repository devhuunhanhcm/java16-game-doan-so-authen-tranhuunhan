<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cybersoft.javabackend.gamedoanso.util.JspConst"%>
<%@ page import="cybersoft.javabackend.gamedoanso.util.UrlConst"%>
<!-- http:// xong crtl space -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<title>Game Đoán Số</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class="container h-100">
		<div class="row h-100 justify-content-center align-content-center">

			<form action="<%=request.getContextPath() + UrlConst.GAME_PLAY%>"
				method="post" class="text-center">
				<input type="text" hidden name="recordId" value="${record.id }">
				<div class="form-group">
					<label for="tryNumber" class="text text-success mt-4">${message}</label>
				</div>
				<div class="form-group">
					<p class="text-warning">Số lần đã đoán ${record.point}</p>
				</div>
				<c:if test="${ record.isFinished }">
					<div class="form-group">
						<p class="text-danger">Kết quả là: ${record.number}</p>
					</div>
				</c:if>

				<c:if test="${ !record.isFinished }">
					<div>
						<div class="form-group">
							<label for="tryNumber">Nhập số cần đoán</label> <input required
								type="text" class="form-control" name="tryNumber" id="tryNumber"
								placeholder="1-> 1000">
						</div>
						<button type="submit" class="btn btn-primary">Đoán số!</button>
					</div>
				</c:if>
			</form>
		</div>
		<c:if test="${ record.isFinished }">
			<div class="d-flex justify-content-center">
				<form method="get" action="<%=request.getContextPath() + UrlConst.ROOT%>">
					<button type="submit" class="btn btn-primary">Quay về trang chủ</button>
				</form>
			</div>
		</c:if>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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