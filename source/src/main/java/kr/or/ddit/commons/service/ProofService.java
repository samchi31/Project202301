package kr.or.ddit.commons.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.PrescriptionVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.receiption.vo.ReceiptionVO;

public interface ProofService {
	
	/** 환자검색
	 * @param map
	 * @return
	 */
	public List<ReceiptionVO> searchPatientList(Map<String, String> map);

	/**
	 * 진료차트 검색
	 * @param map
	 * @return List<TrmChartVO>
	 */
	public List<TrmChartVO> retrieveTrmChart(Map<String, String> map);

	/**
	 * 진료차트코드를 통해 진료차트 조회
	 * @param trmCd
	 * @return TrmChartVO
	 */
	public List<TrmChartVO> retrieveProof(String trmCd);

	/**
	 * 진료차트코드를 통해 처방내역 조회
	 * @param trmCd
	 * @return List<PrescriptionVO>
	 */
	public List<PrescriptionVO> retrievePrescription(String trmCd);
	
	
}
