<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>menu_list</title>
    <link rel="stylesheet" href="/resources/css/menu_list.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	$(function(){
    		if(`${pager.recipe}` == 1){
    			$("#alcohol").css('background-color','#ffdce0');
    		}
    		if(`${pager.recipe}` == 2){
    			$("#beverage").css('background-color','#ffdce0');
    		}
    		if(`${pager.recipe}` == 3){
    			$("#coffee").css('background-color','#ffdce0');
    		}
    		
    		$("#search form div select[name='recipe']").on("change", function(){
    			$("#search form div input[name='keyword']").val("");
    		});
    		
    		$("#search form div select[name='flavor']").on("change", function(){
    			$("#search form div input[name='keyword']").val("");
    		});
    	});
    </script>
</head>
<body>
    <div id="wrap">
        <div id="content">
            <div id="header">
                <div id="logo">
                    <a href="../..">Have a Drink!</a>
                </div>
                <div id="nav">
                    <ul>
                    	<c:if test="${sessionScope.member == null}">
	                        <li><a href="../login">로그인</a></li>
	                        <li><a href="../signup">회원가입</a></li>
                        </c:if>
                        <c:if test="${sessionScope.member != null}">
	                        <li><a href="../logout">로그아웃</a></li>
	                        <li><a href="../mypage">마이페이지</a></li>
                        </c:if>
                    </ul>
                </div>
        </div>
        <div id="sub_logo">
            <p>레시피</p>
        </div>
        <div id="search">
            <form method="GET" action="/recipe/search">
                <div>
                    <p>종류</p>
                    <select name="recipe">
                        <option value="0">ALL</option>
                        <option value="1" ${pager.recipe == 1 ? 'selected' : ''}>ALCOHOL</option>
                        <option value="2" ${pager.recipe == 2 ? 'selected' : ''}>BEVERAGE</option>
                        <option value="3" ${pager.recipe == 3 ? 'selected' : ''}>COFFEE</option>
                    </select>
                </div>
                <div>
                    <p>맛</p>
                    <select name="flavor">
                        <option value="0">ALL</option>
                        <option value="1" ${pager.flavor == 1 ? 'selected' : ''}>단맛</option>
                        <option value="2" ${pager.flavor == 2 ? 'selected' : ''}>신맛</option>
                        <option value="3" ${pager.flavor == 3 ? 'selected' : ''}>쓴맛</option>
                    </select>
                </div>
                <div>
                    <input type="text" name="keyword" value="${pager.keyword}" placeholder="검색어를 입력해주세요">
                    <button id="search_btn"><img src="/resources/img/search.png"></button>
                </div>
            </form>
        </div>
        <div id="menu_nav">
            <div>
                <ul>
                    <li value="1"><a href="/recipe/list/1" class="button" id="alcohol">ALCOHOL</a></li>
                    <li value="2"><a href="/recipe/list/2" class="button" id="beverage">BEVERAGE</a></li>
                    <li value="3"><a href="/recipe/list/3" class="button" id="coffee">COFFEE</a></li>
                </ul>
            </div>
        </div>
        </div>
        <div id="list">
            <div class="container">
                <ul>
                	<c:if test="${list.size() < 1}">
                		<div style="height: 337px;">
	                		<li class="item">
	                        	<a href="/recipe/add">
	                            	<img src="/resources/img/no_img.png">
	                            	<div>
	                                	<p>레시피를 등록해 주세요</p>
	                            	</div>
	                        	</a>
	                    	</li>
                		</div>
                	</c:if>
                	<c:forEach var="recipe" items="${list}">		
	                    <li class="item">
	                        <a href="/recipe/view/${recipe.recipeId}">
	                        <c:if test="${recipe.filecode == null}">
	                            <img src="${pageContext.request.contextPath}/resources/img/no_img.png">
	                        </c:if>
	                        <c:if test="${recipe.filecode != null}" >
	                        	<img src="/upload/${recipe.filecode}" onerror="this.src='/resources/img/no_img.png'">
	                        </c:if>
	                            <div>
	                                <p>${recipe.recipeName}</p>
	                            </div>
	                        </a>
	                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div id="crud">
                    <div id="add">
                        <a href="/recipe/add">등록</a>
                    </div>
            </div>
            <div id="page">
                <div>
                    <a href="?page=1">처음</a>
                </div>
                <div>
                    <a href="?page=${pager.prev}&recipe=${pager.recipe}&flavor=${pager.flavor}&keyword=${pager.keyword}">이전</a>
                </div>
                <c:forEach var="page" items="${pager.list}">
                <div class="${page == pager.page ? 'active' : ''}">
                    <a href="?page=${page}&recipe=${pager.recipe}&flavor=${pager.flavor}&keyword=${pager.keyword}">${page}</a>
                </div>
                </c:forEach>
                <div>
                    <a href="?page=${pager.next}&recipe=${pager.recipe}&flavor=${pager.flavor}&keyword=${pager.keyword}">다음</a>
                </div>
                <div>
                    <a href="?page=${pager.last}&recipe=${pager.recipe}&flavor=${pager.flavor}&keyword=${pager.keyword}">마지막</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>