package kr.or.ddit.commons.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="sysntcCd")
@Data
public class SystemNoticeVO {
	private String mrgId;
	private Integer sysntcCd;
	private String sysntcTitle;
	private String sysntcCont;
	private String sysntcEndt;
}
