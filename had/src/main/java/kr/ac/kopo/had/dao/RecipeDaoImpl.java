package kr.ac.kopo.had.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.had.model.Member;
import kr.ac.kopo.had.model.Recipe;
import kr.ac.kopo.had.util.Pager;

@Repository
public class RecipeDaoImpl implements RecipeDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Recipe> list(Pager pager) {
		return sql.selectList("recipe.list", pager);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("recipe.total", pager);
	}

	@Override
	public int search_total(Pager pager) {
		return sql.selectOne("recipe.search_total", pager);
	}

	@Override
	public List<Recipe> search(Pager pager) {
		return sql.selectList("recipe.search", pager);
	}

	@Override
	public void add(Recipe item) {
		sql.insert("recipe.add", item);
	}

	@Override
	public Recipe item(int code) {
		return sql.selectOne("recipe.item", code);
	}

	@Override
	public void update(Recipe item) {
		sql.update("recipe.update", item);
	}

	@Override
	public void delete(int code) {
		sql.delete("recipe.delete", code);
	}

	@Override
	public void delete(Member member) {
		sql.delete("recipe.member_delete", member);
	}

	@Override
	public List<Recipe> myRecipe(int userNum) {
		return sql.selectList("recipe.myRecipe", userNum);
	}

	@Override
	public List<Recipe> random() {
		return sql.selectList("recipe.random");
	}

}
