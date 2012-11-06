
<%@ page import="based2.CompradoresInquilinos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-compradoresInquilinos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-compradoresInquilinos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list compradoresInquilinos">
			
				<g:if test="${compradoresInquilinosInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="compradoresInquilinos.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${compradoresInquilinosInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradoresInquilinosInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="compradoresInquilinos.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${compradoresInquilinosInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradoresInquilinosInstance?.domicilio}">
				<li class="fieldcontain">
					<span id="domicilio-label" class="property-label"><g:message code="compradoresInquilinos.domicilio.label" default="Domicilio" /></span>
					
						<span class="property-value" aria-labelledby="domicilio-label"><g:fieldValue bean="${compradoresInquilinosInstance}" field="domicilio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradoresInquilinosInstance?.documento}">
				<li class="fieldcontain">
					<span id="documento-label" class="property-label"><g:message code="compradoresInquilinos.documento.label" default="Documento" /></span>
					
						<span class="property-value" aria-labelledby="documento-label"><g:fieldValue bean="${compradoresInquilinosInstance}" field="documento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradoresInquilinosInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="compradoresInquilinos.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${compradoresInquilinosInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradoresInquilinosInstance?.telefonosContacto}">
				<li class="fieldcontain">
					<span id="telefonosContacto-label" class="property-label"><g:message code="compradoresInquilinos.telefonosContacto.label" default="Telefonos Contacto" /></span>
					
						<g:each in="${compradoresInquilinosInstance.telefonosContacto}" var="t">
						<span class="property-value" aria-labelledby="telefonosContacto-label"><g:link controller="personasTelefonos" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${compradoresInquilinosInstance?.lugarTrabajo}">
				<li class="fieldcontain">
					<span id="lugarTrabajo-label" class="property-label"><g:message code="compradoresInquilinos.lugarTrabajo.label" default="Lugar Trabajo" /></span>
					
						<span class="property-value" aria-labelledby="lugarTrabajo-label"><g:fieldValue bean="${compradoresInquilinosInstance}" field="lugarTrabajo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${compradoresInquilinosInstance?.id}" />
					<g:link class="edit" action="edit" id="${compradoresInquilinosInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
