<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cybersoft.javabackend.gamedoanso.util.UrlConst"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	 <link rel="stylesheet" href='<c:url value ="/assets/css/app.css"/>'>
	
</head>
<body>
	<div class="main">
		<h1 class="text-primary text-center">Game Đoán Số</h1>
		<form
			action="<%=request.getContextPath() + UrlConst.PLAYER_LOGIN%>"
			method="post" class="form-group">
			<label for="username">Username</label>
			 <input type="text" required
				class="form-control" name="username" id="username"
				placeholder="Enter username" value='${lastUsername == null ? "" : lastUsername }'> 
			<label for="password">Password</label>
			<input required type="password" class="form-control" name="password"
				id="password" placeholder="Your password">
			<c:if test="${ isLoginFailed != null &&  isLoginFailed == true }">
				<small class="form-text text-danger">The username was
					already in use, or the password was incorrect.</small>
			</c:if>
			<p>Do you not have an account <a href = "<%= request.getContextPath() + UrlConst.PLAYER_REGISTER%>">Register</a> </p>

			<input class="btn btn-primary mt-3" type="submit" value="Vào chơi" />
		</form>
	</div>
</body>
</html>