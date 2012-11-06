package based2


class PersonasTelefonos {
	
	static belongsTo = [persona: Personas]
	
	String telefonoContacto
	String status
	
	String toString() {
		return telefonoContacto
	}

    static constraints = {
		status(display:false, nullable:true)
    }
}
