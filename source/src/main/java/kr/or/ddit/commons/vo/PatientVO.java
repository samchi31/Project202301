package kr.or.ddit.commons.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="paNo")
@Data
public class PatientVO {
	private Integer paNo;
	private String paName;
	private Integer paReg;
	private String paHp;
	private Integer paZip;
	private String paAdd1;
	private String paAdd2;
	private String paDelete;
	private String paSex;
	
	private List<ReceptionVO> receptionList;
}
