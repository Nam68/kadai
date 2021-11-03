package kadai.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kadai.model.CsvDTO;
import kadai.service.CsvService;

@Controller
public class KadaiController {
	
	@Autowired
	private CsvService service;
	
	@RequestMapping("/kadaiMain.do")
	public String kadaiMain() {
		return "kadai_main";
	}
	
	@RequestMapping(value = "/csvUpload.do", method = RequestMethod.POST)
	public ModelAndView csvUpload(MultipartFile csv) {
		Map map = service.getList(csv);
		List<CsvDTO> list = (List<CsvDTO>) map.get("list");
		int cost = (Integer) map.get("cost");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cost", cost);
		mav.setViewName("result");
		return mav;
	}
	
}
