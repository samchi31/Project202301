package kr.or.ddit.receiption.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString()
public class SelectOperationListVO {
	private String paName;
	private String paNo;
	private String paReg;
	private String operTf;
	private Integer empNo;
	private String empNm;
	private String trmCd;
	private String diseaseCd;
}
