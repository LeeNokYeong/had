<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="/resources/css/id_find.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script>
    	$(function(){
    		const form = document.getElementById("find_form");
    		
    		if('${not_found}' != ""){
    			alert('${not_found}');
    		}
    		
			$("#find_btn").click(function(){
    			if(form.email.value == ""){
    				alert("이메일을 입력 해주세요");
    				form.email.focus();
    				return;
    			}
    			
    			form.submit();
    		});
			
			$("#back").click(function(){
				location.href="./login";
			});
    	});
    </script>
</head>
<body>
    <div id="wrap">
        <div id="logo">
            <a href=".."><p>Have a Drink!</p></a>
        </div>
        <div id="form_find">
            <form method="POST" id="find_form">
                <div>
                	<p>아이디 찾기</p>
                    <input type="text" placeholder="이메일" name="email">
                </div>
                <div>
                    <button type="button" id="find_btn">아이디 찾기</button>
                </div>
                <div>
                    <button type="button" id="back">취소</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>