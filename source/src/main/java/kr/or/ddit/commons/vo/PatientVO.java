package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="paNo")
@Data
public class PatientVO {
	private Integer paNo;
	private String paName;
	private Integer paReg1;
	private Integer paReg2;
	private String paHp;
	private String paInyn;
	private String paPrn;
	private Integer paZip;
	private String paAdd1;
	private String paAdd2;
	private String paPiyn;
	private String paDelete;
}
