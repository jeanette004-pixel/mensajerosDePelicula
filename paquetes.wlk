import personajes.*
import lugares.*
import transporte.*
object paquete{
	var property estaPagado=false
	var property destino=matrix
	method precio(){
		return destino.tarifa()
	}
	method pagar(){
		 estaPagado= true
	}

	method puedeSerEntregado(persona_) {
		return self.estaPagado() && self.laPersonaCumpleRestriccionesDelDestino(persona_)
	}

	method laPersonaCumpleRestriccionesDelDestino(persona_){
		return destino.personaCumpleRestricciones(persona_)
	}

}
//nuevo
object paquetito{
	var property estaPagado=true //siempre esta pagado
	var property destino=matrix
	method precio(){
		return destino.tarifa()
	}
/*
	method pagar(){
		 estaPagado= true
	}
*/
	method puedeSerEntregado(persona_){
		return self.estaPagado()// && destino.personaCumpleRestricciones(persona)
	}
}

object paquetonViajero{
	var property estaPagado=false
	var property dineroPagadoHastaAhora=0
	var property destinos=[]//multiples destinos
	method precio(){
		return 100 * destinos.size()
	}
	method pagar(cantidad){
		self.verificarSiEstaPago()
		dineroPagadoHastaAhora=dineroPagadoHastaAhora+ cantidad
		self.verificarEstado()
		 
	}
	
	method verificarEstado(){
		if(self.dineroPagadoHastaAhora()==self.precio()){
			estaPagado=true
		}
	}

	method verificarSiEstaPago(){
		return if(self.dineroPagadoHastaAhora()>self.precio()){
			 self.error("ya terminaste de pagar")
		 }
	}


	method puedeSerEntregado(persona_){
		return self.estaPagado() && destinos.all({d => d.personaCumpleRestricciones(persona_)})
	}
	
}




/*
if(x){
	return y
}else{
 	return z
}