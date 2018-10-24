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
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link font-weight-bold" href="/match.spn">경기 일정</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="/result.spn">경기 결과</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="#">리그 순위</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="#">팁스터</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="/news.spn">축구 뉴스</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="#">커뮤니티</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold" href="#">Spotech</a></li>
			</ul>			
		</div>
	</nav>
	
	<div class="text-center">
	<img src="/images/org_logo.png" class="img-fluid" alt="Responsive image">
	</div>
	
    <div class="my-3 p-3 bg-white rounded shadow-sm">
      <h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-primary">최신 경기 일정</h6>
      <c:forEach var="match" begin="0" end="10" items="${match_list}" varStatus="status">
        <div class="media text-muted pt-3">        
        <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
          <div class="d-flex justify-content-between mb-2 align-items-center w-100">
            <c:choose>
				<c:when test="${match.league == 'SPL' }">
					<a href="/match.spn?league=SPL"><img src="/images/le_spl.png" alt="..." class="img-thumbnail"> 라리가</a>
				</c:when>
				<c:when test="${match.league == 'IPL' }">
					<a href="/match.spn?league=IPL"><img src="/images/le_ipl.png" alt="..." class="img-thumbnail"> 세리에A</a>
				</c:when>
				<c:when test="${match.league == 'GPL' }">
					<a href="/match.spn?league=GPL"><img src="/images/le_gpl.png" alt="..." class="img-thumbnail"> 분데스리가</a>
				</c:when>
				<c:when test="${match.league == 'FPL' }">
					<a href="/match.spn?league=FPL"><img src="/images/le_fpl.png" alt="..." class="img-thumbnail"> 리그1</a>
				</c:when>
				<c:when test="${match.league == 'UCL' }">
					<a href="/match.spn?league=UCL"><img src="/images/le_ucl.png" alt="..." class="img-thumbnail"> 챔피언스리그</a>
				</c:when>
				<c:otherwise>
					<a href="/match.spn?league=EPL"><img src="/images/le_epl.png" alt="..." class="img-thumbnail"> 프리미어리그</a>
				</c:otherwise>
			</c:choose>
			<span class="text-success">${match.m_time}</span>            
          </div>
          <strong class="text-gray-dark"><a href="/matchDetail.spn?match_id=${match.match_id}" class="text-danger">${match.home_name} VS ${match.away_name}</a></strong>          
        </div>
      	</div>
      </c:forEach>      
      <small class="d-block text-right mt-3">
        <a href="/match.spn">리그별 경기 일정</a>
      </small>
    </div>

    <div class="my-3 p-3 bg-white rounded shadow-sm">
      <h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-danger">팁스터 순위 (Coming Soon!)</h6>
      <div class="media text-muted pt-3">
        <img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
        <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
          <div class="d-flex justify-content-between align-items-center w-100">
            <strong class="text-gray-dark">홍길동</strong>
            <a href="#">상세 정보</a>
          </div>
          <span class="d-block">@팁스터 정보</span>
        </div>
      </div>
      <div class="media text-muted pt-3">
        <img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
        <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
          <div class="d-flex justify-content-between align-items-center w-100">
            <strong class="text-gray-dark">대통령</strong>
            <a href="#">상세 정보</a>
          </div>
          <span class="d-block">@팁스터 정보</span>
        </div>
      </div>
      <div class="media text-muted pt-3">
        <img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
        <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
          <div class="d-flex justify-content-between align-items-center w-100">
            <strong class="text-gray-dark">잘하자</strong>
            <a href="#">상세 정보</a>
          </div>
          <span class="d-block">@팁스터 정보</span>
        </div>
      </div>
      <small class="d-block text-right mt-3">
        <a href="#">모든 팁스터 정보보기</a>
      </small>
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