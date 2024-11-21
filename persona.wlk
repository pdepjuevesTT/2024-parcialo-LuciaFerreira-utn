class Persona{
    var property formasDePago 
    var property compras = [] 
    var property sueldo // composicion ya que puede cambiar 
    var property metodoPreferido // composicion

    method metodoPreferido(nuevo){
        metodoPreferido = nuevo
    }

    method agregarObjeto(objeto){
        compras.add(objeto)
    }

    method leAlcanza(montoCompra,metodoPago) = metodoPago.criterio(self,montoCompra)

    method comprar(objeto){
        objeto.compran(self,metodoPreferido)
    } 

    method transcurrirMes(){
        //cobrar()
        //pagar deudas
    }

    method deudasVencidad()

}




// puede que haya objeto cuenta bancaria o class
// tarjeta de credito es entidad
// hay un banco 
