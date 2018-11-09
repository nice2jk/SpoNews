<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<title>Spotech</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand font-weight-bold" href="/">SPOTECH</a>
    		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<c:choose>
				<c:when test="${sessionScope.login_user != null}">
					<a href="#" class="font-weight-bold text-info">${sessionScope.login_user.user_id}</a><a href="/logout.spn"><img src="/images/logout.png" alt="..." class="img-thumbnail ml-3"></a>
				</c:when>
				<c:otherwise>
					<a href="/login.spn" class="font-weight-bold text-warning"><img src="/images/login.png" alt="..." class="img-thumbnail mr-2"> 로그인</a>
				</c:otherwise>			
			</c:choose>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link font-weight-bold" href="/match.spn">경기 일정</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="/result.spn">경기 결과</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="#">리그 순위</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="#">팁스터</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="/news.spn">축구 뉴스</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="/board.spn">커뮤니티</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="#">Spotech</a></li>
			</ul>			
		</div>
	</nav>
	
	<div class="text-center">
	<img src="/images/org_logo.png" class="img-fluid" alt="Responsive image">
	</div>
	
	<table style="table-layout: fixed" class="table">
		<thead class="thead-light">
			<tr class="table-info">
				<th colspan="2" scope="col">
				<a href="http://secret4news.tk/main?category=socc" class="text-info" target="_blank">축구 뉴스 (쓰잘데기)</a>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="news" begin="0" end="20" items="${news_list}" varStatus="status">
				<tr>					
					<td colspan="2" style="text-overflow: ellipsis; overflow: hidden;"><a href="${news.link}" target="_blank" class="font-weight-bold">${news.title}</a></td>										
				</tr>
				<tr class="table table-borderless">
					<td class="font-weight-light font-italic text-dark" style="white-space: nowrap">${news.cpname}</td>
					<td class="font-weight-light text-dark" style="text-overflow: ellipsis; overflow: hidden;" align="right">
					<jsp:useBean id="dateValue" class="java.util.Date"/>
					<jsp:setProperty name="dateValue" property="time" value="${news.ctime}"/>
					<fmt:formatDate value="${dateValue}" pattern="MM/dd/yyyy HH:mm"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<nav aria-label="pagination">
	  <ul class="pagination justify-content-center">
	  	<c:choose>
	  		<c:when test="${offset == 0 }">
	  			<li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1">최신</a>
			    </li>
	  		</c:when>
	  		<c:otherwise>
	  			<li class="page-item">
			      <a class="page-link" href="/news.spn?offset=${offset-20 }">이전</a>
			    </li>
	  		</c:otherwise>
	  	</c:choose>
	    <li class="page-item"><a class="page-link" href="#">현재 페이지</a></li>
	    <li class="page-item"><a class="page-link" href="/news.spn?offset=${offset+20 }">다음</a></li>
	  </ul>
	</nav>
	
	<hr>
	<p>
	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
	          <a href="#">Back to top</a>
	        </p>
			<p>Copyrightⓒ Sponews</p>
			<p>All Rights Reserved.</p>
		</div>
	</footer>
	
		
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
	
</body>
</html>