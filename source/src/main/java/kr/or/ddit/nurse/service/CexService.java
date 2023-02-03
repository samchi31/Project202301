package kr.or.ddit.nurse.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.PatientVO;

/**
 * 
 * <pre>
 * 임상검사실 화면을 위한 Business Logic Layer
 * </pre>
 * @author 위대현
 * @since 2023. 2. 3.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 *   수정일                   수정자                         수정내용
 * --------      --------    ----------------------
 * 2023. 2. 3.     위대현                        최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface CexService {

	public List<PatientVO> retrievePatientList(Map<String, String> map);
}






























