package based2

import org.springframework.dao.DataIntegrityViolationException

class EscribanosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [escribanosInstanceList: Escribanos.list(params), escribanosInstanceTotal: Escribanos.count()]
    }

    def create() {
        [escribanosInstance: new Escribanos(params)]
    }

    def save() {
        def escribanosInstance = new Escribanos(params)
        if (!escribanosInstance.save(flush: true)) {
            render(view: "create", model: [escribanosInstance: escribanosInstance])
            return
        }
		
		if(params.telefonoDeContacto){
			compradoresInquilinosInstance.addToTelefonosContacto(new PersonasTelefonos(telefonoContacto : params.telefonoDeContacto))
		}

        flash.message = message(code: 'default.created.message', args: [message(code: 'escribanos.label', default: 'Escribanos'), escribanosInstance.id])
        redirect(action: "show", id: escribanosInstance.id)
    }

    def show(Long id) {
        def escribanosInstance = Escribanos.get(id)
        if (!escribanosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escribanos.label', default: 'Escribanos'), id])
            redirect(action: "list")
            return
        }

        [escribanosInstance: escribanosInstance]
    }

    def edit(Long id) {
        def escribanosInstance = Escribanos.get(id)
        if (!escribanosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escribanos.label', default: 'Escribanos'), id])
            redirect(action: "list")
            return
        }

        [escribanosInstance: escribanosInstance]
    }

    def update(Long id, Long version) {
        def escribanosInstance = Escribanos.get(id)
        if (!escribanosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escribanos.label', default: 'Escribanos'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (escribanosInstance.version > version) {
                escribanosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'escribanos.label', default: 'Escribanos')] as Object[],
                          "Another user has updated this Escribanos while you were editing")
                render(view: "edit", model: [escribanosInstance: escribanosInstance])
                return
            }
        }

        escribanosInstance.properties = params

        if (!escribanosInstance.save(flush: true)) {
            render(view: "edit", model: [escribanosInstance: escribanosInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'escribanos.label', default: 'Escribanos'), escribanosInstance.id])
        redirect(action: "show", id: escribanosInstance.id)
    }

    def delete(Long id) {
        def escribanosInstance = Escribanos.get(id)
        if (!escribanosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escribanos.label', default: 'Escribanos'), id])
            redirect(action: "list")
            return
        }

        try {
            escribanosInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'escribanos.label', default: 'Escribanos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'escribanos.label', default: 'Escribanos'), id])
            redirect(action: "show", id: id)
        }
    }
}
