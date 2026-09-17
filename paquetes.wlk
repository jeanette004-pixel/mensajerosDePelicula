object paquete{
	var property estaPagado=false
	var property peso=0
	var property persona=neo
	var property destino=matrix
	method precioDelPaquete(lugar){
		lugar.tarifa()
	}
	method pagar(){
		 estaPagado= true
	}

	method puedeSerEntregado(){
		return self.estaPagado() && destino.personaCumpleRestricciones(persona)
	}
	
}
//nuevo
object paquetito{
	var property estaPagado=true //siempre esta pagado
	var property peso=0
	var property persona=neo
	var property destino=matrix
	method precioDelPaquete(lugar){
		return lugar.tarifa()
	}
/*
	method pagar(){
		 estaPagado= true
	}
*/
	method puedeSerEntregado(){
		return self.estaPagado()// && destino.personaCumpleRestricciones(persona)
	}
}

object paquetonViajero{
	var property estaPagado=false
	var property peso=0
	var property persona=neo
	var property destinos=[]//multiples destinos
	method precioDelPaquete(lugar){//no uso lugar pero lo dejo
	//	lugar.tarifa()
		return 100 * destinos.size()
	}
	method pagar(){
		 estaPagado= true //hacerlo con un if 
	}

	method puedeSerEntregado(){
		return self.estaPagado() && destinos.all({d => d.personaCumpleRestricciones(persona)})
	}
	
}

object matrix{
	method tarifa(){
		return 500
	}
	method personaCumpleRestricciones(persona_){
		return persona_.peso()<=1000
	}
}

object puenteDeBrooklyn{
	method tarifa(){
		return 150
	}
	method personaCumpleRestricciones(persona_){
		return persona_.puedeLlamar()
	}
}

object jeanGray{
	var property puedeLlamar=true
	var property peso=65

}

object neo{
	var property puedeLlamar=false
	var property peso=0

}

object saraConnor{
	var property puedeLlamar=false
	var property peso=0
	var property vehiculo= moto 
	method pesoTotal(){
		return peso+vehiculo.peso()
	}

}

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

/*
if(x){
	return y
}else{
 	return z
}