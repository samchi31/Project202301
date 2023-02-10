package kr.or.ddit.nurse.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="nrecNo")
@Data
public class NrecVO {
	private Integer nrecNo;
	private String nrecCont;
	private String nrecDate;
	private Integer empNo;
	private Integer paNo;
	private Integer hsptNo;
	
	private String paName;
	private String empNm;
}
