package kr.or.ddit.nurse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.HospitalizationVO;
import kr.or.ddit.commons.vo.IntakeOutputVO;
import kr.or.ddit.commons.vo.IntakeVO;
import kr.or.ddit.commons.vo.VitalVO;
import kr.or.ddit.nurse.vo.IntakeCategoryVO;
import kr.or.ddit.nurse.vo.NrecVO;
import kr.or.ddit.nurse.vo.OutputCategoryVO;
import kr.or.ddit.nurse.vo.WardVO;

/**
 * 
 * <pre>
 * 병실관리 화면을 위한 Persistence Layer
 * </pre>
 * @author 작성자명
 * @since 2023. 2. 7.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자                          수정내용
 * --------        --------    ----------------------
 * 2023. 2. 7.      위대현                           최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface WardDAO {
	public List<WardVO> selectWardPatientList();
	
	public WardVO selectWardPatien(int hsptNo);
	
	public int insertNrec(NrecVO nrec);
	
	public List<NrecVO> selectNrecList(int hsptNo);
	
	public int insertVital(VitalVO vital);
	
	public List<HospitalizationVO> selectVitalList(int hsptNo);

	public int countIoList(IntakeOutputVO io);

	public int createIO(IntakeOutputVO io);

	public List<IntakeOutputVO> selectIoList(IntakeOutputVO io);

	public int insertIntake(IntakeVO intake);

	public List<IntakeCategoryVO> selectIntakeCategory();

	public List<OutputCategoryVO> selectOutputCategory();
}
