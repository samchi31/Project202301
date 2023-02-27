package kr.or.ddit.nurse.service;

import java.util.List;

import kr.or.ddit.commons.vo.HospitalizationVO;
import kr.or.ddit.commons.vo.IntakeOutputVO;
import kr.or.ddit.commons.vo.IntakeVO;
import kr.or.ddit.commons.vo.OutputVO;
import kr.or.ddit.commons.vo.VitalVO;
import kr.or.ddit.nurse.vo.DietCategoryVO;
import kr.or.ddit.nurse.vo.DietRecordVO;
import kr.or.ddit.nurse.vo.IntakeCategoryVO;
import kr.or.ddit.nurse.vo.NrecVO;
import kr.or.ddit.nurse.vo.OutputCategoryVO;
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
	
	/**
	 * 환자의 intake 기록을 입력
	 * @param intake
	 * @return 성공, 실패
	 */
	public int intakeCreate(IntakeVO intake);
	
	/**
	 * 환자의 output 기록을 입력
	 * @param output
	 * @return 성공, 실패
	 */
	public int outputCreate(OutputVO output);
	
	/**
	 * intake 입력 항목 리스트 검색
	 * @return intake 입력 항목 리스트
	 */
	public List<IntakeCategoryVO> retrieveIntakeList();
	
	/**
	 * output 입력 항목 리스트 검색
	 * @return output 입력 항목 리스트
	 */
	public List<OutputCategoryVO> retrieveOutputList();

	/**
	 * diet 코드 항목 리스트 검색
	 * @return diet코드 항목 리스트
	 */
	public List<DietCategoryVO> retrieveDietCateList();

	/**
	 * 환자의 diet 기록을 입력
	 * @param DietRecordVO
	 * @return 성공, 실패
	 */
	public int dietCreate(DietRecordVO diet);

	/**
	 * 해당 환자의 식이기록 리스트 출력
	 * @param hsptNo
	 * @return hsptNo에 해당하는 식이 리스트
	 */
	public List<DietRecordVO> retrieveDietList(int hsptNo);

}
