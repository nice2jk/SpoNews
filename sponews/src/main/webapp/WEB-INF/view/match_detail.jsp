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
			<a href="/login.spn"><img src="/images/login.png" alt="..." class="img-thumbnail mr-2"> 로그인</a>
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
	
	<form action="matchComment.spn" method="post">
	    <section class="text-center bg-white">
	      <div class="container">
	      <br>
	      	<p>
	      	<c:choose>
			<c:when test="${match.league == 'SPL' }">
				<img src="/images/le_spl.png" alt="..." class="img-thumbnail"><strong class="text-dark">라리가</strong>
			</c:when>
			<c:when test="${match.league == 'IPL' }">
				<img src="/images/le_ipl.png" alt="..." class="img-thumbnail"><strong class="text-dark">세리아A</strong>
			</c:when>
			<c:when test="${match.league == 'GPL' }">
				<img src="/images/le_gpl.png" alt="..." class="img-thumbnail"><strong class="text-dark">분데스리가</strong> 
			</c:when>
			<c:when test="${match.league == 'FPL' }">
				<img src="/images/le_fpl.png" alt="..." class="img-thumbnail"><strong class="text-dark">리그1</strong> 
			</c:when>
			<c:when test="${match.league == 'UCL' }">
				<img src="/images/le_ucl.png" alt="..." class="img-thumbnail"><strong class="text-dark">챔피언스리그</strong> 
			</c:when>
			<c:otherwise>
				<img src="/images/le_epl.png" alt="..." class="img-thumbnail"><strong class="text-dark">프리미어리그</strong> 
			</c:otherwise>
			</c:choose>
			</p>
	        <h4 class="jumbotron-heading font-weight-bold text-danger">${match.home_name}</h4>
	        <p class="font-weight-bold text-danger">VS</p>
	        <h4 class="jumbotron-heading font-weight-bold text-danger">${match.away_name}</h4>
	        <c:choose>
	        <c:when test="${match.total == 0}">
	        	<p class="lead font-weight-bold text-primary">응원 현황 (승: 0% 무: 0% 패: 0%)</p>	        	
	        </c:when>
	        <c:otherwise>
	        	<p class="lead font-weight-bold text-primary">응원 현황 (승:<fmt:formatNumber value="${match.win / match.total * 100}" pattern="00"/>% 무:<fmt:formatNumber value="${match.draw / match.total * 100}" pattern="00"/>% 패:<fmt:formatNumber value="${match.lose / match.total * 100}" pattern="00"/>%)</p>
	        </c:otherwise>
	        </c:choose>
	        <div class="form-check form-check-inline text-center">
			  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1" required>
			  <label class="form-check-label" for="inlineRadio1">승</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="0">
			  <label class="form-check-label" for="inlineRadio2">무</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="2">
			  <label class="form-check-label" for="inlineRadio3">패</label>
			</div>
	      </div>
	    </section>
	
		<div class="form-group m-3">
		    <label for="exampleFormControlTextarea1">당신의 팀을 응원해 주세요.</label>
		    <textarea class="form-control" name="comment" rows="3" required="required"></textarea>
		    <input type="hidden" name="matchId" value="${match.match_id}"/>
		    <input type="hidden" name="league" value="${match.league}"/>
		    <button type="submit" class="btn btn-primary mt-2">응원하기</button>
	 	</div>
	</form>
	
	<div class="my-3 p-3 bg-white rounded shadow-sm">
      <h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-danger">응원하기!</h6>
      <c:forEach var="comment" begin="0" end="10" items="${match.comment_list}" varStatus="status">
        <div class="media text-muted pt-3">        
        <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
          <div class="d-flex justify-content-between mb-2 align-items-center w-100">
            <c:choose>
            <c:when test="${comment.result == 1}">
            	@username (승)
            </c:when>
            <c:when test="${comment.result == 2}">
            	@username (패)
            </c:when>
            <c:otherwise>
            	@username (무)
            </c:otherwise>
            </c:choose>            
			<span class="text-success">${comment.c_time}</span>            
          </div>
          <strong class="text-gray-dark"><a href="#" class="text-danger">${comment.story}</a></strong>          
        </div>
      	</div>
      </c:forEach>      
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