
<%@ page import="based2.Contratos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contratos.label', default: 'Contratos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contratos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contratos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contratos">
			
				<g:if test="${contratosInstance?.nroSerie}">
				<li class="fieldcontain">
					<span id="nroSerie-label" class="property-label"><g:message code="contratos.nroSerie.label" default="Nro Serie" /></span>
					
						<span class="property-value" aria-labelledby="nroSerie-label"><g:fieldValue bean="${contratosInstance}" field="nroSerie"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratosInstance?.finOcup}">
				<li class="fieldcontain">
					<span id="finOcup-label" class="property-label"><g:message code="contratos.finOcup.label" default="Fin Ocup" /></span>
					
						<span class="property-value" aria-labelledby="finOcup-label"><g:formatDate date="${contratosInstance?.finOcup}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratosInstance?.inicioOcup}">
				<li class="fieldcontain">
					<span id="inicioOcup-label" class="property-label"><g:message code="contratos.inicioOcup.label" default="Inicio Ocup" /></span>
					
						<span class="property-value" aria-labelledby="inicioOcup-label"><g:formatDate date="${contratosInstance?.inicioOcup}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratosInstance?.fechaCont}">
				<li class="fieldcontain">
					<span id="fechaCont-label" class="property-label"><g:message code="contratos.fechaCont.label" default="Fecha Cont" /></span>
					
						<span class="property-value" aria-labelledby="fechaCont-label"><g:formatDate date="${contratosInstance?.fechaCont}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratosInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="contratos.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${contratosInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratosInstance?.escribano}">
				<li class="fieldcontain">
					<span id="escribano-label" class="property-label"><g:message code="contratos.escribano.label" default="Escribano" /></span>
					
						<span class="property-value" aria-labelledby="escribano-label"><g:link controller="escribanos" action="show" id="${contratosInstance?.escribano?.id}">${contratosInstance?.escribano?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratosInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="contratos.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${contratosInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratosInstance?.pagos}">
				<li class="fieldcontain">
					<span id="pagos-label" class="property-label"><g:message code="contratos.pagos.label" default="Pagos" /></span>
					
						<g:each in="${contratosInstance.pagos}" var="p">
						<span class="property-value" aria-labelledby="pagos-label"><g:link controller="pagos" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${contratosInstance?.propiedad}">
				<li class="fieldcontain">
					<span id="propiedad-label" class="property-label"><g:message code="contratos.propiedad.label" default="Propiedad" /></span>
					
						<span class="property-value" aria-labelledby="propiedad-label"><g:link controller="propiedades" action="show" id="${contratosInstance?.propiedad?.id}">${contratosInstance?.propiedad?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratosInstance?.titular}">
				<li class="fieldcontain">
					<span id="titular-label" class="property-label"><g:message code="contratos.titular.label" default="Titular" /></span>
					
						<span class="property-value" aria-labelledby="titular-label"><g:link controller="compradoresInquilinos" action="show" id="${contratosInstance?.titular?.id}">${contratosInstance?.titular?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contratosInstance?.id}" />
					<g:link class="edit" action="edit" id="${contratosInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
