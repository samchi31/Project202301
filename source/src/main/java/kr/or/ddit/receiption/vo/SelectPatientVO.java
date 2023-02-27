package kr.or.ddit.receiption.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString()
public class SelectPatientVO {

	private String paNo;
	private String paName;
	private String paReg;
	private String paHp;
	private String paSex;
}
