package kr.or.ddit.nurse.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="dietCateCd")
@Data
public class DietCategoryVO {
	private String dietCateCd;
	private String dietCateNm;
}
