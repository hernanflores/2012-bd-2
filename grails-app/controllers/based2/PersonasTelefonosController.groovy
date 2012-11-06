package based2

import org.springframework.dao.DataIntegrityViolationException

class PersonasTelefonosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [personasTelefonosInstanceList: PersonasTelefonos.list(params), personasTelefonosInstanceTotal: PersonasTelefonos.count()]
    }

    def create() {
        [personasTelefonosInstance: new PersonasTelefonos(params)]
    }

    def save() {
        def personasTelefonosInstance = new PersonasTelefonos(params)
        if (!personasTelefonosInstance.save(flush: true)) {
            render(view: "create", model: [personasTelefonosInstance: personasTelefonosInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'personasTelefonos.label', default: 'PersonasTelefonos'), personasTelefonosInstance.id])
        redirect(action: "show", id: personasTelefonosInstance.id)
    }

    def show(Long id) {
        def personasTelefonosInstance = PersonasTelefonos.get(id)
        if (!personasTelefonosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personasTelefonos.label', default: 'PersonasTelefonos'), id])
            redirect(action: "list")
            return
        }

        [personasTelefonosInstance: personasTelefonosInstance]
    }

    def edit(Long id) {
        def personasTelefonosInstance = PersonasTelefonos.get(id)
        if (!personasTelefonosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personasTelefonos.label', default: 'PersonasTelefonos'), id])
            redirect(action: "list")
            return
        }

        [personasTelefonosInstance: personasTelefonosInstance]
    }

    def update(Long id, Long version) {
        def personasTelefonosInstance = PersonasTelefonos.get(id)
        if (!personasTelefonosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personasTelefonos.label', default: 'PersonasTelefonos'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (personasTelefonosInstance.version > version) {
                personasTelefonosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'personasTelefonos.label', default: 'PersonasTelefonos')] as Object[],
                          "Another user has updated this PersonasTelefonos while you were editing")
                render(view: "edit", model: [personasTelefonosInstance: personasTelefonosInstance])
                return
            }
        }

        personasTelefonosInstance.properties = params

        if (!personasTelefonosInstance.save(flush: true)) {
            render(view: "edit", model: [personasTelefonosInstance: personasTelefonosInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'personasTelefonos.label', default: 'PersonasTelefonos'), personasTelefonosInstance.id])
        redirect(action: "show", id: personasTelefonosInstance.id)
    }

    def delete(Long id) {
        def personasTelefonosInstance = PersonasTelefonos.get(id)
        if (!personasTelefonosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personasTelefonos.label', default: 'PersonasTelefonos'), id])
            redirect(action: "list")
            return
        }

        try {
            personasTelefonosInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'personasTelefonos.label', default: 'PersonasTelefonos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'personasTelefonos.label', default: 'PersonasTelefonos'), id])
            redirect(action: "show", id: id)
        }
    }
}
