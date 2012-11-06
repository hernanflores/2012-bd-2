
<%@ page import="based2.Ventas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ventas.label', default: 'Ventas')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ventas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ventas" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ventas">
			
				<g:if test="${ventasInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="ventas.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${ventasInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventasInstance?.comision}">
				<li class="fieldcontain">
					<span id="comision-label" class="property-label"><g:message code="ventas.comision.label" default="Comision" /></span>
					
						<span class="property-value" aria-labelledby="comision-label"><g:fieldValue bean="${ventasInstance}" field="comision"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventasInstance?.comprador}">
				<li class="fieldcontain">
					<span id="comprador-label" class="property-label"><g:message code="ventas.comprador.label" default="Comprador" /></span>
					
						<span class="property-value" aria-labelledby="comprador-label"><g:link controller="compradoresInquilinos" action="show" id="${ventasInstance?.comprador?.id}">${ventasInstance?.comprador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventasInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="ventas.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${ventasInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventasInstance?.propiedad}">
				<li class="fieldcontain">
					<span id="propiedad-label" class="property-label"><g:message code="ventas.propiedad.label" default="Propiedad" /></span>
					
						<span class="property-value" aria-labelledby="propiedad-label"><g:link controller="propiedades" action="show" id="${ventasInstance?.propiedad?.id}">${ventasInstance?.propiedad?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ventasInstance?.id}" />
					<g:link class="edit" action="edit" id="${ventasInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
