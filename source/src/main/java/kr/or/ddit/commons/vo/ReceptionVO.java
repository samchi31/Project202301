package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * @author 작성자명
 * @since ${date}
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 0209          장예지            private Patient patient
 *                      접수번호로 환자 이름을 가져오기 위해 추가
 * Copyright (c) ${year} by DDIT All right reserved
 * </pre>
 */

@Data
@EqualsAndHashCode(of="rcpNo")
@ToString
public class ReceptionVO {
   private String rcpNo;
   private String paNo;
   private String rcpDate;
   private String officeCd;
   
   private PatientVO patient;
   
   private TrmChartVO trmChart;

}