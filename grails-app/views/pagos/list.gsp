
<%@ page import="based2.Pagos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagos.label', default: 'Pagos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pagos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pagos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
					
						<th><g:message code="pagos.contrato.label" default="Contrato" /></th>
					
						<g:sortableColumn property="fechaPago" title="${message(code: 'pagos.fechaPago.label', default: 'Fecha Pago')}" />
					
						<g:sortableColumn property="periodo" title="${message(code: 'pagos.periodo.label', default: 'Periodo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pagosInstanceList}" status="i" var="pagosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pagosInstance.id}">${fieldValue(bean: pagosInstance, field: "periodo")}</g:link></td>
					
						<td>${fieldValue(bean: pagosInstance, field: "contrato")}</td>
					
						<td><g:formatDate date="${pagosInstance.fechaPago}" /></td>
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pagosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
