<%@page pageEncoding="UTF-8" contentType="application/json" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>

<c:set scope="request" var="submissionsList" 
               value="${SubmissionHelper.retrieveRecentSubmissions("Template",1)}"/>
<c:forEach var="submission" items="${submissionsList}">
<json:object>
    <json:property name="date" value="${submission.submittedAt}" />
    <%--the .toSting() after the getValue should be removed after the core build 12/15/2015--%>
    <json:property name="details" value="${submission.getValue('Details').toString()}" />
</json:object>
</c:forEach>



