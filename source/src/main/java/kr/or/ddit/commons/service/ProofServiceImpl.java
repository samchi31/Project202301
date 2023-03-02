package kr.or.ddit.commons.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.dao.ProofDAO;
import kr.or.ddit.commons.vo.PrescriptionVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.receiption.dao.ReceiptionDAO;
import kr.or.ddit.receiption.vo.ReceiptionVO;

@Service
public class ProofServiceImpl implements ProofService {

	@Inject
	private ReceiptionDAO DAO;
	
	@Inject
	private ProofDAO proofDAO;
	
	@Override
	public List<ReceiptionVO> searchPatientList(Map<String, String> map) {
			List<ReceiptionVO> seekReceptionList = DAO.seekReceptionList(map);
		return seekReceptionList;
	}

	@Override
	public List<TrmChartVO> retrieveTrmChart(Map<String, String> map) {
		return proofDAO.selectTrmChart(map);
	}

	@Override
	public List<TrmChartVO> retrieveProof(String trmCd) {
		return proofDAO.selectProof(trmCd);
	}

	@Override
	public List<PrescriptionVO> retrievePrescription(String trmCd) {
		return proofDAO.selectPrescription(trmCd);
	}

}
