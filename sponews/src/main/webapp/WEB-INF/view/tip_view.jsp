<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<head>

<!-- Required meta tags -->
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
					<a href="#" class="font-weight-bold text-info">${sessionScope.login_user.user_nm}</a><a href="/logout.spn"><img src="/images/logout.png" alt="..." class="img-thumbnail ml-3"></a>
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

	<div class="my-3 p-3 bg-white">
		<h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-primary"><span class="pb-2 mr-2 text-danger">[${tip.league}]</span>${tip.home_name} VS ${tip.away_name}</h6>		
		<h5 class="border-bottom border-gray py-2 my-3 font-weight-bold">${tip.t_title}</h5>
		<div class="d-flex justify-content-between py-2 mb-2 small align-items-center w-100 border-bottom border-gray">
            <span class="font-weight-bold"> Tip : 
            <c:choose>
            	<c:when test="${tip.result == 1}"><span class="text-primary">홈팀 승리</span></c:when>
            	<c:when test="${tip.result == 2}"><span class="text-danger">원정 승리</span></c:when>
            	<c:when test="${tip.result == 0}"><span class="text-mute">무승부</span></c:when>
            </c:choose>
            <img src="/images/trust.png" alt="..." class="img-thumbnail mx-2"><span class="text-danger">(${tip.bet})</span></span>
			<span class="text-primary">${tip.user_nm}</span>
	    </div>
	    <div class="d-flex justify-content-between py-2 mb-2 small align-items-center w-100 border-bottom border-gray">
            <span class="font-weight-bold">${tip.tid}<img src="/images/view.png" alt="..." class="img-thumbnail mx-2">[${tip.v_count}]<img src="/images/reply.png" alt="..." class="img-thumbnail mx-2">[${tip.count}]</span>
			<span class="text-success">${tip.ctime}</span>
	    </div>
		<p class="lead rounded shadow-sm small ">${tip.t_body}</p>
		<button onclick="location.href='matchDetail.spn?match_id=${tip.match_id}'" class="btn btn-primary my-2">목록</button>		
	</div>
		
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