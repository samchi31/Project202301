package kr.or.ddit.nurse.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="outputCateCd")
@Data
public class OutputCategoryVO {
	private String outputCateCd;
	private String outputCateNm;
}
