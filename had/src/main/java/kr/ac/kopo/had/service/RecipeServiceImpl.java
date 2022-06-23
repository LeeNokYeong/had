package kr.ac.kopo.had.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.had.dao.RecipeDao;
import kr.ac.kopo.had.model.Member;
import kr.ac.kopo.had.model.Recipe;
import kr.ac.kopo.had.util.Pager;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	RecipeDao dao;
	
	@Override
	public List<Recipe> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public List<Recipe> search_list(Pager pager) {
		int total = dao.search_total(pager);
		
		pager.setTotal(total);
		
		return dao.search(pager);
	}

	@Override
	public void add(Recipe item) {
		dao.add(item);
	}

	@Override
	public Recipe item(int code) {
		return dao.item(code);
	}

	@Override
	public void update(Recipe item) {
		dao.update(item);
	}

	@Override
	public void delete(int code) {
		dao.delete(code);
	}

	@Override
	public List<Recipe> myRecipe(int userNum) {
		return dao.myRecipe(userNum);
	}

	@Override
	public List<Recipe> random() {
		return dao.random();
	}

}
