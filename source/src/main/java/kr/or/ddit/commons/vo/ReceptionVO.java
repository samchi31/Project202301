package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="rcpNo")
public class ReceptionVO {
	private Integer rcpNo;
	private Integer paNo;
	private String rcpDate;
	private String officeCd;
}
