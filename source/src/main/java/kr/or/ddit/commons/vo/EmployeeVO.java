package kr.or.ddit.commons.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="empNo")
@Data
public class EmployeeVO {
	private Integer empNo;
	private String empNm;
	private String empPw;
	private String empTel;
	private String empHrdt;
	private String empRtdt;
	private String empMail;
	private Integer empReg1;
	private Integer empReg2;
	private Integer empZip;
	private String empAdd1;
	private String empAdd2;
	private String jobCd;
	private String posiCd;
	private String majorCd;
	
	private List<VitalVO> vitalList;
}
