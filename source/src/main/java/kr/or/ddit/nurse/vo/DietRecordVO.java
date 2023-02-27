package kr.or.ddit.nurse.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="dietNo")
@Data
public class DietRecordVO {
	private String dietNo;
	private String dietDate;
	private String dietNe;
	private Integer hsptNo;
	private String dietCateCd;
	private Integer empNo;
	private String dietTime;
	
	private String dietCateNm;
}
