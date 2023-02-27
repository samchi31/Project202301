package kr.or.ddit.receiption.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString()
public class RegistVO {
	private String rcpNo;
	private String paNo;
	private String rcpDate;
	private String officeCd;
}
