
<%@ page import="nci.obbr.cahub.forms.bpv.BpvSlidePrep" %>
<g:set var="bodyclass" value="bpvslideprep show bpv-study" scope="request"/>

<html>
    <head>
        <meta name="layout" content="cahubTemplate"/>
        <g:set var="entityName" value="${bpvSlidePrepInstance?.formMetadata?.cdrFormName}" />
        <g:set var="caseId" value="${bpvSlidePrepInstance?.caseRecord?.caseId}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="nav" class="clearfix">
            <div id="navlist">
                <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            </div>
        </div>
        <div id="container" class="clearfix">
            <h1><g:message code="default.show.label.with.case.id" args="[entityName,caseId]" /></h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:queryDesc caserecord="${bpvSlidePrepInstance?.caseRecord}" form="bpvStain" />
            <div id="show" class="dialog">
                <g:render template="formFieldsInc" />
            </div>
            <g:if test="${bpvSlidePrepInstance?.dateSubmitted &&
                bpvSlidePrepInstance?.caseRecord?.candidateRecord?.isEligible &&
                    bpvSlidePrepInstance?.caseRecord?.candidateRecord?.isConsented &&
                        canResume}">
                <div class="buttons">
                    <g:form>
                        <g:hiddenField name="id" value="${bpvSlidePrepInstance?.id}"/>
                        <span class="button">
                            <g:actionSubmit class="edit" action="resumeEditing" value="${message(code: 'default.button.resumeEditing.label', default: 'Resume Editing')}"/>
                        </span>
                    </g:form>
                </div>
            </g:if>
        </div>
    </body>
</html>