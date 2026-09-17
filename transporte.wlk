object moto{
	method peso(){
		return 100
	}

}

object camion{
	var property cantidadDeAcoplados=0
	method peso(){
		return 500 +self.pesoAcoplados()
	}
	method pesoAcoplados(){
		return cantidadDeAcoplados*500
	}

}