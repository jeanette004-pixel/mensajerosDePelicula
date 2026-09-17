import paquetes.*

object empresa{
    var mensajeros=[]
    
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
        return paquete.puedeSerEntregado()(mensajero)
    }

    method pesoDelUltimoMensajero(){
        return mensajeros.last().peso()
    }
}