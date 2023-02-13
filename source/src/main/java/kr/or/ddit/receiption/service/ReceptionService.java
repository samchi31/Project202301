package kr.or.ddit.receiption.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.receiption.vo.ReceiptionVO;

/**
 * 
 * <pre>
 * 접수 화면을 위한 Business Logic Layer
 * </pre>
 * @author 박인성
 * @since 2023. 2. 6.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 *   수정일                   수정자                         수정내용
 * --------      --------    ----------------------
 * 2023. 2. 6.     박인성                       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

public interface ReceptionService {

	public List<ReceiptionVO> searchPatientList(Map<String, String> map);
	
	public int createReceiption(ReceiptionVO receiptionVO);
}






























