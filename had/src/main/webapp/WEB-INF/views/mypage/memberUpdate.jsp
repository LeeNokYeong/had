<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>member_update</title>
    <link rel="stylesheet" href="/resources/css/memeber_update.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script>
    	$(function(){
    		$("#member_delete").click(function(){
    			const result = confirm("회원 탈퇴를 하시겠습니까?");
    			
    			if(result){
    				location.href = "delete";	
    			}
    		});
    		
    		const form = document.getElementById("member_update_form");
    		const regx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
    		const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
    		
    		$("#back").click(function(){
    			window.history.back();
    		});
    		
    		$(".chk_btn").click(function(){
    			const alias = form.alias.value;
    			if(alias != ""){
	    			$.ajax({
	    				type: "GET",
	    				url: "../checkAlias?alias=" + alias,
	    				success: function(result){
	    					if(result == "OK"){
	    						alert("사용가능한 닉네임입니다");
	    						form.ck_alias.value = form.alias.value;
	    					}
	    					else alert("이미 사용중인 닉네임입니다")
	    				},
	    				error: function(jqXhr, status){
	    					console.log(status);
	    					alert("중복검사를 다시 시도 해주세요");
	    				}
	    			});
    			} else {
    				alert("닉네임을 입력해 주세요");
    				form.alias.focus();
    				return;
    			}
    		});
    		
    		$("#member_update").click(function(){
    			if(form.alias.value == ""){
    				alert("닉네임을 입력 해주세요");
    				form.alias.focus();
    				return;
    			}
    			if(form.alias.value != form.ck_alias.value){
    				alert("닉네임 중복검사를 해주세요");
    				return;
    			}
    			
    			if(form.email.value == ""){
    				alert("이메일을 입력 해주세요");
    				form.email.focus();
    				return;
    			}
    			
    			if(!regExp.test(form.email.value)){
    				alert("이메일 형식을 확인 해주세요");
    				form.email.focus();
    				return;
    			}
    			
    			form.submit();
    		});
    	});
    </script>
</head>
<body>
    <div id="wrap">
        <div id="header">
            <div id="logo">
                <a href="../.."><p>Have a Drink!</p></a>
            </div>
            <div id="nav">
                    <a href="../logout">로그아웃</a>
            </div>
        </div>
        <div id="menu_nav">
            <ul>
                <li><a href="./mypage">레시피 관리</a></li>
                <li><a href="./memberUpdate">회원정보 관리</a></li>
            </ul>
        </div>
        <div id="form_member_update">
            <p>회원정보 수정</p>
            <form method="post" id="member_update_form">
                <div>
                    <input type="text" name="alias" placeholder="닉네임" class="check" value="${sessionScope.member.alias}"><button type="button" class="chk_btn">중복<br>검사</button>
                    <input type="text" name="ck_alias" hidden>
                </div>
                <div>
                    <input type="text" name="email" placeholder="이메일" value="${sessionScope.member.email}">
                </div>
                <div>
                    <button type="button" id="member_update">회원정보 변경</button>
                </div>
                <a href="./passwdUpdate" id="passwd_update">
	                <div>
	                    비밀번호 변경
	                </div>
                </a>
                <div>
                    <button type="button" id="back">취소</button>
                </div>
            </form>
            <div id="member_delete"><button type="button">회원 탈퇴 <span><img src="/resources/img/arrow.png"></span></button></div>
        </div>
    </div>
</body>
</html>