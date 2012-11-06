package based2

import org.springframework.dao.DataIntegrityViolationException

class CompradoresInquilinosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def list = CompradoresInquilinos.createCriteria().list (params) {
			if ( params.query ) {
				ilike("apellido", "%${params.query}%")
			}
		}

        [compradoresInquilinosInstanceList: list, compradoresInquilinosInstanceTotal: list.totalCount]
    }

    def create() {
        [compradoresInquilinosInstance: new CompradoresInquilinos(params)]
    }

    def save() {
        def compradoresInquilinosInstance = new CompradoresInquilinos(params)
        if (!compradoresInquilinosInstance.save(flush: true)) {
            render(view: "create", model: [compradoresInquilinosInstance: compradoresInquilinosInstance])
            return
        }
		
		if(params.telefonoDeContacto){
			compradoresInquilinosInstance.addToTelefonosContacto(new PersonasTelefonos(telefonoContacto : params.telefonoDeContacto))
		}
		

        flash.message = message(code: 'default.created.message', args: [message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos'), compradoresInquilinosInstance.id])
        redirect(action: "show", id: compradoresInquilinosInstance.id)
    }

    def show(Long id) {
        def compradoresInquilinosInstance = CompradoresInquilinos.get(id)
        if (!compradoresInquilinosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos'), id])
            redirect(action: "list")
            return
        }

        [compradoresInquilinosInstance: compradoresInquilinosInstance]
    }

    def edit(Long id) {
        def compradoresInquilinosInstance = CompradoresInquilinos.get(id)
        if (!compradoresInquilinosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos'), id])
            redirect(action: "list")
            return
        }

        [compradoresInquilinosInstance: compradoresInquilinosInstance]
    }

    def update(Long id, Long version) {
        def compradoresInquilinosInstance = CompradoresInquilinos.get(id)
        if (!compradoresInquilinosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (compradoresInquilinosInstance.version > version) {
                compradoresInquilinosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos')] as Object[],
                          "Another user has updated this CompradoresInquilinos while you were editing")
                render(view: "edit", model: [compradoresInquilinosInstance: compradoresInquilinosInstance])
                return
            }
        }

        compradoresInquilinosInstance.properties = params

        if (!compradoresInquilinosInstance.save(flush: true)) {
            render(view: "edit", model: [compradoresInquilinosInstance: compradoresInquilinosInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos'), compradoresInquilinosInstance.id])
        redirect(action: "show", id: compradoresInquilinosInstance.id)
    }

    def delete(Long id) {
        def compradoresInquilinosInstance = CompradoresInquilinos.get(id)
        if (!compradoresInquilinosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos'), id])
            redirect(action: "list")
            return
        }

        try {
            compradoresInquilinosInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'compradoresInquilinos.label', default: 'CompradoresInquilinos'), id])
            redirect(action: "show", id: id)
        }
    }
}
