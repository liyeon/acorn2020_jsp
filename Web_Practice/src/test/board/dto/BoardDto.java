package test.board.dto;

public class BoardDto {
	private int num;
	private String title;
	private String name;
	private String regdate;
	
	public BoardDto() {}

	public BoardDto(int num, String title, String name, String regdate) {
		super();
		this.num = num;
		this.title = title;
		this.name = name;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
	
}
