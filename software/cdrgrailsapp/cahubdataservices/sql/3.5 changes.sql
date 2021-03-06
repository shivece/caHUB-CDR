
select * from user_sequences where sequence_name like '%PROTOCOL%'
select max(id) from st_protocol

select count(*) from ldacc_donor

/* Drop unique constraint on protocol.name */
SELECT uc.constraint_name, ucc1.table_name, ucc1.column_name, uc.constraint_type
from user_constraints uc,
user_cons_columns ucc1
WHERE uc.constraint_name = ucc1.constraint_name
and uc.table_name = 'ST_PROTOCOL'

alter table ST_PROTOCOL
drop constraint SYS_C0073811 cascade; 

select * from st_bss

/* Update protocol_site_num for UNM and Vanderbilt */
update st_bss
set protocol_site_num = 'UNM 11-279'
where code = 'UNM';
update st_bss
set protocol_site_num = 'VUMC 110753'
where code = 'VUMC';

commit;

SELECT uc.constraint_name, ucc1.table_name, ucc1.column_name, uc.constraint_type
from user_constraints uc,
user_cons_columns ucc1
WHERE uc.constraint_name = ucc1.constraint_name
and uc.table_name = 'DR_SPECIMEN' and ucc1.column_name = 'IN_QUARANTINE'

/* Make quarantine nullable */
alter table DR_SPECIMEN modify in_quarantine null;

select count(*) from user_tables;

select  'drop table '||table_name||' cascade constraints;' as cmd 
from user_tables  
where (table_name like 'BPV%' 
         and
         table_name not in ('BPV_BLOOD_FORM', 'BPV_TISSUE_FORM')) 
       or
       table_name like 'ST_FORM_METADATA%' OR
       table_name like 'ST_SOP'

/* drop table prc_tumor_form and prc_histologic_Type*/

/* table may not exist in PROD */
SELECT uc.constraint_name, ucc1.table_name, ucc1.column_name, uc.constraint_type
from user_constraints uc,
user_cons_columns ucc1
WHERE uc.constraint_name = ucc1.constraint_name
and uc.table_name = 'BPV_LOCAL_PATH_REVIEW'

alter table dr_slide drop column BPV_PATH_REVIEW_BSS_ID
alter table dr_slide drop column BPV_PATH_REVIEW_OBBR_ID
commit;

select count(*) from dr_specimen;

select count(*) from ldacc_donor;

select count(*) from ldacc_specimen;

� Add/modify columns
alter table DR_SLIDE modify specimen_record_id null;

/* table may not exist in PROD */
alter table BPV_SLIDE_PREP modify parent_specimen_id null;

select id, version, code, description, name, value, big_value from st_appsetting where code = 'HISTO_OVARY'
                                      C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,OTHER
update st_appsetting set BIG_VALUE = 'C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21,C22,OTHER' where code = 'HISTO_OVARY'
commit;

select * from bpv_local_path_review

select * from st_appsetting where code in ('BPV_ACTIVE_FIXATIVE_LIST',  'BRN_ACTIVE_FIXATIVE_LIST',  'BPV_ACTIVE_CONTAINER_LIST', 'BRN_ACTIVE_CONTAINER_LIST')

alter table BPV_TISSUE_GROSS_EVALUATION modify ROOM_HUMIDITY null;
alter table BPV_TISSUE_GROSS_EVALUATION modify CONTENT_PERCENTAGE null;
alter table BPV_TISSUE_GROSS_EVALUATION modify AREA_PERCENTAGE null;

select * from st_appsetting where code='FILE_UPLOAD_ALERT_EMAIL'
update st_appsetting set value='ncicahubdev@mail.nih.gov' where code='FILE_UPLOAD_ALERT_EMAIL';
commit;

select * from dr_case where study_id = 2

select * from st_study
