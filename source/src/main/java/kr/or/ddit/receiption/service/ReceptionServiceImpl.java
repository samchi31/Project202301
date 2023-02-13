package kr.or.ddit.receiption.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.receiption.dao.ReceiptionDAO;
import kr.or.ddit.receiption.vo.ReceiptionVO;

@Service
public class ReceptionServiceImpl implements ReceptionService {

	@Inject
	ReceiptionDAO DAO;

	@Override
	public List<ReceiptionVO> searchPatientList(Map<String, String> map) {
			List<ReceiptionVO> seekReceptionList = DAO.seekReceptionList(map);
		return seekReceptionList;
	}

	@Override
	public int createReceiption(ReceiptionVO receiptionVO) {
		int rowcnt = DAO.insertReceiption(receiptionVO);
		return rowcnt;
	}
	
	
	
	

}
