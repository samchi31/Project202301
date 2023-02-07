package kr.or.ddit.commons.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "ptasNo")
@NoArgsConstructor
@ToString
public class PtAssinmentVO implements Serializable {
	private Integer ptasNo;
	private String ptBedCd;
	private Integer rcpNo;
	private String ptasEnd;
	private Integer empNo;
	
	private String ptBedState;
	
	private Integer paNo;
	private String paName;
	private Integer paReg;
}
