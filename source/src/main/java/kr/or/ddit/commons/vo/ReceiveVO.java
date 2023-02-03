package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="recNo")
public class ReceiveVO {
	private Integer recNo;
	private String recYnif;
	private String recMth;
	private Integer recTotl;
	private String recEndt;
	private String trmCd;
	private String recApcd;
	
}
