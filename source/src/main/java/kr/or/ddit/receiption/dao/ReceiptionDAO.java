package kr.or.ddit.receiption.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.ReceptionVO;

@Mapper
public interface ReceiptionDAO {
	public int insertReceiption(ReceptionVO reception);
	public ReceptionVO selectReceiption(int rcpNo);
	public List<ReceptionVO> selectReceptionList(ReceptionVO reception);
	public void updateReception(ReceptionVO reception);
	public int deletereception(int rcpNo);
}
