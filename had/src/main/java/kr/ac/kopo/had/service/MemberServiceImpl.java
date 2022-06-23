package kr.ac.kopo.had.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.had.dao.MemberDao;
import kr.ac.kopo.had.dao.RecipeDao;
import kr.ac.kopo.had.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Autowired
	RecipeDao recipeDao;
	
	@Override
	public void add(Member member) {
		dao.add(member);
	}

	@Override
	public boolean check(String userId) {
		if(dao.check(userId) == 0) {
			return true;
		}
		else
			return false;
	}

	@Override
	public boolean check_alias(String alias) {
		if(dao.check_alias(alias) == 0) {
			return true;
		}
		else {
			return false;
			}
	}

	@Override
	public boolean login(Member member) {
		Member item = dao.item(member);
		
		if(item != null) {
			member.setPasswd(null);
			member.setAlias(item.getAlias());
			member.setEmail(item.getEmail());
			member.setUserNum(item.getUserNum());
			
			return true;
		}
		
		return false;
	}

	@Override
	public void update(Member member) {
		dao.update(member);
	}

	@Transactional
	@Override
	public void delete(Member member) {
		recipeDao.delete(member);
		dao.delete(member);
	}

	@Override
	public boolean passwdCheck(Member member) {
		if(dao.passwdCheck(member) > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean id_find(Member member) {
		Member item = dao.id_find(member);
		if(item != null) {
			member.setUserId(item.getUserId());
			return true;
		} else
			return false;
	}

	@Override
	public boolean passwd_find(Member member) {
		if(dao.passwd_find(member) > 0) {
			return true;
		} else
			return false;
	}

	@Override
	public void passwd_find_update(Member member) {
		dao.passwd_find_update(member);
	}

	@Override
	public boolean check_email(String email) {
		if(dao.check_email(email) == 0)
			return true;
		else
			return false;
	}

}
