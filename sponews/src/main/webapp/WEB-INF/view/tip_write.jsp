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
<script type="text/javascript" src="/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

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

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
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
	

	<div class="my-3 p-3 bg-white rounded shadow-sm">
		  <h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-primary">
			<c:choose>
				<c:when test="${match.league == 'SPL' }">
					<img src="/images/le_spl.png" alt="..." class="img-thumbnail mx-2">${match.home_name} VS ${match.away_name}
				</c:when>
				<c:when test="${match.league == 'IPL' }">
					<img src="/images/le_ipl.png" alt="..." class="img-thumbnail mx-2">${match.home_name} VS ${match.away_name}
				</c:when>
				<c:when test="${match.league == 'GPL' }">
					<img src="/images/le_gpl.png" alt="..." class="img-thumbnail mx-2">${match.home_name} VS ${match.away_name} 
				</c:when>
				<c:when test="${match.league == 'FPL' }">
					<img src="/images/le_fpl.png" alt="..." class="img-thumbnail mx-2">${match.home_name} VS ${match.away_name} 
				</c:when>
				<c:when test="${match.league == 'UCL' }">
					<img src="/images/le_ucl.png" alt="..." class="img-thumbnail mx-2">${match.home_name} VS ${match.away_name} 
				</c:when>
				<c:otherwise>
					<img src="/images/le_epl.png" alt="..." class="img-thumbnail mx-2">${match.home_name} VS ${match.away_name} 
				</c:otherwise>
			</c:choose>
		  </h6>
		<label for="basic-label" class="font-weight-bold my-3">팁 등록하기</label>
		<form id="writeForm" action="/tip_write.done" method="post">
			<input type="hidden" name="matchId" value="${match.match_id}"/>
			<div class="input-group mb-1">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">팁 제목</span>
				</div>
				<input type="text" class="form-control" name="ttitle" id="basic-label" placeholder="팁 제목 입력" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			  <div class="form-group mt-3 small">
			    <label for="formControlRange" class="font-weight-bold text-primary">신뢰도를 정해주세요. (약 1 ~ 강 10 : 기본 4)</label>
			    <input type="range" class="form-control-range" id="trange" name="trange" min="1" max="10" value="3" step="1">
			  </div>
	    	<section class="border-bottom border-gray my-2 pb-2 small">
	    		<p class="font-weight-bold text-primary">승무패를 골라주세요.</p>	        	
		        <div class="form-check form-check-inline text-center">
				  <input class="form-check-input" type="radio" name="toptions" id="toptions1" value="1">
				  <label class="form-check-label" for="inlineRadio1">승</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="toptions" id="toptions2" value="0">
				  <label class="form-check-label" for="inlineRadio2">무</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="toptions" id="toptions3" value="2">
				  <label class="form-check-label" for="inlineRadio3">패</label>
				</div>	      
	    	</section>
			<label for="basic-body" class="font-weight-bold my-2">팁 내용 :</label>
			<input type="hidden" id="tbody" name="tbody" value=""/>
			<textarea name="abody" id="summernote" required></textarea>		
		  	<button type="button" class="btn btn-primary my-3" onclick="goSubmit()">팁 등록</button>
	  	</form>
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
	
    <script>
      $('#summernote').summernote({
        placeholder: '팁을 입력하세요.',
        tabsize: 1,
        height: 500,
        toolbar: [
            // [groupName, [list of button]]
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['link', ['link']]
          ]
      });
      
      function goSubmit() {
    	  var form = document.getElementById("writeForm");
    	  
    	  var markupStr = $('#summernote').summernote('code');
    	  var radioVal = $('input[name="toptions"]:checked').val();
    	  
    	  if(form.ttitle.value == "") {
    		  alert("제목을 입력해주세요.");
    		  return;
    	  }
    	  
    	  if(form.toptions.value == "") {
    		  alert("승무패를 입력해주세요.");
    		  return;
    	  }
    	  
    	  if($('#summernote').summernote('isEmpty')) {
    		  alert("내용을 입력해주세요.");
    		  return;
    	  }
    	  
    	  document.getElementById("tbody").setAttribute('value', markupStr);
    	  form.submit();
    	  
  	  }
    </script>
	
</body>
</html>