package kr.ac.kopo.had.dao;

import java.util.List;

import kr.ac.kopo.had.model.Member;
import kr.ac.kopo.had.model.Recipe;
import kr.ac.kopo.had.util.Pager;

public interface RecipeDao {

	List<Recipe> list(Pager pager);

	int total(Pager pager);

	int search_total(Pager pager);

	List<Recipe> search(Pager pager);

	void add(Recipe item);

	Recipe item(int code);

	void update(Recipe item);

	void delete(int code);

	void delete(Member member);

	List<Recipe> myRecipe(int userNum);

	List<Recipe> random();

}
