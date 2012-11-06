
<%@ page import="based2.Propiedades" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'propiedades.label', default: 'Propiedades')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-propiedades" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-propiedades" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tipoContrato" title="${message(code: 'propiedades.tipoContrato.label', default: 'Tipo Contrato')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'propiedades.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'propiedades.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="clasificacion" title="${message(code: 'propiedades.clasificacion.label', default: 'Clasificacion')}" />
					
						<g:sortableColumn property="padronCatastral" title="${message(code: 'propiedades.padronCatastral.label', default: 'Padron Catastral')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'propiedades.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${propiedadesInstanceList}" status="i" var="propiedadesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${propiedadesInstance.id}">${fieldValue(bean: propiedadesInstance, field: "tipoContrato")}</g:link></td>
					
						<td>${fieldValue(bean: propiedadesInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: propiedadesInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: propiedadesInstance, field: "clasificacion")}</td>
					
						<td>${fieldValue(bean: propiedadesInstance, field: "padronCatastral")}</td>
					
						<td>${fieldValue(bean: propiedadesInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${propiedadesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
