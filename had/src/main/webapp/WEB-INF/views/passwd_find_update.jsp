<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>member_update</title>
    <link rel="stylesheet" href="/resources/css/passwd_update.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script>
    	$(function(){    		
    		const form = document.getElementById("passwd_update_form");
    		const regx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
    		const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
    		
    		$("#back").click(function(){
    			location.href="./login";
    		});
    		
    		$("#member_update").click(function(){
    			if(form.passwd.value == ""){
    				alert("비밀번호를 입력 해주세요");
    				form.passwd.focus();
    				return;
    			}
    			if(form.passwd_confirm.value == "") {
    				alert("비밀번호 확인을 입력 해주세요");
    				form.passwd_confirm.focus();
    				return;
    			}
    			if(form.passwd.value != form.passwd_confirm.value){
    				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
    				form.passwd.value = "";
    				form.passwd_confirm.value = "";
    				form.passwd.focus();
    				return;
    			}
    			if(!regx.test(form.passwd.value)){
    				alert("비밀번호 형식을 확인 해주세요");
    				form.passwd.focus();
    				return;
    			}
    			
    			form.submit();
    		});
    	});
    </script>
</head>
<body>
	<div id="wrap">
        <div id="logo">
            <a href=".."><p>Have a Drink!</p></a>
        </div>
        <div id="form_passwd">
            <form method="post" id="passwd_update_form">
				<div>
					<p>비밀번호 변경</p>
					<input type="password" name="passwd" placeholder="비밀번호(특수문자/문자/숫자 포함 8-15자리)">
				</div>
				<div>
					<input type="password" name="passwd_confirm" placeholder="비밀번호 확인">
				</div>
				 <div>
					<button type="button" id="member_update">비밀번호 변경</button>
		         </div>
		         <div>
					<button type="button" id="back">취소</button>
				</div>
			</form>
        </div>
    </div>
</body>
</html>