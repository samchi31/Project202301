package kr.or.ddit.nurse.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="intakeCateCd")
@Data
public class IntakeCategoryVO {
	private String intakeCateCd;
	private String intakeCateNm;
}
