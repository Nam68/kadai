package kadai.model;

public class CsvDTO {
	
	private String name, addr;
	private int price;
	
	public CsvDTO() {
		
	}

	public CsvDTO(String name, String addr, int price) {
		super();
		this.name = name;
		this.addr = addr;
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
