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
    <link rel="stylesheet" href="/resources/css/view.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
    <script>
    	$(function(){
    		autosize($(".subject"));
    		
    		if('${update}' != ""){
    			alert('${update}');
    		}
    		
    		$("#back").click(function(){
    			if('${update}' != ""){
        			location.href = "../list/" + '${state}';
        		} else
					window.history.back();
    		});
    		
    		$("#recipe_update").click(function(){
    			const result = confirm("레시피를 수정하시겠습니까?");
    			
    			if(result){
    				location.href = `../update/${recipe.recipeId}`;	
    			} else {
    				
    			}
    			
    		});
    		
    		$("#recipe_delete").click(function(){
    			const result = confirm("레시피를 삭제하시겠습니까?");
    			
    			if(result){
    				location.href = `../delete/${recipe.recipeId}`;	
    			} else {
    				
    			}	
    		});
    	});
    </script>
</head>
<body id="body">
    <div id="wrap">
        <div id="content">
            <div id="header">
                <div id="logo">
                    <a href="../..">Have a Drink!</a>
                </div>
                <div id="nav">
                    <ul>
                    	<c:if test="${sessionScope.member != null}">
                    		<li><a href="../../logout">로그아웃</a></li>
                        	<li><a href="../../mypage/mycheck">마이페이지</a></li>	
                    	</c:if>
                        <c:if test="${sessionScope.member == null}">
                        	<li><a href="../../login">로그인</a></li>
                        	<li><a href="../../signup">회원가입</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div id="sub_logo">
                <p>레시피</p>
            </div>
        </div>
        <form id="add_form">
            <div id="add">
                <div id="add_file">
                    <img src="/upload/${recipe.filecode}" onerror="this.src='/resources/img/no_img_border.png'" width="250px" height="250px">
                </div>
                <div id="add_name">
                    <div>
                        <label>이름 : </label>
                        <input type="text" value="${recipe.recipeName}" readonly>
                    </div>
                    <div>
                        <label>부가설명 : </label>
                        <textarea name="subName" rows="7" readonly>${recipe.subName}</textarea>
                    </div>
                </div>
                <div id="add_info">
                    <div>
                        <p>종류</p>
                        <select name="recipe" disabled>
                            <option value="0">ALL</option>
                            <option value="1" ${recipe.kindNum == 1 ? 'selected' : ''}>ALCOHOL</option>
                            <option value="2" ${recipe.kindNum == 2 ? 'selected' : ''}>BEVERAGE</option>
                            <option value="3" ${recipe.kindNum == 3 ? 'selected' : ''}>COFFEE</option>
                        </select>

                    </div>
                    <div>
                        <p>맛</p>
                        <select name="flavor" disabled>
                            <option value="0">ALL</option>
                            <option value="1" ${recipe.flavorId == 1 ? 'selected' : ''}>단맛</option>
                            <option value="2" ${recipe.flavorId == 2 ? 'selected' : ''}>신맛</option>
                            <option value="3" ${recipe.flavorId == 3 ? 'selected' : ''}>쓴맛</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="recipe">
                <p class="title">재료</p>
                <textarea class="subject" readonly>${recipe.recipeItems}</textarea>
            </div>
            <div class="recipe">
                <p class="title">만드는 법</p>
                <textarea class="subject" readonly>${recipe.recipeContents}</textarea>
            </div>
            <div id="footer">
                <div>
                    <button id="back" type="button">이전</button>
                </div>
                <c:if test="${sessionScope.member.userNum == recipe.userNum}">
                <div>
                    <button id="recipe_update" type="button">레시피 변경</button>
                </div> 
                <div>
                    <button id="recipe_delete" type="button">삭제</button>
                </div>
                </c:if>
            </div>
        </form>
    </div>
</body>
</html>