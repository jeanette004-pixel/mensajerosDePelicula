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

