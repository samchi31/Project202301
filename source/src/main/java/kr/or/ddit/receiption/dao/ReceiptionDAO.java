package kr.or.ddit.receiption.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.ReceptionVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.receiption.vo.ReadRegistVO;
import kr.or.ddit.receiption.vo.ReceiptionVO;
import kr.or.ddit.receiption.vo.RegistVO;
import kr.or.ddit.receiption.vo.SelectPatientVO;
import kr.or.ddit.receiption.vo.SmsVO;
import kr.or.ddit.receiption.vo.WaitListVO;
import kr.or.ddit.receiption.vo.SelectOperationListVO;

@Mapper
public interface ReceiptionDAO {
	
	
	/**
	 * 접수 등록
	 * @param registVO
	 * @return
	 */
	public int insertReceiption(RegistVO registVO);
	
	/**
	 * 진료 후 환자의 대기 상태 변경
	 * @param waitHistoryVO
	 * @return
	 */
	public int insertWaitHistory();
	
	/**
	 * 접수 상세
	 * @param rcpNo
	 * @return
	 */
	public ReceptionVO selectReceiption(int rcpNo);
	
	/**
	 * 접수 목록
	 * @param reception
	 * @return
	 */
	public List<ReceptionVO> selectReceptionList(ReceptionVO reception);
	
	/**
	 * 접수 수정
	 * @param reception
	 */
	public void updateReception(ReceptionVO reception);
	
	/**
	 * 접수 취소, 삭제
	 * @param rcpNo
	 * @return
	 */
	public int deleteReception(int rcpNo);
	
	/**
	 * 접수 등록을 위한 환자 검색
	 * @param map
	 * @return
	 */
	public List<ReceiptionVO> seekReceptionList(Map<String, String> map);
	
	/**
	 * 새로운 환자 등록
	 * @param patientVO
	 * @return
	 */
	public int insertPatient(PatientVO patientVO);
	
	/**
	 * 등록된 최신환자 검색
	 * @param selectPatientVO
	 * @return
	 */
	public SelectPatientVO selectPatient();
	
	/**
	 * 접수조회
	 * @param readRegistVO
	 * @return
	 */
	public ReadRegistVO selectRegistVO(String paNo);
	
	/**
	 * 진료실 별 접수한 환자 조회
	 * @param officeCd
	 * @return
	 */
	public List<WaitListVO> selectWaitList(String officeCd);
	
	/**
	 * 입원 가능 환자 조회
	 * @param operTf
	 * @return
	 */
	public List<SelectOperationListVO> selectOperationList(String operTf);
	
	/**
	 * SMS 문구 등록
	 * @param smsCont
	 * @return
	 */
	public int insertSms(String smsCont);
	
	/**
	 * SMS 문구 수정
	 * @param smsVO
	 * @return
	 */
	public int updateSms(SmsVO smsVO);

	/**
	 * SMS 문구 삭제
	 * @param sttCd
	 * @return
	 */
	public int deleteSms(String sttCd);
	
	/**
	 * SMS 문구 조회리스트
	 * @return
	 */
	public List<SmsVO> selectSmsList();
}
