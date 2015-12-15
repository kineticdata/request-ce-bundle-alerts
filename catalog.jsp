<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>

    <div class="container">
        <div class="row">
            <c:forEach var="form" items="${kapp.forms}">
                <c:if test="${form.type.name == "Template"}">
                    <a href="${bundle.spaceLocation}/${kapp.slug}/${form.slug}">
                        <p>Alert submission form</p>
                    </a>
                </c:if>
            </c:forEach>
        </div>
    </div>
