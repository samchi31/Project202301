package kr.or.ddit.receiption.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString()
public class SmsVO {
	private String sttCd;
	private String smsCont;
	private String smsTitle;
}
