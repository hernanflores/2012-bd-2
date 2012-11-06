package based2

import org.springframework.dao.DataIntegrityViolationException

class DueOsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def list = DueOs.createCriteria().list (params) {
//			ne("status","borrado")
			if ( params.query ) {
//				and{
					ilike("apellido", "%${params.query}%")
//				}
			}
		}
        [dueOsInstanceList: list, dueOsInstanceTotal: list.totalCount]
    }

    def create() {
        [dueOsInstance: new DueOs(params)]
    }

    def save() {
        def dueOsInstance = new DueOs(params)
        if (!dueOsInstance.save(flush: true)) {
            render(view: "create", model: [dueOsInstance: dueOsInstance])
            return
        }
		
		
		if(params.telefonoDeContacto){
			dueOsInstance.addToTelefonosContacto(new PersonasTelefonos(telefonoContacto : params.telefonoDeContacto))
		}
		

        flash.message = message(code: 'default.created.message', args: [message(code: 'dueOs.label', default: 'DueOs'), dueOsInstance.id])
        redirect(action: "show", id: dueOsInstance.id)
    }

    def show(Long id) {
        def dueOsInstance = DueOs.get(id)
        if (!dueOsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dueOs.label', default: 'DueOs'), id])
            redirect(action: "list")
            return
        }

        [dueOsInstance: dueOsInstance]
    }

    def edit(Long id) {
        def dueOsInstance = DueOs.get(id)
        if (!dueOsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dueOs.label', default: 'DueOs'), id])
            redirect(action: "list")
            return
        }

        [dueOsInstance: dueOsInstance]
    }

    def update(Long id, Long version) {
        def dueOsInstance = DueOs.get(id)
        if (!dueOsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dueOs.label', default: 'DueOs'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dueOsInstance.version > version) {
                dueOsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dueOs.label', default: 'DueOs')] as Object[],
                          "Another user has updated this DueOs while you were editing")
                render(view: "edit", model: [dueOsInstance: dueOsInstance])
                return
            }
        }

        dueOsInstance.properties = params

        if (!dueOsInstance.save(flush: true)) {
            render(view: "edit", model: [dueOsInstance: dueOsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dueOs.label', default: 'DueOs'), dueOsInstance.id])
        redirect(action: "show", id: dueOsInstance.id)
    }

    def delete(Long id) {
        def dueOsInstance = DueOs.get(id)
        if (!dueOsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dueOs.label', default: 'DueOs'), id])
            redirect(action: "list")
            return
        }

        try {
//            dueOsInstance.delete(flush: true)
			dueOsInstance.status = "borrado"
			dueOsInstance.save(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dueOs.label', default: 'DueOs'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dueOs.label', default: 'DueOs'), id])
            redirect(action: "show", id: id)
        }
    }
}
