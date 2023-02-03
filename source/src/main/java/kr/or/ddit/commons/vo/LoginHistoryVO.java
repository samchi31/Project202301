package kr.or.ddit.commons.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="logNo")
@Data
public class LoginHistoryVO {
	private Integer logNo;
	private Integer empNo;
	private String logIp;
	private String logDate;
}
