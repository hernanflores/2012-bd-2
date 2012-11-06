
<%@ page import="based2.Escribanos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'escribanos.label', default: 'Escribanos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-escribanos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-escribanos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list escribanos">
			
				<g:if test="${escribanosInstance?.nroMatricula}">
				<li class="fieldcontain">
					<span id="nroMatricula-label" class="property-label"><g:message code="escribanos.nroMatricula.label" default="Nro Matricula" /></span>
					
						<span class="property-value" aria-labelledby="nroMatricula-label"><g:fieldValue bean="${escribanosInstance}" field="nroMatricula"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${escribanosInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="escribanos.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${escribanosInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${escribanosInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="escribanos.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${escribanosInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${escribanosInstance?.domicilio}">
				<li class="fieldcontain">
					<span id="domicilio-label" class="property-label"><g:message code="escribanos.domicilio.label" default="Domicilio" /></span>
					
						<span class="property-value" aria-labelledby="domicilio-label"><g:fieldValue bean="${escribanosInstance}" field="domicilio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${escribanosInstance?.documento}">
				<li class="fieldcontain">
					<span id="documento-label" class="property-label"><g:message code="escribanos.documento.label" default="Documento" /></span>
					
						<span class="property-value" aria-labelledby="documento-label"><g:fieldValue bean="${escribanosInstance}" field="documento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${escribanosInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="escribanos.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${escribanosInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${escribanosInstance?.telefonosContacto}">
				<li class="fieldcontain">
					<span id="telefonosContacto-label" class="property-label"><g:message code="escribanos.telefonosContacto.label" default="Telefonos Contacto" /></span>
					
						<g:each in="${escribanosInstance.telefonosContacto}" var="t">
						<span class="property-value" aria-labelledby="telefonosContacto-label"><g:link controller="personasTelefonos" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${escribanosInstance?.dirEstudio}">
				<li class="fieldcontain">
					<span id="dirEstudio-label" class="property-label"><g:message code="escribanos.dirEstudio.label" default="Dir Estudio" /></span>
					
						<span class="property-value" aria-labelledby="dirEstudio-label"><g:fieldValue bean="${escribanosInstance}" field="dirEstudio"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${escribanosInstance?.id}" />
					<g:link class="edit" action="edit" id="${escribanosInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
