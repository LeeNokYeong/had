package kr.ac.kopo.had.service;

import kr.ac.kopo.had.model.Member;

public interface MemberService {

	void add(Member member);

	boolean check(String userId);

	boolean check_alias(String alias);

	boolean login(Member member);

	void update(Member member);

	void delete(Member member);

	boolean passwdCheck(Member member);

	boolean id_find(Member member);

	boolean passwd_find(Member member);

	void passwd_find_update(Member member);

	boolean check_email(String email);

}
