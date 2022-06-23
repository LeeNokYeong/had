<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script>
    	$(function(){
    		const form = document.getElementById("login_form");
    		
    		if('${msg}' != ""){
    			alert('${msg}');
    		}
    		
    		if('${login}' != ""){
    			alert('${login}');
    		}
    		
    		if('${id}' != ""){
    			alert("아이디는 ${id}입니다");
    		}
    		
    		if('${passwd_update}' != ""){
    			alert('${passwd_update}');
    		}
    		
    		$("#login_form").on("keypress", function(event){
    			if(event.keyCode == 13){
    				if(form.userId.value == ""){
        				alert("아이디를 입력 해주세요");
        				form.userId.focus();
        				return;
        			}
        			
        			if(form.passwd.value == ""){
        				alert("비밀번호를 입력 해주세요");
        				form.passwd.focus();
        				return;
        			}
        			
        			form.submit();
    			}
    		});
    		
			$("#login_btn").click(function(){
    			if(form.userId.value == ""){
    				alert("아이디를 입력 해주세요");
    				form.userId.focus();
    				return;
    			}
    			
    			if(form.passwd.value == ""){
    				alert("비밀번호를 입력 해주세요");
    				form.passwd.focus();
    				return;
    			}
    			
    			form.submit();
    		});
			
			$("#signup_btn").click(function(){
				location.href="./signup";
			});
    	});
    </script>
</head>
<body>
    <div id="wrap">
        <div id="logo">
            <a href=".."><p>Have a Drink!</p></a>
        </div>
        <div id="form_login">
            <form method="POST" id="login_form">
                <div>
                    <input type="text" placeholder="아이디" name="userId">
                </div>
                <div>
                    <input type="password" placeholder="비밀번호" name="passwd">
                </div>
                <div id="finder">
                    <li><a href="/id_find">아이디 찾기</a></li>
                    <span>/</span>
                    <li><a href="/passwd_find">비밀번호 찾기</a></li>
                </div>
                <div>
                    <button type="button" id="login_btn">로그인</button>
                </div>
                <hr>
                <div>
                    <button type="button" id="signup_btn">가입하기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>