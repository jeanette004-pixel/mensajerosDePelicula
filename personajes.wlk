
import transporte.*
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
