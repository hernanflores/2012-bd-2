<%@ page import="based2.Pagos" %>



<div class="fieldcontain ${hasErrors(bean: pagosInstance, field: 'contrato', 'error')} required">
	<label for="contrato">
		<g:message code="pagos.contrato.label" default="Contrato" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contrato" name="contrato.id" from="${based2.Contratos.list()}" optionKey="id" required="" value="${pagosInstance?.contrato?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagosInstance, field: 'fechaPago', 'error')} required">
	<label for="fechaPago">
		<g:message code="pagos.fechaPago.label" default="Fecha Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaPago" precision="day"  value="${pagosInstance?.fechaPago}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pagosInstance, field: 'periodo', 'error')} ">
	<label for="periodo">
		<g:message code="pagos.periodo.label" default="Periodo" />
		
	</label>
	<g:textField name="periodo" value="${pagosInstance?.periodo}"/>
</div>

