
<%@ page import="based2.PersonasTelefonos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'personasTelefonos.label', default: 'PersonasTelefonos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-personasTelefonos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-personasTelefonos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list personasTelefonos">
			
				<g:if test="${personasTelefonosInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="personasTelefonos.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${personasTelefonosInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personasTelefonosInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="personasTelefonos.persona.label" default="Persona" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="personas" action="show" id="${personasTelefonosInstance?.persona?.id}">${personasTelefonosInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personasTelefonosInstance?.telefonoContacto}">
				<li class="fieldcontain">
					<span id="telefonoContacto-label" class="property-label"><g:message code="personasTelefonos.telefonoContacto.label" default="Telefono Contacto" /></span>
					
						<span class="property-value" aria-labelledby="telefonoContacto-label"><g:fieldValue bean="${personasTelefonosInstance}" field="telefonoContacto"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personasTelefonosInstance?.id}" />
					<g:link class="edit" action="edit" id="${personasTelefonosInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
