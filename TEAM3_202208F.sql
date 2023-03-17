create sequence SEQ_TRM_CHART;

--#{memId,jdbcType=VARCHAR}
SELECT ', #{' || SNAKETOCAMEL(COLUMN_NAME) ||',jdbcType=' ||
    CASE
        WHEN DATA_TYPE = 'VARCHAR2' THEN 'VARCHAR'
        WHEN DATA_TYPE = 'NUMBER' THEN 'NUMERIC'
        ELSE DATA_TYPE
    END || '}'
FROM COLS
WHERE TABLE_NAME = 'RECEIVE_DETAIL';

INSERT INTO symptom_history (
    trm_cd,
    sym_cd
) VALUES (
    
    
);
INSERT INTO diagnosis_history (
    icd,
    icd_name,
    trm_cd,
    oper_tf,
    physiotherapy_tf
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3,
    :v4
);

INSERT INTO prescription_history (
    trm_cd,
    pre_cd,
    pre_detail,
    pre_nt,
    pre_total,
    price,
    injc_pth_nm,
    unit,
    pay_tp_nm
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3,
    :v4,
    :v5,
    :v6,
    :v7,
    :v8
);

SELECT  'private '||
    DECODE( DATA_TYPE , 'NUMBER', 'Integer ', 'String ') ||
    LOWER(SUBSTR(COLUMN_NAME, 1, 1)) ||
    SUBSTR( REPLACE( INITCAP(COLUMN_NAME) , '_', ''), 2) || ';'
FROM COLS
WHERE TABLE_NAME = 'SYMPTOM_GO';

drop table RADIOLOGY_RESULT;

INSERT INTO film_order (
    trm_cd,
    film_cd,
    film_date
) VALUES (
    :v0,
    :v1,
    :v2
);

INSERT INTO waiting_history (
    wait_no,
    rcp_no,
    wait_dt,
    wait_num,
    waitst_cd,
    div_cd
) VALUES (
    
);

create sequence SEQ_WAITING_HISTORY;

