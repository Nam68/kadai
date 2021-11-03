package kadai.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kadai.model.CsvDTO;

public interface CsvService {
	
	public static final String[][] COST = {
			{"東京", "95"},	
			{"千葉", "105"},
			{"神奈川", "105"},
			{"埼玉", "105"},
			{"", "115"}
	};
	
	public Map getList(MultipartFile csv);
	public List getRegion(List<CsvDTO> list);
	public List getCost(List<CsvDTO> list);
	
}
