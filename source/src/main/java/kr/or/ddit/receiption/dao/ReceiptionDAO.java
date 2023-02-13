package kr.or.ddit.receiption.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.ReceptionVO;
import kr.or.ddit.receiption.vo.ReceiptionVO;

@Mapper
public interface ReceiptionDAO {
	public int insertReceiption(ReceiptionVO receiptionVO);
	
	public ReceptionVO selectReceiption(int rcpNo);
	
	public List<ReceptionVO> selectReceptionList(ReceptionVO reception);
	
	public void updateReception(ReceptionVO reception);
	
	public int deleteReception(int rcpNo);
	
	public List<ReceiptionVO> seekReceptionList(Map<String, String> map);
	

}
