package kr.ac.kopo.had.model;

import org.springframework.web.multipart.MultipartFile;

public class Recipe {
	private int recipeId;
	private int kindNum;
	private int userNum;
	private int flavorId;
	private String recipeName;
	private String subName;
	private String recipeItems;
	private String recipeContents;
	private MultipartFile uploadFile;
	private String filecode;

	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public int getKindNum() {
		return kindNum;
	}

	public void setKindNum(int kindNum) {
		this.kindNum = kindNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public int getFlavorId() {
		return flavorId;
	}

	public void setFlavorId(int flavorId) {
		this.flavorId = flavorId;
	}

	public String getRecipeName() {
		return recipeName;
	}

	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getRecipeItems() {
		return recipeItems;
	}

	public void setRecipeItems(String recipeItems) {
		this.recipeItems = recipeItems;
	}

	public String getRecipeContents() {
		return recipeContents;
	}

	public void setRecipeContents(String recipeContents) {
		this.recipeContents = recipeContents;
	}

	public String getFilecode() {
		return filecode;
	}

	public void setFilecode(String filecode) {
		this.filecode = filecode;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

}
