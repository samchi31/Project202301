package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="intakeNo")
@Data
public class IntakeVO {
	private String intakeNo;
	private String ioDate;
	private String intakeCapa;
	private String intakeNe;
	private Integer hsptNo;
	private String intakeCateCd;
	private Integer empNo;
	
	private String intakeCateNm;
}
