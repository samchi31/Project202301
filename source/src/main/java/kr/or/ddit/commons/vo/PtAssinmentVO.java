package kr.or.ddit.commons.vo;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;


@EqualsAndHashCode(of = "ptasNo")
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
public class PtAssinmentVO implements Serializable {
	private String ptasNo;
	private String ptBedCd;
	private String rcpNo;
	private String rcpDate;
	private String ptasEnd;
	private String empNo;
	
	private String ptBedState;
	
	private String paNo;
	private String paName;
	private String paReg;
	
	//환자 치료일지
	private Integer pdNo;
	private String pdDt;
	private String trmCd;
	private String pdCont;
	private String pdPart;
	
	
//	0215추가
	private WaitHistoryVO waitHistoryVO;
	private ReceptionVO receptionVO;
	private PatientVO patientVO;
	private TrmChartVO trmChartVO;
	private List<SymptomVO> symptomVOList;
	
}
