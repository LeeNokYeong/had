<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/main.css" type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <title>Have a Drink!</title>
    <script>
    	$(function(){
    		form = document.getElementById("search_form");
    		
    		if('${delete}' != ""){
    			alert('${delete}');
    		}
    		
    		$("#search_btn").click(function(){
    			if(form.keyword.value == ""){
    				alert("검색할 단어를 입력 해주세요");
    				form.keyword.focus();
    				return;
    			}
    			
    			form.submit();
    		});
    	});
    </script>
</head>
<body>
    <div id="wrap">
        <div id="content">
            <div id="header">
                <div id="logo">
                    <p>Have a Drink!</p>
                </div>
                <div id="nav">
                    <ul>
                    	<c:if test="${sessionScope.member == null}">
	                        <li><a href="login">로그인</a></li>
	                        <li><a href="signup">회원가입</a></li>
                        </c:if>
                        <c:if test="${sessionScope.member != null}">
	                        <li><a href="logout">로그아웃</a></li>
	                        <li><a href="/mypage/mycheck">마이페이지</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div id="sub_logo">
                <p>다양한 레시피를 검색하고<br>나만의 레시피를 공유하세요!</p>
            </div>
            <div id="search">
                <form method="get" id="search_form" action="/recipe/search">
                	<input type="hidden" name="recipe" value="0">
                	<input type="hidden" name="flavor" value="0">
                    <input type="text" name="keyword" placeholder="검색할 단어를 입력 해주세요">
                    <div><button type="button" id="search_btn"><img src="/resources/img/search.png"></button></div>
                </form>
            </div>
        </div>
    </div>
            <div id="menu">
                <div>
                    <ul>
                        <li><a href="/recipe/list/1">ALCOHOL</a></li>
                        <li><a href="/recipe/list/2">BEVERAGE</a></li>
                        <li><a href="/recipe/list/3">COFFEE</a></li>
                    </ul>
                </div>
            </div>
        <div id="today">
        	<div id="random">
        		<div>
        			<p>이런건 어때요?</p><img src="/resources/img/imoji.png">
        		</div>
        	</div>
	      	<ul>
	      		<c:if test="${random.size() < 1}">
	      			<li>
	                   <a href="/recipe/add">
	                       <img src="/resources/img/no_img.png">
	                       <div>
	                           <p>레시피를 등록해 주세요</p>
	                       </div>
	                   </a>
	               </li>
	      		</c:if>
	           	<c:forEach var="item" items="${random}" varStatus="vs">
	               <li>
	                   <a href="/recipe/view/${item.recipeId}">
	                       <img src="/upload/${item.filecode}" onerror="this.src='/resources/img/no_img.png'">
	                       <div>
	                           <p id="name">${item.recipeName}</p>
	                       </div>
	                   </a>
	               </li>
	           	</c:forEach>
	    	</ul>
        </div>
</body>
</html>