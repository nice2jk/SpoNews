<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
			<a href="/login.spn"><img src="/images/login.png" alt="..." class="img-thumbnail mr-2"> 로그인</a>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link font-weight-bold"
					href="/match.spn">경기 일정</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold"
					href="/result.spn">경기 결과</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold"
					href="#">리그 순위</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold"
					href="#">팁스터</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold"
					href="/news.spn">축구 뉴스</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold"
					href="#">커뮤니티</a></li>
				<li class="nav-item"><a class="nav-link font-weight-bold"
					href="#">Spotech</a></li>
			</ul>
		</div>
	</nav>

	<div class="text-center">
		<img src="/images/org_logo.png" class="img-fluid"
			alt="Responsive image">
	</div>

	<div class="nav-scroller bg-warning shadow-sm">
		<nav class="nav nav-underline">
			<small><a class="nav-link" href="/result.spn?league=EPL">프리미어</a></small>
			<small><a class="nav-link" href="/result.spn?league=SPL">라리가</a></small>
			<small><a class="nav-link" href="/result.spn?league=GPL">분데스리가</a></small>
			<small><a class="nav-link" href="/result.spn?league=IPL">세리아A</a></small>
			<small><a class="nav-link" href="/result.spn?league=FPL">리그1</a></small>
			<small><a class="nav-link" href="/result.spn?league=UCL">챔피언스</a></small>
			<small><a class="nav-link" href="#">K리그</a></small>
		</nav>
	</div>

	<div class="my-3 p-3 bg-white rounded shadow-sm">
      <h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-primary">
            <c:choose>
				<c:when test="${league == 'SPL' }">
					<a href="/result.spn?league=SPL"><img src="/images/le_spl.png" alt="..." class="img-thumbnail"> 라리가 경기결과</a>
				</c:when>
				<c:when test="${league == 'IPL' }">
					<a href="/result.spn?league=IPL"><img src="/images/le_ipl.png" alt="..." class="img-thumbnail"> 세리에A 경기결과</a>
				</c:when>
				<c:when test="${league == 'GPL' }">
					<a href="/result.spn?league=GPL"><img src="/images/le_gpl.png" alt="..." class="img-thumbnail"> 분데스리가 경기결과</a>
				</c:when>
				<c:when test="${league == 'FPL' }">
					<a href="/result.spn?league=FPL"><img src="/images/le_fpl.png" alt="..." class="img-thumbnail"> 리그1 경기결과</a>
				</c:when>
				<c:when test="${league == 'UCL' }">
					<a href="/result.spn?league=UCL"><img src="/images/le_ucl.png" alt="..." class="img-thumbnail"> 챔피언스리그 경기결과</a>
				</c:when>
				<c:otherwise>
					<a href="/result.spn?league=EPL"><img src="/images/le_epl.png" alt="..." class="img-thumbnail"> 프리미어리그 경기결과</a>
				</c:otherwise>
			</c:choose>
      </h6>
      <c:forEach var="match" begin="0" end="${size}" items="${match_list}" varStatus="status">
        <div class="media text-muted pt-3">        
        <div class="media-body pb-2 mb-0 lh-125 border-bottom border-gray">
          <div class="d-flex justify-content-between mb-3 align-items-center w-100">
        	<c:choose>
        		<c:when test="${match.result == 1}">
	        	<a href="/matchDetail.spn?match_id=${match.match_id}" class="text-primary"><strong>${match.home_name}</strong> VS ${match.away_name}</a>
        		</c:when>
        		<c:when test="${match.result == 2}">
        		<a href="/matchDetail.spn?match_id=${match.match_id}" class="text-primary">${match.home_name} VS <span class="font-weight-bold">${match.away_name}</span></a>
        		</c:when>
        		<c:otherwise>
        		<a href="/matchDetail.spn?match_id=${match.match_id}" class="text-primary">${match.home_name} VS ${match.away_name}</a>
        		</c:otherwise>
        	</c:choose>
        	
        	<c:choose>
				<c:when test="${match.result == 1}">
					<span class="font-weight-bold font-italic text-primary"
						style="text-overflow: ellipsis; overflow: hidden;" align="right">WIN
						(${match.score})</span>
				</c:when>
				<c:when test="${match.result == 2}">
					<span class="font-weight-bold font-italic text-danger"
						style="text-overflow: ellipsis; overflow: hidden;" align="right">LOSE
						(${match.score})</span>
				</c:when>
				<c:otherwise>
					<span class="font-weight-bold font-italic text-success"
						style="text-overflow: ellipsis; overflow: hidden;" align="right">DRAW
						(${match.score})</span>
				</c:otherwise>
			</c:choose>			
          </div>          
          <span class="text-dark small">${match.m_time}</span>          
        </div>
      	</div>
      </c:forEach>      
      <small class="d-block text-right mt-3">
        <a href="/match.spn">리그별 경기 일정</a>
      </small>
    </div>
    
   	<nav aria-label="pagination">
	  <ul class="pagination justify-content-center">
	  	<c:choose>
	  		<c:when test="${(month-1)%100 == 0 }">
	  			<li class="page-item"><a class="page-link" href="/result.spn?league=${league}&month=${month-100+11}" tabindex="-1">< ${month-100+11}</a></li>
	  		</c:when>
	  		<c:otherwise>
				<li class="page-item"><a class="page-link" href="/result.spn?league=${league}&month=${month-1}">< ${month-1}</a></li>
	  		</c:otherwise>
	  	</c:choose>
	    <li class="page-item disabled mr-2 ml-2"><a class="page-link" href="#">${month}</a></li>
	    <c:choose>
	    	<c:when test="${(month+1)%100 > 12 }">
	    		<li class="page-item"><a class="page-link" href="/result.spn?league=${league}&month=${month+100-11}">${month+100-11} ></a></li>
	    	</c:when>
	    	<c:otherwise>
	    		<li class="page-item"><a class="page-link" href="/result.spn?league=${league}&month=${month+1}">${month+1} ></a></li>
	    	</c:otherwise>
	    </c:choose>	    
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