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
    <link rel="stylesheet" href="/resources/css/add.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
    <script>
    	$(function(){
    		autosize($(".subject"));
    		
    		$("#back").click(function(){
    			window.history.back();
    		});
    		
    		$("#add_img").on("change", function(){
    			readURL(this);
    			$("#add_btn").addClass("hide");
    			$("#del_btn").removeClass("hide");
    		});
    		
    		$("#del_btn").on("click", function(){
    			$(this).addClass("hide");
    			del_img();
    		});
    		
    		$("#recipe_add").click(function(){
    			const recipe = $("#add_info select[name='kindNum']");
    			const flavor = $("#add_info select[name='flavorId']");
    			const name = $("#add_name input[name='recipeName']");
    			const items = $(".recipe textarea[name='recipeItems']");
    			const content = $(".recipe textarea[name='recipeContents']");
    			const form = document.getElementById("add_form");
    			
    			if(name.val() == ""){
    				alert("이름을 입력해 주세요");
    				name.focus();
    				return;
    			}
    			
    			if(items.val() == ""){
    				alert("재료를 입력해 주세요");
    				items.focus();
    				return;
    			}
    			
    			if(content.val() == ""){
    				alert("만드는 법을 입력해 주세요");
    				content.focus();
    				return;
    			}
    			
    			if(recipe.val() == 0){
    				alert("종류를 선택해 주세요");
    				return;
    			}
    			
    			if(flavor.val() == 0){
    				alert("맛을 선택해 주세요");
    				return;
    			}
    			
    			form.submit();
    		});
    	});
function del_img(){
	$("#uploadImage").attr("src","/resources/img/no_img_border.png");
	$("#add_img").val("");
	$("#add_btn").removeClass("hide");
}
    	
function readURL(input){
	if(input.files && input.files[0]){
		const reader = new FileReader();
		reader.onload = function(e){
			$("#uploadImage").attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
    </script>
</head>
<body id="body">
    <div id="wrap">
        <div id="content">
            <div id="header">
                <div id="logo">
                    <a href="..">Have a Drink!</a>
                </div>
                <div id="nav">
                    <ul>
                        <li><a href="/logout">로그아웃</a></li>
                        <li><a href="/mypage/mycheck">마이페이지</a></li>
                    </ul>
                </div>
            </div>
            <div id="sub_logo">
                <p>레시피 등록</p>
            </div>
        </div>
        <form method="post" id="add_form" enctype="multipart/form-data">
            <div id="add">
                <div id="add_file">
                    <img id="uploadImage" src="/resources/img/no_img_border.png" width="250px" height="250px">
                    <img class="hide" id="del_btn" src="/resources/img/cancel.png" width="30px" height="30px">
                    <label for="add_img"><img id="add_btn" src="/resources/img/plus.png"></label>
                    <input id="add_img" type="file" name="uploadFile">
                </div>
                <div id="add_name">
                    <div>
                        <label>이름 : </label>
                        <input type="text" name="recipeName">
                    </div>
                    <div>
                        <label>부가설명 : </label>
                        <textarea id="sub_name" name="subName" rows="7" style="height: 190px; overflow-y: scroll;"></textarea>
                    </div>
                </div>
                <div id="add_info">
                    <div>
                        <p>종류</p>
                        <select id="kind_op" name="kindNum">
                            <option value="0">ALL</option>
                            <option value="1">ALCOHOL</option>
                            <option value="2">BEVERAGE</option>
                            <option value="3">COFFEE</option>
                        </select>
                    </div>
                    <div>
                        <p>맛</p>
                        <select id="flavor_op" name="flavorId">
                            <option value="0">ALL</option>
                            <option value="1">단맛</option>
                            <option value="2">신맛</option>
                            <option value="3">쓴맛</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="recipe">
                <p class="title">재료</p>
                <textarea name="recipeItems" class="subject"></textarea>
            </div>
            <div class="recipe">
                <p class="title">만드는 법</p>
                <textarea name="recipeContents" class="subject"></textarea>
            </div>
            <div id="footer">
            		<button id="back" type="button">이전</button>
                    <button id="recipe_add" type="button">레시피 등록</button>
            </div>
        </form>
    </div>
</body>
</html>