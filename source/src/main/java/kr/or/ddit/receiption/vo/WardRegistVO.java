package kr.or.ddit.receiption.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString()
public class WardRegistVO {
	private String hsptYn;
	private String hsptInDt;
	private String hsptOutDt;
	private Integer bedNo;
	private Integer wrRno;
	private String trmCd;
	private String diseaseCd;
}
