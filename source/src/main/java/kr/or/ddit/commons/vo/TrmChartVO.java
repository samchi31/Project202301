package kr.or.ddit.commons.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of="trmCd")
public class TrmChartVO {
	private String trmCd;
	private String mediRecord;
	private String trmDt;
	private Integer empNo;
	private String empNm;
	private String rcpNo;
	private String paNo;
	private String paName;
	
	private List<DiagHistoryVO> diagHistoryVOList;
	private List<SymptomVO> symptomVOList;
	private List<PrescriptionVO> prescriptionVOList;
	private List<FilmOrderVO> filmOrderVOList;
	private List<PtDocumentVO> ptDocumentList; //물리치료기록서
	private PatientVO patientVO;
	private ReceptionVO receptionVO;
}
