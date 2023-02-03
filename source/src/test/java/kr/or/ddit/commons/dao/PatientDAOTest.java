package kr.or.ddit.commons.dao;

import static org.junit.Assert.fail;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.AbstractTestCase;
import kr.or.ddit.commons.vo.PatientVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class PatientDAOTest extends AbstractTestCase{

	@Inject
	public PatientDAO patientDAO;
	
	@Before
	public void setUp() throws Exception {
		PatientVO pavo = new PatientVO();
		pavo.setPaNo(1);
		pavo.setPaName("테스트");
	}
	
	@Test
	public void test() {
		log.info("주입된 객체:{}", patientDAO);
	}

	@Test
	public void testSelectTotalRecord() {
		
	}

	@Test
	public void testInsertPatient() {
		
	}

	@Test
	public void testSelectPatientList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectPatient() {
		
	}

	@Test
	public void testUpdatePatient() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeletePatient() {
		fail("Not yet implemented");
	}

}
