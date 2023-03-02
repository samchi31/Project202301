package kr.or.ddit.receiption.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.receiption.vo.OutHospitalizationVO;
import kr.or.ddit.receiption.vo.ReadRegistVO;
import kr.or.ddit.receiption.vo.ReceiptionVO;
import kr.or.ddit.receiption.vo.RegistVO;
import kr.or.ddit.receiption.vo.SelectPatientVO;
import kr.or.ddit.receiption.vo.SmsVO;
import kr.or.ddit.receiption.vo.WaitListVO;
import kr.or.ddit.receiption.vo.WardRegistVO;
import kr.or.ddit.receiption.vo.SelectOperationListVO;

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

	/** 환자검색
	 * @param map
	 * @return
	 */
	public List<ReceiptionVO> searchPatientList(Map<String, String> map);
	
	/**
	 * 접수등록
	 * @param receiptionVO
	 * @return
	 */
	public int createReceiption(RegistVO registVO);
	
	/**대기 히스토리 등록
	 * @param waitHistoryVO
	 * @return
	 */
	public int createWaitHistory();
	
	/**
	 * 새로운 환자 등록
	 * @param patientVO
	 * @return
	 */
	public int createPatient(PatientVO patientVO);

	/**
	 * 등록한 최신환자 조회
	 * @param selectPatientVO
	 * @return
	 */
	public SelectPatientVO selectPatient();
	
	public ReadRegistVO selectRegistVO(String paNo);
	
	/**
	 * 진료실 별 접수한 대기 환자 조회
	 * @param officeCd
	 * @return
	 */
	public List<WaitListVO> retrieveWaitList(String officeCd);
	
	/**
	 * 입원 가능한 환자 조회
	 * @param operTf
	 * @return
	 */
	public List<SelectOperationListVO> retrieveOperationList(String operTf);
	
	/**
	 * SMS 문구 등록
	 * @param smsCont
	 * @return
	 */
	public int createSms(SmsVO smsVO);
	
	/**
	 * SMS 문구 수정
	 * @param smsVO
	 * @return
	 */
	public int modifySms(SmsVO smsVO);
	
	
	/**
	 * SMS 문구 삭제
	 * @param sttCd
	 * @return
	 */
	public int removeSms(SmsVO smsVO);
	
	/**
	 * SMS 문구 조회 리스트
	 * @param smsVO
	 * @return
	 */
	public List<SmsVO> retrieveSmsList();
	
	/**
	 * 입원 등록
	 * @param wardRegistVO
	 * @return
	 */
	public int createWardRegist(WardRegistVO wardRegistVO);
	
	/**
	 * 등록된 입원환자 리스트
	 * @return
	 */
	public List<WardRegistVO> retrieveWardRegistedList();
	
	/**
	 * 퇴원 가능한 환자 리스트
	 * @return
	 */
	public List<OutHospitalizationVO> retrieveOutHsptList();
	
	/**
	 * 퇴원처리
	 * @param hsptNo
	 * @return
	 */
	public int modifyCancleHspt(Integer hsptNo);
	
	
	/**
	 * 입원 취소
	 * @param hsptNo
	 * @return
	 */
	public int removeHsptList(Integer hsptNo);
}






























