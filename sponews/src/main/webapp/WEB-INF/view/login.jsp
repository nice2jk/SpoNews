<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Spotech Login</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

  </head>

  <body>  
  	<h4 class="border-bottom border-gray pb-2 my-2 font-weight-bold text-danger text-center">로그인</h4>
	<form class="border-bottom border-gray py-3 my-2 mx-5 justify-content-center" action="/login.spn" method="get">
	  <div class="form-group">
	    <label for="id1">Login Id</label>
	    <input type="text" minlength="5" maxlength="12" class="form-control" name="id" id="id1" aria-describedby="idHelp" placeholder="Enter Id">
	    <small id="idHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
	  </div>
	  <div class="form-group">
	    <label for="pw1">Password</label>
	    <input type="password" minlength="5" maxlength="12" class="form-control" name="pw" id="pw1" placeholder="Password">
	  </div>
	  <div class="form-group form-check">
	    <input type="checkbox" class="form-check-input" id="exampleCheck1">
	    <label class="form-check-label" for="exampleCheck1">로그인 유지</label>
	  </div>
	  <div class="form-inline justify-content-between">
		  <button type="submit" class="btn btn-primary">로그인</button>
		  <button type="submit" class="btn btn-info">회원가입</button>
	  </div>
	</form>
	
	<div class="container p-5">
      <h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-primary text-center"><a href="#" class="text-dark">비밀번호 찾기</a></h6>      
    </div>
	
	<hr>
	<p>
	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
	          <a href="/">Back to main</a>
	        </p>
			<p>Copyrightⓒ Sponews</p>
			<p>All Rights Reserved.</p>
		</div>
	</footer>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>
