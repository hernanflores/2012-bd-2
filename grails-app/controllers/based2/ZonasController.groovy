package based2

import org.springframework.dao.DataIntegrityViolationException

class ZonasController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [zonasInstanceList: Zonas.list(params), zonasInstanceTotal: Zonas.count()]
    }

    def create() {
        [zonasInstance: new Zonas(params)]
    }

    def save() {
        def zonasInstance = new Zonas(params)
        if (!zonasInstance.save(flush: true)) {
            render(view: "create", model: [zonasInstance: zonasInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'zonas.label', default: 'Zonas'), zonasInstance.id])
        redirect(action: "show", id: zonasInstance.id)
    }

    def show(Long id) {
        def zonasInstance = Zonas.get(id)
        if (!zonasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'zonas.label', default: 'Zonas'), id])
            redirect(action: "list")
            return
        }

        [zonasInstance: zonasInstance]
    }

    def edit(Long id) {
        def zonasInstance = Zonas.get(id)
        if (!zonasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'zonas.label', default: 'Zonas'), id])
            redirect(action: "list")
            return
        }

        [zonasInstance: zonasInstance]
    }

    def update(Long id, Long version) {
        def zonasInstance = Zonas.get(id)
        if (!zonasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'zonas.label', default: 'Zonas'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (zonasInstance.version > version) {
                zonasInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'zonas.label', default: 'Zonas')] as Object[],
                          "Another user has updated this Zonas while you were editing")
                render(view: "edit", model: [zonasInstance: zonasInstance])
                return
            }
        }

        zonasInstance.properties = params

        if (!zonasInstance.save(flush: true)) {
            render(view: "edit", model: [zonasInstance: zonasInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'zonas.label', default: 'Zonas'), zonasInstance.id])
        redirect(action: "show", id: zonasInstance.id)
    }

    def delete(Long id) {
        def zonasInstance = Zonas.get(id)
        if (!zonasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'zonas.label', default: 'Zonas'), id])
            redirect(action: "list")
            return
        }

        try {
            zonasInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'zonas.label', default: 'Zonas'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'zonas.label', default: 'Zonas'), id])
            redirect(action: "show", id: id)
        }
    }
}
