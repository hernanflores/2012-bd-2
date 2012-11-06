
<%@ page import="based2.DueOs" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dueOs.label', default: 'DueOs')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dueOs" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dueOs" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dueOs">
			
				<g:if test="${dueOsInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="dueOs.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${dueOsInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dueOsInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="dueOs.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${dueOsInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dueOsInstance?.domicilio}">
				<li class="fieldcontain">
					<span id="domicilio-label" class="property-label"><g:message code="dueOs.domicilio.label" default="Domicilio" /></span>
					
						<span class="property-value" aria-labelledby="domicilio-label"><g:fieldValue bean="${dueOsInstance}" field="domicilio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dueOsInstance?.documento}">
				<li class="fieldcontain">
					<span id="documento-label" class="property-label"><g:message code="dueOs.documento.label" default="Documento" /></span>
					
						<span class="property-value" aria-labelledby="documento-label"><g:fieldValue bean="${dueOsInstance}" field="documento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dueOsInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="dueOs.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${dueOsInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dueOsInstance?.telefonosContacto}">
				<li class="fieldcontain">
					<span id="telefonosContacto-label" class="property-label"><g:message code="dueOs.telefonosContacto.label" default="Telefonos Contacto" /></span>
					
						<g:each in="${dueOsInstance.telefonosContacto}" var="t">
						<span class="property-value" aria-labelledby="telefonosContacto-label"><g:link controller="personasTelefonos" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${dueOsInstance?.propiedades}">
				<li class="fieldcontain">
					<span id="propiedades-label" class="property-label"><g:message code="dueOs.propiedades.label" default="Propiedades" /></span>
					
						<g:each in="${dueOsInstance.propiedades}" var="p">
						<span class="property-value" aria-labelledby="propiedades-label"><g:link controller="propiedades" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dueOsInstance?.id}" />
					<g:link class="edit" action="edit" id="${dueOsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
