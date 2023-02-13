package kr.or.ddit.receiption.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@ToString()
public class ReceiptionVO {
	// 환자 검색 시 간편 정보 
	private Integer paNo;
	private String paName;
	private String paReg;
	private String paHp;
	private Integer paZip;
	private String paAdd1;
	private String paAdd2;
	private String paDelete;
	private String paSex;
	
	
	// 진료실 배정
	private String officeCd;
	
}
