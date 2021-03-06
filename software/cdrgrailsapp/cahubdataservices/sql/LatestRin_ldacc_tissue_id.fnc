create or replace function LatestRin_ldacc_tissue_id(Lspec_ID varchar2) return varchar2 is
  Result varchar2(15);
  runDate1 date;
  runDate2 date;
  rinNumber1 varchar2(15);
  rinNumber2 varchar2(15);
  problemFound varchar2(5);
  latestRinValue varchar2(15);
  latestRunDate date;
/*
   cursor v_dr_specimen (Spec_ID varchar2) is
     select spec.id, spec.specimen_id, spec.tissue_type_id
       from dr_specimen   spec
      where spec.specimen_id = Spec_ID
      ;
*/
   cursor v_ldacc_specimen (Spec_rec_ID varchar2) is
     select lspec.id, lspec.specimen_record_id
       from ldacc_specimen   lspec
      where lspec.id = Spec_rec_ID
      ;

   cursor v_ldacc_qc (lpec_rec_ID varchar2) is
     select lq.id, lq.specimen_id, lq.date_run
       from ldacc_qc    lq
      where lq.specimen_id = lpec_rec_ID
      order by lq.date_run desc
      ;

   cursor v_ldacc_qc_result (lpec_qc_ID varchar2) is
     select lr.id, lr.attribute, lr.qc_id, lr.value
       from ldacc_qc_result    lr
      where lr.qc_id = lpec_qc_ID
      ;
/*
   cursor v_st_acquis_type (t_ID number) is
     select tissue.code, tissue.name
       from st_acquis_type   tissue
      where tissue.id = t_ID
      ;
*/
begin
  Result := 'logic problem!' ;
  latestRunDate := to_date('01/01/1900', 'MM/DD/YYYY');
  problemFound := 'false';
  
      for lspec_rec in v_ldacc_specimen(Lspec_ID)
        loop
          
          for lspec_qc_rec in v_ldacc_qc(lspec_rec.id)
            loop
              for qc_res_rec in v_ldacc_qc_result(lspec_qc_rec.id)
                loop
                  if (qc_res_rec.attribute = 'RIN Number') then
                    if (lspec_qc_rec.date_run >= latestRunDate) then
                      runDate1 := lspec_qc_rec.date_run ;
                      rinNumber1 := qc_res_rec.value ;
                      latestRunDate := lspec_qc_rec.date_run ;
                      latestRinValue := rinNumber1 ;
                      if (runDate1 = runDate2) then
                        if (rinNumber2 != qc_res_rec.value) then
                          Result := '99999' ;
                          problemFound := 'true' ;
                        end if;
                      elsif (runDate2 > runDate1) then
                        /* This should never happen */
                        latestRinValue := rinNumber1 ;
                        latestRunDate  := runDate1 ;
                      else
                        rinNumber2 := rinNumber1 ;
                        runDate2 := runDate1 ;
                      end if;
                    end if;
                  end if;
                end loop;
            end loop;
         end loop;
      
  if (problemFound = 'true') then
    Result := '99999' ;
  else
    Result := latestRinValue ;
  end if;
  if (instr(Result,'-') > 0) then
    case Result /* for efficiency these are ordered with the most frequent-occurring values first */
      when '2-3'  then Result := 2.5 ;
      when '7-8'  then Result := 7.5 ;
      when '5-6'  then Result := 5.5 ;
      when '1-2'  then Result := 1.5 ;
      when '6-7'  then Result := 6.5 ;
      when '3-4'  then Result := 3.5 ;
      when '8-9'  then Result := 8.5 ;
      when '4-5'  then Result := 4.5 ;
      when '9-10' then Result := 9.5 ;
      when '0-1'  then Result := 0.5 ;
    /* else Result := Result ; */
    end case;
  end if;
  return(Result);
  EXCEPTION
      WHEN CASE_NOT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected Result: ' || Result);
end LatestRin_ldacc_tissue_id;
/
