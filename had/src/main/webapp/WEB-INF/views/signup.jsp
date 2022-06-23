<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signup</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script>
    		
    		
    	$(function(){
    		const form = document.getElementById("signup_form");
    		const regx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
    		const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
    		
    		$("#check_id").click(function(){ 
    			const form = document.getElementById("signup_form");
    			const id = form.userId.value;
    			
    			if(id != ""){
	    			$.ajax({
	    				method: "GET",
	    				url: "checkId?userId=" + id,
	    				success: function(result){
	    					if(result == "OK"){
	    						alert("사용가능한 아이디입니다");
	    						form.ck_id.value = form.userId.value;
	    					}
	    					else alert("이미 사용중인 아이디입니다");
	    				},
	    				error: function(jqXhr, status){
	    					console.log(status);
	    					alert("중복검사를 다시 시도 해주세요");
	    				}
	    			});
    			} else {
    				alert("아이디를 입력해 주세요");
    				form.userId.focus();
    				return;
    			}
    		});
    		
    		$("#check_alias").click(function(){ 
    			const form = document.getElementById("signup_form");
    			const alias = form.alias.value;
    			
    			if(alias != ""){
	    			$.ajax({
	    				type: "GET",
	    				url: "checkAlias?alias=" + alias,
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
    		
    		$(".submit").click(function(){
    			const form = document.getElementById("signup_form");
    			
    			if(form.userId.value == ""){
    				alert("아이디를 입력 해주세요");
    				form.userId.focus();
    				return;
    			}
    			
    			if(form.userId.value != form.ck_id.value){
    				alert("아이디 중복검사를 해주세요");
    				return;
    			}
    			
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
    			if(!regx.test(form.passwd.value)){
    				alert("비밀번호 형식을 확인 해주세요");
    				form.passwd.focus();
    				return;
    			}
    			
    			if(!regExp.test(form.email.value)){
    				alert("이메일 형식을 확인 해주세요");
    				form.email.focus();
    				return;
    			}
    			
    			if(form.email.value != ""){
    				$.ajax({
    					method: "GET",
    					url: "checkEmail?email=" + form.email.value,
						success: result => {
							if(result == "OK"){
								form.submit();
							} else {
								alert("이미 사용중인 이메일입니다");
								form.email.value = "";
								form.email.focus();
								return;
							}
						}, error: function(jqXhr, status) {
							console.log(status);
						}
    				});
    			}
    			
    		});
    	});
    </script>
</head>
<body>
    <div id="wrap">
        <div id="logo">
            <a href="."><p>Have a Drink!</p></a>
        </div>
        <div id="form_signup">
            <p>회원정보를 입력해주세요</p>
            <form method="POST" id="signup_form">
            	<input type="hidden" name="ck_id">
            	<input type="hidden" name="ck_alias">
                <div>
                    <input type="text" name="userId" placeholder="아이디" class="check"><button type="button" id="check_id">중복<br>검사</button> 
                </div>
                <div>
                    <input type="password" name="passwd" placeholder="비밀번호(특수문자/문자/숫자 포함 8-15자리)">
                </div>
                <div>
                    <input type="password" name="passwd_confirm" placeholder="비밀번호 확인">
                </div>
                <div>
                    <input type="text" name="alias" placeholder="닉네임" class="check"><button type="button" id="check_alias">중복<br>검사</button>
                </div>
                <div>
                    <input type="text" name="email" placeholder="이메일">
                </div>
                <div>
                    <button type="button" class="submit">가입하기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>