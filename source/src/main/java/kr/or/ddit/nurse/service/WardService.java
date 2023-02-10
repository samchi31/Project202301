package kr.or.ddit.nurse.service;

import java.util.List;

import kr.or.ddit.commons.vo.HospitalizationVO;
import kr.or.ddit.commons.vo.IntakeOutputVO;
import kr.or.ddit.commons.vo.VitalVO;
import kr.or.ddit.nurse.vo.NrecVO;
import kr.or.ddit.nurse.vo.WardVO;

/**
 * 
 * <pre>
 * 병실관리 화면을 위한 Business Logic Layer
 * </pre>
 * @author 위대현
 * @since 2023. 2. 7.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 *   수정일                    수정자                           수정내용
 * --------       --------    ----------------------
 * 2023. 2. 7.      위대현                         최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface WardService {
	
	public List<WardVO> retrieveWardPatientList();
	
	public WardVO retrieveWardPatient(int hsptNo);
	
	public int createNrec(NrecVO nrec);
	
	public List<NrecVO> retrieveNrecList(int hsptNo);
	
	public int createVital(VitalVO vital);
	
	public List<HospitalizationVO> retrieveVitalList(int hsptNo);

	public int ioduplicateCheck(IntakeOutputVO io);

	public int ioCreate(IntakeOutputVO io);

	public List<IntakeOutputVO> retrieveIoList(IntakeOutputVO io);
}
