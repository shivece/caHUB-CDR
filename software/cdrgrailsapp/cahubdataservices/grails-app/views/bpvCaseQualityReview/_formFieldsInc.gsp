<script type="text/javascript">
    $(document).ready(function() {
        $('#wasStopped_yes').change(function() {
            $('#reasonStoppedRow').show()
        });

        $('#wasStopped_no').change(function() {
            $('#reasonStoppedRow').hide()
            $('#reasonStopped').val('')
            $('#otherReasonRow').hide()
            $('#otherReason').val('')
        });
        
        $('#reasonStopped').change(function() {
            if ($('#reasonStopped').val() == 'Other, specify') {
                $('#otherReasonRow').show()
            } else {
                $('#otherReasonRow').hide()
                $('#otherReason').val('')
            }
        });
        
        
        $('#slideReview_yes').change(function() {           
                $('#6b').show()
                $('#Q7').show()
                $('#Q9').show()
        });
        
        $('#slideReview_no').change(function() {           
                $('#6b').hide()
                $('#sldRevConfirmElig_yes').val('')
                $('#sldRevConfirmElig_no').val('')
                 $('#Q7').hide()
                $('#reviewConsistent_yes').val('')
                $('#reviewConsistent_no').val('')
                $('#Q9').hide()
                $('#projectCriteria_yes').val('')
                $('#projectCriteria_no').val('')
                
        });
    });
</script>

<g:render template="/formMetadata/timeConstraint" bean="${bpvCaseQualityReviewInstance.formMetadata}" var="formMetadata"/>
<g:render template="/caseRecord/caseDetails" bean="${bpvCaseQualityReviewInstance.caseRecord}" var="caseRecord"/>

<div class="list">
    <table>
        <tbody>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="consent">1. Did the participant sign and date the informed consent for HRRC/IRB#11-279?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'consent', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.consent)}"  name="consent" /> 
                </td>
            </tr>
            
            <tr class="prop">
                <td valign="top" class="name">
                    <label for="tubes">2. Were  the minimum required pre-operative RNA and DNA PAXgene tubes collected?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'tubes', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.tubes)}"  name="tubes" />
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="plasmaAliquots">3. Were the desired plasma and serum aliquots obtained?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'plasmaAliquots', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.plasmaAliquots)}"  name="plasmaAliquots" />
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="tumorModule">4. Was the Priority 1 tumor module collected?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'tumorModule', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.tumorModule)}"  name="tumorModule" />
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="additionalModule">5. Were additional priority modules collected?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'additionalModule', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.additionalModule)}"  name="additionalModule" />
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="slideReview">6a. Was local pathology review of the H&E slide derived from QC FFPE tumor tissue completed?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'slideReview', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.slideReview)}"  name="slideReview" />
                </td>
            </tr>
            
            <tr class="prop" id="6b" style="display:${bpvCaseQualityReviewInstance?.slideReview == 'Yes' ? 'display' : 'none'}">
                <td valign="top" class="name">
                    <label for="sldRevConfirmElig">6b. Did local pathology review of the H&E slide derived from QC FFPE tumor tissue confirm the histological type to be eligible for BPV study?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'sldRevConfirmElig', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.sldRevConfirmElig)}"  name="sldRevConfirmElig" />
                </td>
            </tr>

            <tr class="prop" id="Q7" style="display:${bpvCaseQualityReviewInstance?.slideReview == 'Yes' ? 'display' : 'none'}">
                <td valign="top" class="name">
                    <label for="reviewConsistent">7. Was local pathology review consistent with the findings of the BSS diagnostic pathology report for the case?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'reviewConsistent', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.reviewConsistent)}"  name="reviewConsistent" />
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="clinicalData">8. Was clinical data entry completed?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'clinicalData', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.clinicalData)}"  name="clinicalData" />
                </td>
            </tr>

            <tr class="prop" id="Q9" style="display:${bpvCaseQualityReviewInstance?.slideReview == 'Yes' ? 'display' : 'none'}">
                <td valign="top" class="name">
                    <label for="projectCriteria">
                      <g:if test="${version53}">
                      9. Did the required tumor module satisfy the project criteria of necrosis percentage of <20% and tumor content of ≥50% tumor nuclei?</label>
                      </g:if>
                      <g:else>
                        9. Did the required tumor module satisfy the project criteria of necrosis percentage of <20% and tumor content of &ge;50% tumor cells by surface area?
                      </g:else>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'projectCriteria', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.projectCriteria)}"  name="projectCriteria" />
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="requirements">10. Is this case released for shipment?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'requirements', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.requirements)}"  name="requirements" />
                </td>
            </tr>
            
            <tr class="prop">
                <td valign="top" class="name">
                    <label for="wasStopped">11. Was case stopped?</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'wasStopped', 'errors')}">
                    <g:bpvYesNoRadioPicker checked="${(bpvCaseQualityReviewInstance?.wasStopped)}"  name="wasStopped" />
                </td>
            </tr>
            
            <tr class="prop subentry" id="reasonStoppedRow" style="display:${bpvCaseQualityReviewInstance?.wasStopped == 'Yes' ? 'display' : 'none'}">
                <td valign="top" class="name">
                    <label for="reasonStopped">Select reason:</label>
                </td>
                <td valign="top" class="value textcenter ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'reasonStopped', 'errors')}"><g:select name="reasonStopped" from="${['Not enough blood collected', 'Not enough tissue', 'Tissue was too necrotic', 'Tissue was benign', 'Tissue was not released to tissue bank', 'Other, specify']}" value="${bpvCaseQualityReviewInstance?.reasonStopped}" noSelection="['': '']" /></td>
            </tr>
            
            <tr class="prop subentry" id="otherReasonRow" style="display:${bpvCaseQualityReviewInstance?.reasonStopped == 'Other, specify' ? 'display' : 'none'}">
                <td colspan="2" valign="top" class="name ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'otherReason', 'errors')}">
                    <label for="otherReason">Specify other reason:</label><br />
                    <g:textArea class="textwide" name="otherReason" cols="40" rows="5" value="${bpvCaseQualityReviewInstance?.otherReason}" />
                </td>
            </tr>

            <tr class="prop">
                <td colspan="2" valign="top" class="name ${hasErrors(bean: bpvCaseQualityReviewInstance, field: 'reviewComments', 'errors')}">
                    <label for="reviewComments">12. Case quality review comments:</label><br />
                    <g:textArea class="textwide" name="reviewComments" cols="40" rows="5" value="${bpvCaseQualityReviewInstance?.reviewComments}" />
                </td>
            </tr>

        </tbody>
    </table>
</div>
