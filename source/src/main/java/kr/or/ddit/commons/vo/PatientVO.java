package kr.or.ddit.commons.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@EqualsAndHashCode(of="paNo")
@Data
@ToString
public class PatientVO {
	private String paNo;
	private String paName;
	private String paReg;
	private String paHp;
	private Integer paZip;
	private String paAdd1;
	private String paAdd2;
	private String paDelete;
	private String paSex;
	
	private String rcpNo;
	private String rcpDate;
	
	private List<ReceptionVO> receptionList;
	private List<TrmChartVO> trmList;
}
