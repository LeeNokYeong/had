<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/mypage.css">
    <script src="../js/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
</head>
<body>
    <div id="wrap">
        <div id="header">
            <div id="logo">
                <a href="../"><p>Have a Drink!</p></a>
            </div>
            <div id="nav">
                    <a href="/logout">로그아웃</a>
            </div>
        </div>
        <div id="menu_nav">
            <ul>
                <li><a href="./mypage">레시피 관리</a></li>
                <li><a href="./memberUpdate">회원정보 관리</a></li>
            </ul>
        </div>
        <div id="contents">
              <div class="name"><p id="myrecipe">내가 쓴 레시피</p></div>
              <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                	<c:if test="${list.size() < 1}">
                		<div class="swiper-slide">
	                        <div>
	                            <a href="/recipe/add">
	                                <img src="/resources/img/no_img.png">
	                                <p>레시피를 등록해 주세요</p>
	                            </a>
	                        </div>
                    	</div>
                	</c:if>
                	<c:forEach var="item" items="${list}">
                    <div class="swiper-slide">
                        <div>
                            <a href="/recipe/view/${item.recipeId}">
                                <img src="/upload/${item.filecode}" onerror="this.src='/resources/img/no_img.png'">
                                <p>${item.recipeName}</p>
                            </a>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
              </div>
        </div>
        <div id="back"><a href="../">이전</a></div>
	</div>
</body>
<script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 4,
      spaceBetween: -70,
      slidesPerGroup: 4,
      loop: true,
      loopFillGroupWithBlank: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  </script>
</html>