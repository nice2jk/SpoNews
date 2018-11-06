<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Spotech Join</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

  </head>

  <body>
  
  	<h4 class="border-bottom border-gray pb-2 my-2 font-weight-bold text-info text-center">회원가입</h4>
	<form class="my-2 mx-5 justify-content-center" action="/join.done">
	  <div class="form-group">
	    <label for="id1">Login Id</label>
	    <c:choose>
	    	<c:when test="${result != null }">
		    	<input type="text" minlength="5" maxlength="12" class="form-control" name="id" id="id1" aria-describedby="idHelp" placeholder="Enter Id"  value="${user_id}" required>
	    		<small id="idHelp" class="form-text text-danger">${result}</small>
	    	</c:when>
	    	<c:otherwise>
	    		<input type="text" minlength="5" maxlength="12" class="form-control" name="id" id="id1" aria-describedby="idHelp" placeholder="Enter Id" required>
	    		<small id="idHelp" class="form-text text-muted">항목 모두 입력해 주세요.</small>
	    	</c:otherwise>
	    </c:choose>	    
	  </div>
	  <div class="form-group">
	    <label for="pw1">Password</label>
	    <input type="password" minlength="5" maxlength="12" class="form-control" name="pw" id="pw1" placeholder="Password" required>
	  </div>
	  <div class="form-group">
	    <label for="nm1">Name</label>
	    <input type="text" minlength="5" maxlength="12" class="form-control" name="nm" id="nm1" placeholder="User Name" required>
	  </div>
	  <button type="submit" class="btn btn-outline-info mt-3">회원가입</button>	  
	</form>
	
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
