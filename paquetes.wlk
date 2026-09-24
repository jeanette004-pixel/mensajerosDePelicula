import personajes.*
import lugares.*
import transporte.*
object paquete{
	var property estaPagado=false
	var property peso=0
	var property persona=neo //borrar
	var property destino=matrix
	method precioDelPaquete(destino_){
		destino_.tarifa()
	}
	method pagar(){
		 estaPagado= true
	}

	method puedeSerEntregado(persona_) {// añadir por parametro persona_, no asignarle la variable
		return self.estaPagado() && self.laPersonaCumpleRestriccionesDelDestino(persona)
	}

	method laPersonaCumpleRestriccionesDelDestino(persona_){
		return destino.personaCumpleRestricciones(persona_)
	}
	/*
	ooo ????
	method puedeSerEntregado(destino_,persona_){
		return self.estaPagado() && destino_.personaCumpleRestricciones(persona_)
	}
	*/
}
//nuevo
object paquetito{
	var property estaPagado=true //siempre esta pagado
	var property peso=0
	var property persona=neo
	var property destino=matrix
	method precioDelPaquete(destino_){
		return destino_.tarifa()
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
	var property dineroPagadoHastaAhora=0
	var property peso=0
	var property persona=neo
	var property destinos=[]//multiples destinos
	method precioDelPaquete(){//no uso destino_
	//	destino_.tarifa()
		return 100 * destinos.size()
	}
	method pagar(cantidad){
		self.verificarSiEstaPago()
		dineroPagadoHastaAhora=dineroPagadoHastaAhora+ cantidad
		 
	}

	method verificarSiEstaPago(){
		if(self.dineroPagadoHastaAhora()==self.precioDelPaquete()){
			 self.error("ya terminaste de pagar")
		 }
	}


	method puedeSerEntregado(){
		return self.estaPagado() && destinos.all({d => d.personaCumpleRestricciones(persona)})
	}
	
}




/*
if(x){
	return y
}else{
 	return z
}