<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
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

<title>Sponews</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand font-weight-bold" href="/">SPONEWS</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/match.spn">Match<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="/result.spn">Result</a></li>
				<li class="nav-item"><a class="nav-link" href="#">User</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Point</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Board</a></li>				
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
				<c:choose>
					<c:when test="${league == 'SPL' }">
						<img src="/images/le_spl.png" alt="..." class="img-thumbnail"> <a href="/result.spn?league=SPL" class="text-danger">라리가 경기 결과 (${month})</a>
					</c:when>
					<c:when test="${league == 'IPL' }">
						<img src="/images/le_ipl.png" alt="..." class="img-thumbnail"> <a href="/result.spn?league=IPL" class="text-danger">세리아A 경기 결과 (${month})</a>
					</c:when>
					<c:when test="${league == 'GPL' }">
						<img src="/images/le_gpl.png" alt="..." class="img-thumbnail"> <a href="/result.spn?league=GPL" class="text-danger">분데스리가 경기 결과 (${month})</a>
					</c:when>
					<c:when test="${league == 'FPL' }">
						<img src="/images/le_fpl.png" alt="..." class="img-thumbnail"> <a href="/result.spn?league=FPL" class="text-danger">리그1 경기 결과 (${month})</a>
					</c:when>
					<c:when test="${league == 'UCL' }">
						<img src="/images/le_ucl.png" alt="..." class="img-thumbnail"> <a href="/result.spn?league=UCL" class="text-danger">챔피언스리그 경기 결과 (${month})</a>
					</c:when>
					<c:otherwise>
						<img src="/images/le_epl.png" alt="..." class="img-thumbnail"> <a href="/result.spn?league=EPL" class="text-danger">프리미어리그 경기 결과 (${month})</a>
					</c:otherwise>
				</c:choose>
				<!-- Example single danger button -->
				<div class="btn-group">
				  <button type="button" class="btn btn-danger btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    League
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="/result.spn?league=EPL">프리미어리그</a>
				    <a class="dropdown-item" href="/result.spn?league=SPL">라리가</a>
				    <a class="dropdown-item" href="/result.spn?league=IPL">세리에A</a>
				    <a class="dropdown-item" href="/result.spn?league=GPL">분데스리가</a>
				    <a class="dropdown-item" href="/result.spn?league=FPL">리그1</a>
				    <a class="dropdown-item" href="/result.spn?league=UCL">챔피언스리그</a>
				  </div>
				</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="match" begin="0" end="10" items="${match_list}" varStatus="status">
				<tr>
					<td class="font-weight-bold" colspan="2" style="text-overflow: ellipsis; overflow: hidden;"><a href="#" >
					<c:choose>
					<c:when test="${match.result == 1}">
					${match.home_name} 
					VS 
					<span class="font-weight-light">${match.away_name} </span>
					</c:when>
					<c:when test="${match.result == 2}">
					<span class="font-weight-light">${match.home_name} </span> 
					VS ${match.away_name}
					</c:when>
					<c:otherwise>					
					<span class="font-weight-light">${match.home_name} VS ${match.away_name}</span>
					</c:otherwise>
					</c:choose>
					</a></td>
				</tr>
				<tr class="table table-borderless">
					<td class="font-weight-light text-dark" style="white-space: nowrap">${match.m_time}</td>
					
					<c:choose>
					<c:when test="${match.result == 1}">
					<td class="font-weight-bold font-italic text-primary" style="text-overflow: ellipsis; overflow: hidden;" align="right">WIN (${match.score})</td>
					</c:when>
					<c:when test="${match.result == 2}">
					<td class="font-weight-bold font-italic text-danger" style="text-overflow: ellipsis; overflow: hidden;" align="right">LOSE (${match.score})</td>
					</c:when>
					<c:otherwise>
					<td class="font-weight-bold font-italic text-success" style="text-overflow: ellipsis; overflow: hidden;" align="right">DRAW (${match.score})</td>
					</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
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