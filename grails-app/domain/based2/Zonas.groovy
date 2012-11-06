package based2


class Zonas {
	
	static hasMany = [propiedades: Propiedades]

	String nombre
	String descripcion
	String status

    static constraints = {
		status(display:false, nullable:true)
		nombre(unique:true)
    }
	
	String toString() {
		return nombre
	}

    static mapping = {
//    	id name:'nombre', generator:'assigned'
    }
}
