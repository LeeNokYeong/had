package kr.ac.kopo.had.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.had.model.Member;
import kr.ac.kopo.had.model.Recipe;
import kr.ac.kopo.had.service.MemberService;
import kr.ac.kopo.had.service.RecipeService;

@Controller
public class RootController {
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	RecipeService recipeservice;
	
	@RequestMapping("/")
	public String index(Model model, Recipe recipe, HttpSession session) {
		List<Recipe> random = recipeservice.random();
		
		model.addAttribute("random", random);
		
		session.setAttribute("state", 0);
		
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(Member member, HttpSession session, RedirectAttributes ra) {
		if(memberservice.login(member)) {
			session.setAttribute("member", member);
			return "redirect:.";
		}
		
		ra.addFlashAttribute("login", "아이디 또는 비밀번호가 잘못 입력 되었습니다");
		return "redirect:/login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("signup")
	public String signup(Member member, RedirectAttributes ra) {
		memberservice.add(member);
		
		ra.addFlashAttribute("msg", "회원가입을 축하합니다!");
		
		return "redirect:login";
	}
	
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(String userId) {
		if(memberservice.check(userId)) {
			return "OK";
		}
		else
			return "FAIL";
		
	}
	
	@ResponseBody
	@GetMapping("/checkAlias")
	public String checkAlias(String alias) {
		if(memberservice.check_alias(alias)) {
			return "OK";
		}
		else
			return "FAIL";
	}
	
	@ResponseBody
	@GetMapping("/checkEmail")
	public String checkEmail(String email) {
		if(memberservice.check_email(email)) {
			return "OK";
		} else
			return "FAIL";
	}
	
	@RequestMapping("/id_find")
	public String id_find() {
		return "id_find";
	}
	
	@PostMapping("/id_find")
	public String id_find(Member member, RedirectAttributes ra) {
		if(memberservice.id_find(member)) {
			String id = member.getUserId();
			
			ra.addFlashAttribute("id", id);
			
			return "redirect:login";
		} else {
			ra.addFlashAttribute("not_found", "일치하는 아이디가 없습니다");
			
			return "redirect:id_find";
		}
	}
	
	@RequestMapping("/passwd_find")
	public String passwd_find() {
		return "passwd_find";
	}
	
	@PostMapping("/passwd_find")
	public String passwd_find(Member member, HttpSession session, RedirectAttributes ra) {
		if(memberservice.passwd_find(member)) {
			session.setAttribute("userId", member.getUserId());
			
			return "redirect:passwd_find_update";
		} else {
			ra.addFlashAttribute("not_found", "일치하는 사용자가 없습니다");
			
			return "redirect:passwd_find";
		}
	}
	
	@GetMapping("/passwd_find_update")
	public String passwd_find_update() {
		return "passwd_find_update";
	}
	
	@PostMapping("/passwd_find_update")
	public String passwd_find_update(Member member, HttpSession session, RedirectAttributes ra) {
		String id = (String) session.getAttribute("userId");
		
		member.setUserId(id);
		
		memberservice.passwd_find_update(member);
		
		ra.addFlashAttribute("passwd_update", "비밀번호가 변경되었습니다");
		
		return "redirect:login";
	}

}
