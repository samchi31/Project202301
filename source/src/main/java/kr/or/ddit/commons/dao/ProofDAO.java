package kr.or.ddit.commons.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.PrescriptionVO;
import kr.or.ddit.commons.vo.TrmChartVO;

@Mapper
public interface ProofDAO {

	public List<TrmChartVO> selectTrmChart(Map<String, String> map);

	public List<TrmChartVO> selectProof(String trmCd);

	public List<PrescriptionVO> selectPrescription(String trmCd);

}
