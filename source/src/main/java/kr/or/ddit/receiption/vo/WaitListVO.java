package kr.or.ddit.receiption.vo;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString()
@EqualsAndHashCode(of="paNo")
public class WaitListVO {

	private String paName;
	private String paReg;
	private String paNo;
	private String waitstNm;
	
}
