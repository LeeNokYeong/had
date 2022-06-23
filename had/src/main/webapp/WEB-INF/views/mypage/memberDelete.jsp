<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>member_delete</title>
    <link rel="stylesheet" href="/resources/css/member_delete.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script>
    	$(function(){
    		const form = document.getElementById("member_delete_form");
    		
    		
    		$("#back").click(function(){
    			window.history.back();
    		});
    		
    		$("#member_delete").click(function(){
    			const passwd = form.passwd.value;
    			
    			if(passwd == ""){
    				alert("비밀번호를 입력해 주세요");
    			} else {
    				$.ajax("/mypage/passwdCheck/" + passwd, {
    					method: "GET",
    					success: function(result) {
    						if(result == "OK"){
    							form.submit();
    						} else {
    							alert("비밀번호가 틀렸습니다");
    						}
    					},
    					error: function(jqXhr, status){
	    					alert(status);
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
            <a href=".."><p>Have a Drink!</p></a>
        </div>
        <div id="form_delete">
            <form method="post" id="member_delete_form">
				<div>
					<input type="password" name="passwd" placeholder="비밀번호">
				</div>
				 <div>
					<button type="button" id="member_delete">회원탈퇴</button>
		         </div>
		         <div>
					<button type="button" id="back">취소</button>
				</div>
			</form>
        </div>
    </div>
</body>
</html>