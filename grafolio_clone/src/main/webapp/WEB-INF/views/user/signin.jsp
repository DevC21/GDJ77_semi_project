<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- include moment js -->
<script src="${contextPath}/resources/moment/moment-with-locales.min.js"></script>

<!-- include libraries(jquery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- include summernote css/js -->
<link rel="stylesheet" href="${contextPath}/resources/summernote-0.8.18-dist/summernote.min.css">
<script src="${contextPath}/resources/summernote-0.8.18-dist/summernote.min.js"></script>
<script src="${contextPath}/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.min.js"></script>

<!-- include custom css/js -->
<link rel="stylesheet" href="${contextPath}/resources/css/init.css?dt=${dt}">
<link rel="stylesheet" href="${contextPath}/resources/css/signin.css?dt=${dt}">

</head>
<body>


<div id="app">
  <div class="frame">
	<div class="layout">
	  <div class="layout-contents">
	    <div class="layout-logo">
	      <img alt="signup-logo" src="../resources/svg/logo-grapolio.svg">
	    </div>
	    <div class="layout-page">
		  <form method="POST"
		        action="${contextPath}/user/signin.do"
		        class="login-frm">
		    <div class="login-frm-email">
		      <label for="email" class="login-label">이메일</label>
		      <div class="login-input">
		        <input type="text" class="text-input" id="email" name="email" placeholder="이메일을 입력해주세요.">
		      </div>
		    </div>
		    <div class="login-frm-pw">
		      <label for="pw" class="login-label">비밀번호</label>
		      <div class="login-input">
		        <input type="password" class="text-input" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
		        <div class="eye-pw"><i class="fa-regular fa-eye-slash" style="color: #d8dfdf;" width="26px" height="16px"></i></div>
		      </div>
		      <div class="msg-login" id="msg-login"></div>
		    </div>
		    <div class="login-frm-btn">
		      <input type="hidden" name="url" value="${url}">
		      <div class="login-btn-wrap">
		        <button type="submit" class="login-btn" disabled>로그인</button>
		      </div>
		    </div>
		  </form>
		  <div class="signup-nav">
		  	<a href="${contextPath}/user/signup.page">회원가입</a>
		  </div>
	    </div>
	  </div>
	</div>
  </div>
</div>

<script>

// 로고 클릭 시 메인으로
const LogoMain = () => {
  $('.layout-logo').find('img').on('click', () => {
    location.href = "${contextPath}/main.page";
  })
}

// 패스워드 보기
const hidePw = () =>{
  $(document).on('click', '.eye-pw', function() {
    $(this).empty();
    $(this).append('<i class="fa-regular fa-eye" style="color: #000000;" width="26px" height="16px"></i>');
    $(this).removeClass('eye-pw').addClass('eye-pw-open');
    $('.login-frm-pw').find('input').attr('type', 'text');
  })

  $(document).on('click', '.eye-pw-open', function() {
    $(this).empty();
    $(this).append('<i class="fa-regular fa-eye-slash" style="color: #d8dfdf;" width="26px" height="16px"></i>');
    $(this).removeClass('eye-pw-open').addClass('eye-pw');
    $('.login-frm-pw').find('input').attr('type', 'password');
  })
}

// 이메일, 패스워드 입력란 밑줄 스타일 변경
const changeBorder = () => {
  var emailInput = $('.login-frm-email');  
  var pwInput = $('.login-frm-pw');
  
  emailInput.on('input', function() {
	  console.log('input 이벤트 - 이메일 실행');
    if($('input[type="text"]').val() === '') {
      $(this).css('border-bottom', '');
   	  $(this).css('border-bottom', '1px solid #d8dfdf;');
    } else {
 	  $(this).css('border-bottom', '1px solid black');
    }
  })
  
  pwInput.on('input', function() {
	  console.log('input 이벤트 - PW 실행');
	  if($('input[type="password"]').val() === '') {
		  $(this).css('border-bottom', '');
		  $(this).css('border-bottom', '1px solid #d8dfdf;');
	  } else {
	      $(this).css('border-bottom', '1px solid black');
	  }
  })
}

// 로그인 disabled 값 변경
const changeBtn = () => {
  
  $('input').on('keyup', () => {
    var email = $('.login-frm-email').find('input').val();
    var pw = $('.login-frm-pw').find('input').val();
    var btn = $('.login-btn');
	
    if(email !== '' && pw !== '') {
      btn.prop('disabled', false);
    } else {
   	  btn.prop('disabled', true);
    }
  })


}


hidePw();
LogoMain();
changeBorder();
changeBtn();

</script>
	
	
</body>
</html>

