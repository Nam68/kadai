package kadai.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
			BufferedReader br = new BufferedReader(new InputStreamReader(csv.getInputStream(), "SJIS"));
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
		
		result.put("costList", getCost(list));
		result.put("regionList", getRegion(list));
		result.put("cost", numberFormat(total));
		return result;
	}
	
	public String numberFormat(int cost) {
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(cost);
	}

	public List getRegion(List<CsvDTO> list) {
		List<String[]> result = new ArrayList<String[]>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		for(CsvDTO dto : list) {
			String region = dto.getAddr().substring(0, 3);
			if(map.get(region) == null) {
				map.put(region, 1);
			} else {
				map.put(region, map.get(region) +1);
			}
		}
		return getStringList(map);
	}

	public List getCost(List<CsvDTO> list) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		for(CsvDTO dto : list) {
			int price = dto.getPrice();
			if(map.get(price+"") == null) {
				map.put(price+"", 1);
			} else {
				map.put(price+"", map.get(price+"") +1);
			}
		}
		return getStringList(map);
	}
	
	public List<String[]> getStringList(Map<String, Integer> map) {
		List<String[]> result = new ArrayList<String[]>();
		Iterator i = map.keySet().iterator();
		while(i.hasNext()) {
			String key = (String) i.next();
			String[] str = new String[2];
			str[0] = key;
			str[1] = ((Integer) map.get(key))+"";
			result.add(str);
		}
		return result;
	}

}
