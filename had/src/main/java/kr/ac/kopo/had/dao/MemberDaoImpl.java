package kr.ac.kopo.had.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.had.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public void add(Member member) {
		sql.insert("member.add", member);
	}

	@Override
	public int check(String userId) {
		return sql.selectOne("member.check", userId);
	}

	@Override
	public int check_alias(String alias) {
		return sql.selectOne("member.check_alias", alias);
	}

	@Override
	public Member item(Member member) {
		return sql.selectOne("member.login", member);
	}

	@Override
	public void update(Member member) {
		sql.update("member.update", member);
	}

	@Override
	public void delete(Member member) {
		sql.delete("member.delete", member);
	}

	@Override
	public int passwdCheck(Member member) {
		return sql.selectOne("member.passwdCheck", member);
	}

	@Override
	public Member id_find(Member member) {
		return sql.selectOne("member.id_find", member);
	}

	@Override
	public int passwd_find(Member member) {
		return sql.selectOne("member.passwd_find", member);
	}

	@Override
	public void passwd_find_update(Member member) {
		sql.update("member.passwd_find_update", member);
	}

	@Override
	public int check_email(String email) {
		return sql.selectOne("member.check_email", email);
	}


}
