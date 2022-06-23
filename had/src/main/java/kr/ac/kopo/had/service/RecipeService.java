package kr.ac.kopo.had.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.had.model.Member;
import kr.ac.kopo.had.model.Recipe;
import kr.ac.kopo.had.util.Pager;

@Service
public interface RecipeService {
	
	List<Recipe> list(Pager pager);

	List<Recipe> search_list(Pager pager);

	void add(Recipe item);

	Recipe item(int code);

	void update(Recipe item);

	void delete(int code);

	List<Recipe> myRecipe(int userNum);

	List<Recipe> random();

}
