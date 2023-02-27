package kr.or.ddit.commons.service;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.AbstractTestCase;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.enumpkg.ServiceResult;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class PatientServiceImplTest extends AbstractTestCase{

	@Inject
	private PatientService service;
	
	PatientVO vo = new PatientVO();
	
	@Before
	public void setUp() throws Exception {
//		vo.setPaNo(102);
		vo.setPaName("테스트");
//		vo.setPaReg(1);
		vo.setPaHp("010");
//		vo.setPaPrn("0");
		vo.setPaZip(1);
		vo.setPaAdd1("집");
		vo.setPaAdd2("집");
//		vo.setPaPiyn("1");
	}

	@Test
	public void testCreatePatient() {
		ServiceResult result = service.createPatient(vo);
		log.info("{}",result);
	}

	@Test
	public void testRetrievePatientList() {
		fail("Not yet implemented");
	}

	@Test
	public void testRetrievePatient() {
		vo = service.retrievePatient(1);
		log.info("{}",vo);
	}

	@Test
	public void testModifyPatient() {
		ServiceResult result = service.modifyPatient(vo);
		log.info("{}",result);
	}

	@Test
	public void testRemovePatient() {
		fail("Not yet implemented");
	}

}
