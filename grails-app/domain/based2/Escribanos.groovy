package based2


class Escribanos extends Personas {
	
	static hasMany = [telefonosContacto: PersonasTelefonos]

	Long nroMatricula
	String dirEstudio
//	String status
	String nombre
	String apellido
	String domicilio
	Long documento
	
	String telefonoDeContacto
	static transients = ['telefonoDeContacto']

	String status
	
	static mapping = {
    }

	String toString() {
		return nombre + " " +apellido
	}
	
    static constraints = {
		nroMatricula(unique:true)
//		status(display:false, nullable:true)
		nombre(nullable:false,blank:false)
		apellido(nullable:false,blank:false)
		domicilio(nullable:false,blank:false)
		documento(unique:true, editable:false)
		status(display:false, nullable:true)
		telefonosContacto(display:false, nullable: true)
		telefonoDeContacto(display:true)
    }
}
