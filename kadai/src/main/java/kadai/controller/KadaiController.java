package kadai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KadaiController {
	
	@RequestMapping("/kadaiMain.do")
	public String kadaiMain() {
		return "kadai_main";
	}
	
}
