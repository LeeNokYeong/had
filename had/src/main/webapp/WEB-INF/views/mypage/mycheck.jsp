<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>check</title>
    <link rel="stylesheet" href="/resources/css/mycheck.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<title>Insert title here</title>
    <script>
    	$(function(){
    		const form = document.getElementById("login_form");
    		
    		if('${check}' != ""){
    			alert('${check}');
    		}
    		
			$("#check_btn").click(function(){
    			if(form.passwd.value == ""){
    				alert("비밀번호를 입력 해주세요");
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
		<div id="form_login">
            <form method="POST" id="login_form">
                <div>
                    <input type="password" placeholder="비밀번호" name="passwd">
                </div>
                <div id="finder">
                    <li><a href="#">아이디 찾기</a></li>
                    <span>/</span>
                    <li><a href="#">비밀번호 찾기</a></li>
                </div>
                <div>
                    <button type="button" id="check_btn">확인</button>
                </div>
            </form>
        </div>
	</div>
</body>
</html>