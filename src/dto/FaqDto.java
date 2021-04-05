package dto;

public class FaqDto {
	
	private int faq_idx;
	private String faq_title;
	private String faq_content;
	
	public FaqDto() { 
	}

	public FaqDto(int faq_idx, String faq_title, String faq_content) {
		super();
		this.faq_idx = faq_idx;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}

	public int getFaq_idx() {
		return faq_idx;
	}

	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
}


