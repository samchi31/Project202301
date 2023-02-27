package kr.or.ddit.commons.vo;

import java.util.Date;
import java.util.List;

import kr.or.ddit.nurse.vo.OperationJoinVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@EqualsAndHashCode(of="opNo")
@Data
@ToString
public class OperationInfomationVO{
	private String opNo;
	private String opDate;
	private String opState;
	private String trmCd;
	private Date opStartTime;
	private Date opEndTime;
	private String diseaseCd;
	private Date opReservStarttime;
	private Date opReservEndtime;
	private String paNo;
	private String paName;
	private String paReg;
	private String opCd;
	private String opKrNm;
	private String opEnNm;
	private String operatingSurgeon;
	private String opColorCd;
	private String opRecord;
	
	private DiagHistoryVO diagHistory;
	private List<OperationJoinVO> operationJoinList;
	
}
