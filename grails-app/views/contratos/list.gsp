
<%@ page import="based2.Contratos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contratos.label', default: 'Contratos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contratos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contratos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nroSerie" title="${message(code: 'contratos.nroSerie.label', default: 'Nro Serie')}" />
					
						<g:sortableColumn property="finOcup" title="${message(code: 'contratos.finOcup.label', default: 'Fin Ocup')}" />
					
						<g:sortableColumn property="inicioOcup" title="${message(code: 'contratos.inicioOcup.label', default: 'Inicio Ocup')}" />
					
						<g:sortableColumn property="fechaCont" title="${message(code: 'contratos.fechaCont.label', default: 'Fecha Cont')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'contratos.status.label', default: 'Status')}" />
					
						<th><g:message code="contratos.escribano.label" default="Escribano" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contratosInstanceList}" status="i" var="contratosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contratosInstance.id}">${fieldValue(bean: contratosInstance, field: "nroSerie")}</g:link></td>
					
						<td><g:formatDate date="${contratosInstance.finOcup}" /></td>
					
						<td><g:formatDate date="${contratosInstance.inicioOcup}" /></td>
					
						<td><g:formatDate date="${contratosInstance.fechaCont}" /></td>
					
						<td>${fieldValue(bean: contratosInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: contratosInstance, field: "escribano")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contratosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
