package based2


class CompradoresInquilinos extends Personas{

	static hasMany = [telefonosContacto: PersonasTelefonos]
	
	String lugarTrabajo
	String nombre
	String apellido
	String domicilio
	Long documento
	
	String telefonoDeContacto
	static transients = ['telefonoDeContacto']

	String status

	static mapping = {
//    	id column:'perDocumento', generator:'assigned'
    }
	
	String toString() {
		return nombre + " " +apellido
	}

    static constraints = {
		nombre(nullable:false,blank:false)
		apellido(nullable:false,blank:false)
		domicilio(nullable:false,blank:false)
		documento(unique:true, editable:false)
		status(display:false, nullable:true)
		telefonosContacto(display:false, nullable: true)
		telefonoDeContacto(display:true)
	}
//		
   
}
