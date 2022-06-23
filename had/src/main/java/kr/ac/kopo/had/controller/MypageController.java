package kr.ac.kopo.had.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.had.model.Member;
import kr.ac.kopo.had.model.Recipe;
import kr.ac.kopo.had.service.MemberService;
import kr.ac.kopo.had.service.RecipeService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	final String path = "mypage/";
	@Autowired
	MemberService memberservice;
	
	@Autowired
	RecipeService recipeservice;
	
	@RequestMapping("/mycheck")
	public String mycheck() {
		return path + "mycheck";
	}
	
	@PostMapping("/mycheck")
	public String mypage(Member member, HttpSession session, RedirectAttributes ra) {
		Member info = (Member) session.getAttribute("member");
		member.setUserId(info.getUserId());
		if(memberservice.login(member)) {
				return "redirect:mypage";
			}
			
		ra.addFlashAttribute("check", "비밀번호가 틀렸습니다");
		return "redirect:mycheck";
			
	}
	
	@RequestMapping("/mypage")
	public String mypage(Recipe recipe, HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		int userNum = member.getUserNum();
		
		List<Recipe> list = recipeservice.myRecipe(userNum);
		
		model.addAttribute("list", list);
		
		return path + "mypage";
	}
	
	@GetMapping("/memberUpdate")
	public String memberUpdate() {
		
		return path + "memberUpdate";
	}
	
	@PostMapping("/memberUpdate")
	public String memberupdate(Member member, HttpSession session) {
		Member item = (Member) session.getAttribute("member");
		member.setUserNum(item.getUserNum());
		
		memberservice.update(member);
		
		session.setAttribute("member", member);
		
		return "redirect:./mypage";
	}
	
	@GetMapping("/passwdUpdate")
	public String passwdUpdate() {
		return path + "passwdUpdate";
	}
	
	@PostMapping("/passwdUpdate")
	public String passwdUpdate(Member member, HttpSession session) {
		Member item = (Member) session.getAttribute("member");
		member.setUserNum(item.getUserNum());
		
		memberservice.update(member);
		
		if(memberservice.login(member)) {
			member.setPasswd(null);
			
			session.setAttribute("member", member);
		}
		
		return "redirect:./mypage";
	}
	
	@GetMapping("/delete")
	public String delete() {
		return path + "memberDelete";
	}
	
	@PostMapping("/delete")
	public String delete(Member member, HttpSession session, RedirectAttributes ra) {
		Member item = (Member) session.getAttribute("member");
		
		member.setUserNum(item.getUserNum());
		
		memberservice.delete(member);
		
		ra.addFlashAttribute("delete", "회원 탈퇴가 완료되었습니다");
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	@ResponseBody
	@GetMapping("/passwdCheck/{passwd}")
	public String passwdCheck(Member member, @PathVariable String passwd, HttpSession session) {
		Member item = (Member) session.getAttribute("member");
		
		member.setUserNum(item.getUserNum());
		member.setPasswd(passwd);
		
		if(memberservice.passwdCheck(member)) {
			return "OK";
		} else return "FAIL";
	}
}
