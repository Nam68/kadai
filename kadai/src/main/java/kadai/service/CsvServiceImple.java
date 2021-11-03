package kadai.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kadai.model.CsvDTO;

public class CsvServiceImple implements CsvService {

	public Map getList(MultipartFile csv) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<CsvDTO> list = new ArrayList<CsvDTO>();
		int total = 0;
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(csv.getInputStream()));
			br.readLine(); //Throw Title Line
			String line = "";
			while((line = br.readLine()) != null) {
				String name = line.substring(0, line.lastIndexOf(","));
				String addr = line.substring(line.lastIndexOf(",")+1, line.length());
				int price = 0;
				for(String[] str : COST) {
					if(addr.contains(str[0])) {
						price = Integer.parseInt(str[1]);
						total += price;
						break;
					}
				}
				list.add(new CsvDTO(name, addr, price));
			}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		result.put("list", list);
		result.put("cost", total);
		return result;
	}

	public List getRegion(List<CsvDTO> list) {
		
		return null;
	}

	public List getCost(List<CsvDTO> list) {
		
		return null;
	}

}