INSERT INTO waiting_history (
    wait_no,
    rcp_no,
    wait_dt,
    wait_num,
    waitst_cd,
    div_cd
) VALUES (
    SEQ_WAITING_HISTORY.Nextval,
    , :v1
    , :v2
    , (select nvl(max(wait_num), 0) + 1
        from waiting_history
        where rcp_no = #{})
    , :v4
    , :v5
);

SELECT  DISEASE_CD, EN_NM, KOR_NM
FROM    CLASSIFICATION_DISEASE;

commit;

SELECT
    disease_cd,
    en_nm,
    kor_nm
FROM
    classification_disease;
    

select  office_cd
from    doctor_office
where   emp_no=1;

with  trmChartView as 
(
select  rcp_no
from    trm_chart
where   trm_cd not in ( select  trm_cd
                        from    receive)
)
select  rcp_no, pa_no, rcp_date
from    reception   a
where   office_cd = (select  office_cd
                    from    doctor_office
                    where   emp_no=1)
and     a.rcp_no in (select    rcp_no
                    from    trmChartView
                    where   a.rcp_no = rcp_no);
INSERT INTO diagnosis_history (
    disease_cd,
    icd_name,
    trm_cd,
    oper_tf,
    physiotherapy_tf
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3,
    :v4
);          

ALTER TABLE DIAGNOSIS_HISTORY DROP PRIMARY KEY;
CREATE UNIQUE INDEX DIAG_COMPLEX_KEY ON DIAGNOSIS_HISTORY (TRM_CD,DISEASE_CD);
ALTER TABLE DIAGNOSIS_HISTORY ADD CONSTRAINT DIAGNOSIS_HISTORY PRIMARY KEY (TRM_CD,DISEASE_CD);


INSERT ALL
		  
			INTO diagnosis_history (
			    disease_cd,
			    icd_name,
			    trm_cd,
			    oper_tf,
			    physiotherapy_tf
			) VALUES (
			    'M00'
				, '화농성관절염'
				, 'TC0005'
				, 'N'
				, 'Y'
			)
		 
		SELECT	* FROM DUAL;
SELECT * FROM USER_INDEXES WHERE Index_Name = 'DIAGNOSIS_HISTORY_PK';
DROP INDEX DIAGNOSIS_HISTORY_PK;
rollback;


select  b.trm_cd
from    (
        select  rcp_no
        from    (
                select  rcp_no
                from    reception
                where   pa_no = '3'
                order   by rcp_date)
        where   rownum = 1) a, trm_chart b
where   a.rcp_no = B.Rcp_No;

select *
from    v_trm_chart;

select  *
from    v_waitinglist
where   office_cd = 'DO101';
--and     TO_CHAR(WAIT_DT,'yyyy-mm-dd') = TO_CHAR(SYSDATE,'yyyy-mm-dd');

select  trm_cd, medi_record, trm_dt, emp_no, rcp_no
from    v_trm_chart
where   pa_no = '5'
order   by 3 desc;

select  film_cate, film_nm, emp_nm
from    filmcate inner join employee on (emp_no = emp_no);

with recentReceptionView as
(   select  pa_no, rcp_date, rcp_no
    from    (
                select  pa_no, rcp_date, rcp_no
                from    reception
                where   pa_no = 6
                order   by 2 desc
            )
    where   rownum = 1  )
select  a.*
from    trm_chart a inner join recentReceptionView b on (a.rcp_no = b.rcp_no);

select  *
from    v_realwaitinglist;

create or replace force view v_wait_hist
as
with    waitingView as (
    select  a.wait_no, a.rcp_no, a.wait_dt, a.wait_num
            , b.div_cd, b.div_nm
            , c.waitst_cd, c.waitst_nm
    from    waiting_history a   inner join  division_treat b on(a.div_cd = b.div_cd)
                                inner join  wait_status c on (a.waitst_cd = c.waitst_cd)
    )
select  wv.*
        , r.rcp_date 
        , d.office_cd, d.office_nm, d.emp_no
        , p.pa_no, p.pa_name, p.pa_reg, p.pa_sex, p.pa_hp, p.pa_zip, p.pa_add1, p.pa_add2
from    reception r inner join waitingView wv on (r.rcp_no = wv.rcp_no)
                    inner join patient p    on (r.pa_no = p.pa_no)
                    inner join doctor_office d on (r.office_cd = d.office_cd)
where   p.pa_delete != 1
order   by 1
;

select  *
from    v_wait_hist;

select  rcp_no, max(wait_num)
--        , div_cd, div_nm, waitst_cd, waitst_nm, pa_no, pa_name
from    v_wait_hist
where   emp_no = '1'
--and     to_char(rcp_date,'yyyy-mm-dd') = '2023-02-06'--to_char(sysdate, 'yyyy-mm-dd')
group   by  rcp_no--, div_cd, div_nm, waitst_cd, waitst_nm, pa_no, pa_name
order   by  rcp_no;

with    testView as (
    select  rcp_no, max(wait_num) as wait_num
    from    v_wait_hist
    group   by  rcp_no
)
SELECT  a.rcp_no, a.wait_num, a.pa_no, a.pa_name
FROM    V_WAIT_HIST a   inner join  testView b on(a.rcp_no = b.rcp_no and a.wait_num = b.wait_num)
where   emp_no = 1
--and     to_char(rcp_date,'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd');

SELECT *	FROM DIVISION_TREAT;

WITH    testView AS (
    SELECT  RCP_NO, MAX(WAIT_NUM) AS WAIT_NUM
    FROM    V_WAIT_HIST
    GROUP   BY  RCP_NO	)
SELECT  A.RCP_NO, A.WAIT_NUM, A.PA_NO, A.PA_NAME, A.DIV_CD, A.DIV_NM, A.WAITST_CD, A.WAITST_NM
FROM    V_WAIT_HIST A   INNER JOIN  testView B ON(A.RCP_NO = B.RCP_NO AND A.WAIT_NUM = B.WAIT_NUM)
WHERE   EMP_NO = 1
AND     TO_CHAR(RCP_DATE,'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD');

SELECT  TRM_CD, MEDI_RECORD, to_char(TRM_DT,'YYYY/MM/DD') as TRM_DT, EMP_NO, RCP_NO
FROM    V_TRM_CHART
WHERE   PA_NO = 8
ORDER   BY 3 DESC;

with trmChartView as    (
SELECT  A.*
FROM    TRM_CHART A INNER JOIN RECEPTION B ON (A.RCP_NO = B.RCP_NO)
WHERE   B.RCP_NO = 202302062    
)
select  t.trm_cd, t.medi_record, to_char(t.trm_dt, 'YYYY/MM/DD') as trm_dt, t.emp_no, t.rcp_no
        , b.*
        , c.*
        , d.*
        , e.*
from    trmChartView t  
        left outer join diagnosis_history b  on (t.trm_cd = b.trm_cd)
        left outer join symptom_history c on (t.trm_cd = c.trm_cd)
        left outer join prescription_history d on (t.trm_cd = d.trm_cd)
        left outer join film_order e on (t.trm_cd = e.trm_cd)
;

select  a.trm_cd, b.*
from    trm_chart a  left outer join diagnosis_history b on (a.trm_cd = b.trm_cd)
where   a.rcp_no = 6;

select  a.trm_cd, b.*
from    trm_chart a  left outer join symptom_history b on (a.trm_cd = b.trm_cd)
where   a.rcp_no = 6;

select  a.trm_cd, b.*
from    trm_chart a  left outer join prescription_history b on (a.trm_cd = b.trm_cd)
where   a.rcp_no = 6;

select  a.trm_cd, b.*
from    trm_chart a  left outer join film_order b on (a.trm_cd = b.trm_cd)
where   a.rcp_no = 6;

SELECT  A.*
FROM    TRM_CHART A INNER JOIN RECEPTION B ON (A.RCP_NO = B.RCP_NO)
WHERE   A.RCP_NO = 6;

INSERT INTO waiting_history (
    wait_no,
    rcp_no,
    wait_dt,
    wait_num,
    waitst_cd,
    div_cd
) VALUES (
    SEQ_WAITING_HISTORY.Nextval
    , 202302131
    , SYSDATE
    , (select nvl(max(wait_num), 0) + 1
        from waiting_history
        where rcp_no = 202302131)
    , 'WS002'
    , 'DV005'
);

INSERT INTO waiting_history (
    wait_no,
    rcp_no,
    wait_dt,
    wait_num,
    waitst_cd,
    div_cd
) 
SELECT  SEQ_WAITING_HISTORY.Nextval
        , 202302131
        , SYSDATE
        , snum
        , 'WS001'
        , 'DV001'
from    (select nvl(max(wait_num), 0) + 1 as snum
        from    waiting_history
        where   rcp_no = 202302131);
commit;
        
WITH testView AS ( SELECT RCP_NO, MAX(WAIT_NUM) AS WAIT_NUM FROM V_WAIT_HIST GROUP BY RCP_NO 
) SELECT A.RCP_NO, A.WAIT_NUM, A.PA_NO, A.PA_NAME, A.DIV_CD, A.DIV_NM, A.WAITST_CD, A.WAITST_NM 
FROM V_WAIT_HIST A INNER JOIN testView B ON(A.RCP_NO = B.RCP_NO AND A.WAIT_NUM = B.WAIT_NUM) 
WHERE EMP_NO = 1 AND TO_CHAR(RCP_DATE,'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD');


SELECT TRM_CD, MEDI_RECORD, to_char(TRM_DT,'YYYY/MM/DD') as TRM_DT, EMP_NO, RCP_NO FROM V_TRM_CHART 
WHERE PA_NO = 8 ORDER BY 3 DESC;

WITH trmChartView AS    (
		SELECT  A.*
		FROM    TRM_CHART A INNER JOIN RECEPTION B ON (A.RCP_NO = B.RCP_NO)
		WHERE   B.RCP_NO = 202302112    
		)
		SELECT  T.TRM_CD AS TRM_CODE, T.MEDI_RECORD, TO_CHAR(T.TRM_DT, 'YYYY/MM/DD') AS TRM_DT, T.EMP_NO, T.RCP_NO
		        , B.*
		        , C.*
		        , D.*
		        , E.*
		FROM    TRMCHARTVIEW T  
		        LEFT OUTER JOIN DIAGNOSIS_HISTORY B  ON (T.TRM_CD = B.TRM_CD)
		        LEFT OUTER JOIN SYMPTOM_HISTORY C ON (T.TRM_CD = C.TRM_CD)
		        LEFT OUTER JOIN PRESCRIPTION_HISTORY D ON (T.TRM_CD = D.TRM_CD)
		        LEFT OUTER JOIN FILM_ORDER E ON (T.TRM_CD = E.TRM_CD);
                
SELECT  TRM_CD, MEDI_RECORD, to_char(TRM_DT,'YYYY/MM/DD') as TRM_DT, EMP_NO, RCP_NO
		FROM    V_TRM_CHART
		WHERE   PA_NO = 14
		ORDER   BY 3 DESC;
                
UPDATE  trm_chart
SET     a = b
WHERE   trm_cd =:v0
AND     medi_record =:v1
AND   trm_dt =:v2
AND   emp_no =:v3
AND   rcp_no =:v4;

DELETE FROM symptom_history
WHERE
    trm_cd =:v0
    AND   sym_cd =:v1
    AND   sym_detail =:v2;
    
WITH trmChartView AS 
( SELECT A.* FROM TRM_CHART A INNER JOIN RECEPTION B ON (A.RCP_NO = B.RCP_NO) 
WHERE B.RCP_NO = 202302131 ) 
SELECT T.TRM_CD AS TRM_CODE, T.MEDI_RECORD, TO_CHAR(T.TRM_DT, 
'YYYY/MM/DD') AS TRM_DT, T.EMP_NO, T.RCP_NO 
--, B.* 
, C.* 
--, D.* 
--, E.* 
FROM TRMCHARTVIEW T 
--LEFT OUTER JOIN DIAGNOSIS_HISTORY B ON (T.TRM_CD = B.TRM_CD) 
LEFT OUTER JOIN SYMPTOM_HISTORY C ON (T.TRM_CD = C.TRM_CD) 
--LEFT OUTER JOIN PRESCRIPTION_HISTORY D ON (T.TRM_CD = D.TRM_CD) 
--LEFT OUTER JOIN FILM_ORDER E ON (T.TRM_CD = E.TRM_CD);

create sequence SEQ_RECEIVE;

INSERT INTO patient (
    PA_NO
    , PA_NAME
    , PA_REG
    , PA_HP
    , PA_ZIP
    , PA_ADD1
    , PA_ADD2
    , PA_SEX
) VALUES (
    'P'||LPAD(SEQ_PATIENT.NEXTVAL, 4, '0')
    , '김은대'
    , 970102
    , '010-2023-0214'
    , 10302
    , '대전시 오류동'
    , '대덕인재개발원 305호'
    , 'F'
);

commit;
INSERT INTO reception (
    rcp_no,
    pa_no,
    rcp_date,
    office_cd
) VALUES (
    'RCP'||LPAD(SEQ_RCP_RCPNO.NEXTVAL, 4, '0'),
    'P0024',
    sysdate,
    'DO101'
);

rollback;

INSERT INTO waiting_history (
    wait_no,
    rcp_no,
    wait_dt,
    wait_num,
    waitst_cd,
    div_cd
) VALUES (
    SEQ_WAITING_HISTORY.nextval,
    :v1,
    :v2,
    :v3,
    :v4,
    :v5
);

INSERT INTO waiting_history (
    wait_no,
    rcp_no,
    wait_dt,
    wait_num,
    waitst_cd,
    div_cd
) 
SELECT  SEQ_WAITING_HISTORY.Nextval
        , 'RCP0037'
        , SYSDATE
        , SNUM
        , 'WS001'
        , 'DV001'
FROM    (
        SELECT nvl(max(wait_num), 0)+1 as SNUM
        FROM    waiting_history
        WHERE   rcp_no = 'RCP0037'	);
commit;


INSERT INTO waiting_history (
    wait_no,
    rcp_no,
    wait_dt,
    wait_num,
    waitst_cd,
    div_cd
) 
SELECT  SEQ_WAITING_HISTORY.Nextval
        , 'RCP0049'
        , SYSDATE
        , SNUM
        , 'WS001'
        , 'DV001'
FROM    (
        SELECT nvl(max(wait_num), 0)+1 as SNUM
        FROM    waiting_history
        WHERE   rcp_no = 'RCP0049'	);
        
commit;

SELECT  SEQ_WAITING_HISTORY.Nextval from dual;
--<tr>
--		<th>회원아이디</th>
--		<td>${member.memId }</td>
--	</tr>

SELECT '<tr><th>' || COMMENTS ||'</th>' ||
    '<td>${' || LOWER(TABLE_NAME) || '.' ||
    SNAKETOCAMEL(COLUMN_NAME) || '}</td></tr>'
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TRM_CHART';

WITH trmChartView AS    (
    SELECT  A.TRM_CD, A.TRM_DT, A.MEDI_RECORD, A.EMP_NO, A.RCP_NO
            , C.EMP_NM
    FROM    TRM_CHART A INNER JOIN RECEPTION B ON (A.RCP_NO = B.RCP_NO)
                        INNER JOIN EMPLOYEE C ON (A.EMP_NO = C.EMP_NO)
    WHERE   B.RCP_NO = 'RCP0032'   
)
SELECT  T.TRM_CD AS TRM_CODE, T.MEDI_RECORD, TO_CHAR(T.TRM_DT, 'YYYY/MM/DD') AS TRM_DT, T.EMP_NO, T.RCP_NO, T.EMP_NM
        , B.DISEASE_CD, B.ICD_NAME, B.OPER_TF, B.PHYSIOTHERAPY_TF
        , C.SYM_CD, C.SYM_DETAIL
        , D.PRE_CD, D.PRE_DETAIL, D.PRE_NT, D.PRE_TOTAL, D.PRICE, D.INJC_PTH_NM, D.UNIT, D.PAY_TP_NM
        , E.FILM_CD, E.FILM_DATE
        , F.PD_NO, F.PD_DT, F.PD_CONT
FROM    TRMCHARTVIEW T  
        LEFT OUTER JOIN DIAGNOSIS_HISTORY B  ON (T.TRM_CD = B.TRM_CD)
        LEFT OUTER JOIN SYMPTOM_HISTORY C ON (T.TRM_CD = C.TRM_CD)
        LEFT OUTER JOIN PRESCRIPTION_HISTORY D ON (T.TRM_CD = D.TRM_CD)
        LEFT OUTER JOIN FILM_ORDER E ON (T.TRM_CD = E.TRM_CD)
        LEFT OUTER JOIN PT_DOCUMENT F ON (T.TRM_CD = F.TRM_CD)
--WHERE   T.TRM_CD NOT IN (
--        SELECT  TRM_CD
--        FROM    RECEIVE
--)
;

SELECT  T.go_cd, T.go_ko,
		        B.icd, B.icd_name, B.icd_eng,
		        C.pre_cd, C.pre_detail, C.injc_pth_nm, C.unit, C.pay_tp_nm,
		        D.sym_cd, D.sym_detail
		FROM    GROUP_ORDER T   LEFT OUTER JOIN DISEASE_GO B  ON (T.GO_CD = B.GO_CD)
		                        LEFT OUTER JOIN PRESCRIPTION_GO C ON (T.GO_CD = C.GO_CD)
		                        LEFT OUTER JOIN SYMPTOM_GO D ON (T.GO_CD = D.GO_CD)
		WHERE	T.go_cd = 'G_T_01';

insert into reception(
    RCP_NO
    , PA_NO
    , RCP_DATE
    , OFFICE_CD
)
values(
    'RCP'||LPAD(SEQ_RCP_RCPNO.NEXTVAL, 4, '0')
    , 'P0024'
    , TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    , 'DO101'
);

INSERT INTO waiting_history (
    wait_no,
    rcp_no,
    wait_dt,
    wait_num,
    waitst_cd,
    div_cd
) 
SELECT  SEQ_WAITING_HISTORY.Nextval
        , (select a.RCP_NO
            from(
            select rownum as rnum, RCP_NO, RCP_DATE
            from RECEPTION
            order by RCP_NO desc)a
            where rnum = 1)
        , TO_CHAR(SYSDATE, 'YYYY-MM-DD')
        , SNUM
        , 'WS001'
        , 'DV001'
FROM    (
        SELECT nvl(max(wait_num), 0)+1 as SNUM
        FROM    waiting_history
        WHERE   rcp_no = (select a.RCP_NO
            from(
            select rownum as rnum, RCP_NO, RCP_DATE
            from RECEPTION
            order by RCP_NO desc)a
            where rnum = 1)	);
            
--ALTER USER in89 IDENTIFIED BY java;
--commit;

WITH    testView AS (
    SELECT  RCP_NO, MAX(WAIT_NUM) AS WAIT_NUM
    FROM    V_WAIT_HIST
    GROUP   BY  RCP_NO	)
SELECT  A.RCP_NO, A.WAIT_NUM, A.PA_NO, A.PA_NAME, A.DIV_CD, A.DIV_NM, A.WAITST_CD, A.WAITST_NM
FROM    V_WAIT_HIST A   INNER JOIN  testView B ON(A.RCP_NO = B.RCP_NO AND A.WAIT_NUM = B.WAIT_NUM)
WHERE   A.WAITST_CD = 'WS003';

--CREATE TABLE "PERSISTENT_LOGINS" 
--   (	"USERNAME" VARCHAR2(64 BYTE), 
--	"SERIES" VARCHAR2(64 BYTE), 
--	"TOKEN" VARCHAR2(64 BYTE), 
--	"LAST_USED" TIMESTAMP (6)
--   ) SEGMENT CREATION IMMEDIATE 
--  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
--  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
--  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
--  TABLESPACE "SYSTEM" ;
--REM INSERTING into PERSISTENT_LOGINS
--SET DEFINE OFF;
----------------------------------------------------------
----  DDL for Index SYS_C008639
----------------------------------------------------------
--
--  CREATE UNIQUE INDEX "SYS_C008639" ON "PERSISTENT_LOGINS" ("SERIES") 
--  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
--  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
--  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
--  TABLESPACE "SYSTEM" ;
----------------------------------------------------------
----  Constraints for Table PERSISTENT_LOGINS
----------------------------------------------------------
--
--  ALTER TABLE "PERSISTENT_LOGINS" MODIFY ("USERNAME" NOT NULL ENABLE);
--  ALTER TABLE "PERSISTENT_LOGINS" MODIFY ("TOKEN" NOT NULL ENABLE);
--  ALTER TABLE "PERSISTENT_LOGINS" MODIFY ("LAST_USED" NOT NULL ENABLE);
--  ALTER TABLE "PERSISTENT_LOGINS" ADD PRIMARY KEY ("SERIES")
--  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
--  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
--  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
--  TABLESPACE "SYSTEM"  ENABLE;

select  a.FIAT_CD, a.ATT_SAVENAME, b.TRM_CD
from    film_atch_detail a inner join  film_atch b on (a.FIAT_CD = b.FIAT_CD)
where   b.TRM_CD = 'TC0241';



