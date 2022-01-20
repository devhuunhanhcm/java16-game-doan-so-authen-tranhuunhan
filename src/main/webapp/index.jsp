<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="cybersoft.javabackend.gamedoanso.util.JspConst"%>
<%@ page import="cybersoft.javabackend.gamedoanso.util.UrlConst"%>

    
    <!doctype html>
<html lang="en">
  <head>
    <title>Home Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
  	
    <section class="container">
    	<h1 class="mt-4 text-success text-center">GAME ĐOÁN SỐ SIÊU VŨ TRỤ</h1>
      <section style="gap:20px;" class="mt-5 d-flex row h-100 justify-content-center align-content-center">
        <a class="h5" href="#!">HOME</a>
        <a class="h5" href="<%= request.getContextPath() + UrlConst.PLAYER_LOGIN %>"> Đăng nhập</a>
        <a class="h5" href=""> Đăng kí</a>
       	<a class="h5" href="<%= request.getContextPath() + UrlConst.GAME_RANKING %>">Bảng xếp hạng</a>
      </section>
    </section>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>