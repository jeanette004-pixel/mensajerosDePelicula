import paquetes.*
import transporte.*
import personajes.*


object empresa{
    var mensajeros=[]
    var paquetesPendientes=[]
    var recaudacionDePaquetes=0

    method recaudacionDePaquetes(){
        return recaudacionDePaquetes
    }

    method mensajeros(){
        return mensajeros
    }

    method contratar(mensajero){
        mensajeros.add(mensajero)
    }
    
    method despedir(mensajero){
        mensajeros.remove(mensajero)
    }

    method despedirATodos(){
        mensajeros.clear()
    }
    method mensajeriaEsGrande(){
        return mensajeros.size()>2
    }

    method mensajeroPuedeEntregarPaquete(paquete){
        const mensajero=mensajeros.first()
        return paquete.puedeSerEntregado(mensajero)
    }

    method pesoDelUltimoMensajero(){
        return mensajeros.last().peso()
    }

    method paquetePuedeSerEntregadoPorAlgunMensajero(paquete_){ //1
        return mensajeros.any({m=>paquete_.destino().personaCumpleRestricciones(m)})
    } //solo se fija en las condiciones del empleado para el paquete, no en si esta pagado
    //preguntarle directo al paquete(el paquete luego al destino pero adentro de paquete)

    method empleadosQuePuedenLlevarPaquete(paquete_){ //2
        return mensajeros.filter({m=> paquete_.destino().personaCumpleRestricciones(m)})
    }

    method tieneSobrepeso(){ //3
        return mensajeros.sum({m=>m.peso()})> 500
    }
    
    method enviarPaquete(paquete_){ //4
        const mensajero=self.mensajeros().anyOne()
        paquete_.persona(mensajero)
        if(paquete_.destino().personaCumpleRestricciones(mensajero)){
           self.añadirRecaudacionDePaquete(paquete_.precioDelPaquete(paquete_.destino()))
        }else{
            paquetesPendientes.add(paquete_) //encargarme de pagar en el test
        }
    }

    method añadirRecaudacionDePaquete(precio_){
        recaudacionDePaquetes=recaudacionDePaquetes+ precio_
    }
    method facturacion(){ //5
        return recaudacionDePaquetes
    }
    method enviarTodosLosPaquetes(paquetes_){ //6
        paquetes_.forEach({paquete=>self.enviarPaquete(paquete)})
    }

    method enviarPaqueteMasCaro(){ //7
        const paquetePendienteMasCaro=paquetesPendientes.max({p=>p.precioDelPaquete(p.lugar())})
        self.enviarPaquete(paquetePendienteMasCaro)
        paquetesPendientes.remove(paquetePendienteMasCaro)
    }
}