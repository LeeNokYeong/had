package kr.ac.kopo.had.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.had.model.Member;
import kr.ac.kopo.had.model.Recipe;
import kr.ac.kopo.had.service.RecipeService;
import kr.ac.kopo.had.util.Pager;

@Controller
@RequestMapping("/recipe")
public class RecipeController {
	final String path = "recipe/";
	
	@Autowired
	RecipeService service;
	
	@GetMapping("/list/{state}")
	public String list(Pager pager, @PathVariable int state, Model model, HttpSession session) {
			pager.setRecipe(state);
			session.setAttribute("state", state);
			List<Recipe> list = service.list(pager);
			
			model.addAttribute("list", list);
			
			return path + "list";
	}
	
	@GetMapping("/search")
	public String search(HttpSession session, Pager pager, Model model, int recipe, int flavor, String keyword) {
		session.setAttribute("state", 4);
		
		pager.setRecipe(recipe);
		pager.setFlavor(flavor);
		pager.setKeyword(keyword);
		List<Recipe> list = service.search_list(pager);
		
		model.addAttribute("list", list);
		
		return path + "search";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(HttpSession session, Recipe item) {
		int state = (int) session.getAttribute("state");
		Member member = (Member) session.getAttribute("member");
		
		item.setUserNum(member.getUserNum());
		
		MultipartFile uploadFile = item.getUploadFile();
		
		if(uploadFile != null && uploadFile.getSize() > 0) {
			String filename = uploadFile.getOriginalFilename();
			String path = "C:/upload/";
			String filecode = UUID.randomUUID() + "_" + filename;
			item.setFilecode(filecode);
			try {
				uploadFile.transferTo(new File(path + filecode));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		service.add(item);
		
		if(state != 4)
			return "redirect:list/" + state;
		else
			return "redirect:list/1";
	}
	
	@GetMapping("/view/{code}")
	public String view(@PathVariable int code, Model model, Recipe item) {
		item = service.item(code);
		
		model.addAttribute("recipe", item);
		
		return path + "view";
	}
	
	@GetMapping("/update/{code}")
	public String update(Recipe item, Model model, @PathVariable int code) {
		item = service.item(code);
		
		model.addAttribute("recipe", item);
		
		return path + "update";
	}
	
	@PostMapping("/update/{code}")
	public String update(Recipe item, @PathVariable int code, HttpSession session, RedirectAttributes ra) {
		Member member = (Member) session.getAttribute("member");
		item.setRecipeId(code);
		item.setUserNum(member.getUserNum());
		String file = item.getFilecode();
		
		MultipartFile uploadFile = item.getUploadFile();
		
		if(uploadFile != null && uploadFile.getSize() > 0) {
			String filename = uploadFile.getOriginalFilename();
			String path = "D:/upload/";
			String filecode = UUID.randomUUID() + "_" + filename;
			item.setFilecode(filecode);
			try {
				uploadFile.transferTo(new File(path + filecode));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
		else if (uploadFile == null && uploadFile.getSize() == 0) {
			if(file != null || file.length() > 0) {
				item.setFilecode(file);
			} else
				item.setFilecode(null);
		}
		
		service.update(item);
		
		ra.addFlashAttribute("update", "수정되었습니다");
		
		return "redirect:../view/" + code;
	}
	
	@RequestMapping("/delete/{code}")
	public String delete(@PathVariable int code, HttpSession session) {
		int state = (int) session.getAttribute("state");
		
		service.delete(code);
		
		if(state != 0)
			return "redirect:../list/" + state;
		else
			return "redirect:/";
	}
	
}
