package kr.ac.kopo.had.dao;

import kr.ac.kopo.had.model.Member;

public interface MemberDao {

	void add(Member member);

	int check(String userId);

	int check_alias(String alias);

	Member item(Member member);

	void update(Member member);

	void delete(Member member);

	int passwdCheck(Member member);

	Member id_find(Member member);

	int passwd_find(Member member);

	void passwd_find_update(Member member);

	int check_email(String email);

}
