package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="vtNo")
@Data
public class VitalVO {
	private String vtNo;
	private Integer hsptNo;
	private String vtDate;
	private Double vtTmp;
	private Integer vtPls;
	private Integer vtBp;
	private Integer vtRp;
	private String vtNe;
	private Integer empNo;
}
