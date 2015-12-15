<%@page pageEncoding="UTF-8" contentType="application/json" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>

<%--
     java.util.Map<String,String[]> searchOptions = new java.util.HashMap<>();
    searchOptions.put("end", new String[] {"2015-12-30T21:00:00.000Z"} );
    searchOptions.put("start", new String[] {"2015-11-01T21:00:00.000Z"} );
    searchOptions.put("limit", new String[] {"1"} );
    
    com.kineticdata.core.models.Kapp kapp = (com.kineticdata.core.models.Kapp) request.getAttribute("kapp");
    com.kineticdata.core.services.BundleSubmissionService submissionsGet = (com.kineticdata.core.services.BundleSubmissionService)request.getAttribute("Submissions");
    List<com.kineticdata.core.models.Submission> submissions = submissionsGet.searchByKapp(kapp, searchOptions);
    
    java.util.Map<String,Object> hashMap = new java.util.HashMap<>();
    for (com.kineticdata.core.models.Submission submission : submissions){
    hashMap.put("date",submission.getCreatedAt());
    hashMap.put("details",submission.getValueByName("Details"));
     request.setAttribute("hashMap", hashMap);
    }
--%>
<c:set scope="request" var="submissionsList" 
               value="${SubmissionHelper.retrieveRecentSubmissions("Template")}"/>
<c:forEach var="submission" items="${submissionsList}">
<json:object>
    <json:property name="date" value="${submission.submittedAt}" />
    <json:property name="details" value="${submission.getValue('Details')}" />
</json:object>
</c:forEach>


