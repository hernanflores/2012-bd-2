
<%@ page import="based2.CompradoresInquilinos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-compradoresInquilinos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-compradoresInquilinos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'compradoresInquilinos.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'compradoresInquilinos.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="domicilio" title="${message(code: 'compradoresInquilinos.domicilio.label', default: 'Domicilio')}" />
					
						<g:sortableColumn property="documento" title="${message(code: 'compradoresInquilinos.documento.label', default: 'Documento')}" />
					
					
						<g:sortableColumn property="lugarTrabajo" title="${message(code: 'compradoresInquilinos.lugarTrabajo.label', default: 'Lugar Trabajo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${compradoresInquilinosInstanceList}" status="i" var="compradoresInquilinosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${compradoresInquilinosInstance.id}">${fieldValue(bean: compradoresInquilinosInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: compradoresInquilinosInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: compradoresInquilinosInstance, field: "domicilio")}</td>
					
						<td>${fieldValue(bean: compradoresInquilinosInstance, field: "documento")}</td>
					
					
						<td>${fieldValue(bean: compradoresInquilinosInstance, field: "lugarTrabajo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${compradoresInquilinosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
