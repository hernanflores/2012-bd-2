package based2

import org.springframework.dao.DataIntegrityViolationException

class PagosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pagosInstanceList: Pagos.list(params), pagosInstanceTotal: Pagos.count()]
    }

    def create() {
        [pagosInstance: new Pagos(params)]
    }

    def save() {
        def pagosInstance = new Pagos(params)
        if (!pagosInstance.save(flush: true)) {
            render(view: "create", model: [pagosInstance: pagosInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pagos.label', default: 'Pagos'), pagosInstance.id])
        redirect(action: "show", id: pagosInstance.id)
    }

    def show(Long id) {
        def pagosInstance = Pagos.get(id)
        if (!pagosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagos.label', default: 'Pagos'), id])
            redirect(action: "list")
            return
        }

        [pagosInstance: pagosInstance]
    }

    def edit(Long id) {
        def pagosInstance = Pagos.get(id)
        if (!pagosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagos.label', default: 'Pagos'), id])
            redirect(action: "list")
            return
        }

        [pagosInstance: pagosInstance]
    }

    def update(Long id, Long version) {
        def pagosInstance = Pagos.get(id)
        if (!pagosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagos.label', default: 'Pagos'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pagosInstance.version > version) {
                pagosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pagos.label', default: 'Pagos')] as Object[],
                          "Another user has updated this Pagos while you were editing")
                render(view: "edit", model: [pagosInstance: pagosInstance])
                return
            }
        }

        pagosInstance.properties = params

        if (!pagosInstance.save(flush: true)) {
            render(view: "edit", model: [pagosInstance: pagosInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pagos.label', default: 'Pagos'), pagosInstance.id])
        redirect(action: "show", id: pagosInstance.id)
    }

    def delete(Long id) {
        def pagosInstance = Pagos.get(id)
        if (!pagosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagos.label', default: 'Pagos'), id])
            redirect(action: "list")
            return
        }

        try {
            pagosInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pagos.label', default: 'Pagos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pagos.label', default: 'Pagos'), id])
            redirect(action: "show", id: id)
        }
    }
}
