<%@page pageEncoding="UTF-8" contentType="application/json" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%
    // Set the helper
    request.setAttribute("time", new TimeHelper());
%>

<c:set scope="request" var="submissionsList" 
               value="${SubmissionHelper.retrieveRecentSubmissions("Template",1)}"/>
<c:forEach var="submission" items="${submissionsList}">
    <json:object>
        <c:if test="${time.toEpochMillisecond(time.now()) > time.toEpochMillisecond(submission.getValue('Start')) && 
                      time.toEpochMillisecond(time.now()) < time.toEpochMillisecond(submission.getValue('End'))}">
            <json:property name="date" value="${submission.submittedAt}" />
            <json:property name="start" value="${submission.getValue('Start').toString()}" />
            <json:property name="end" value="${submission.getValue('End').toString()}" />
            <%--the .toSting() after the getValue should be removed after the core build 12/15/2015--%>
            <json:property name="details" value="${submission.getValue('Details').toString()}" />
        </c:if>
    </json:object>
</c:forEach>



