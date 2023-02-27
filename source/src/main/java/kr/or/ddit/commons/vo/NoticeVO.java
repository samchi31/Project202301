package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode
@NoArgsConstructor
@ToString
public class NoticeVO {
	private Integer ntcCd;
	private String ntcTitle;
	private String ntcCont;
	private String ntcEndt;
	private Integer ntcHit;
	private Integer empNo;
}
