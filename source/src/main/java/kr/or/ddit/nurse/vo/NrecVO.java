package kr.or.ddit.nurse.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="nrecNo")
@Data
public class NrecVO {
	private String nrecNo;
	private String nrecCont;
	private String nrecDate;
	private Integer empNo;
	private String paNo;
	private Integer hsptNo;
	
	private String paName;
	private String empNm;
}
