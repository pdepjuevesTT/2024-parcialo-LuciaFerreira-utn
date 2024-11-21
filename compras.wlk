class Compra{
    const objeto
    const montoCompra

    method concretarCompra(persona,unObjeto,metodo){
        persona.agregarObjeto(unObjeto)
        persona.disminuir(montoCompra,metodo)
    }


    method compran(persona, metodoPago){
        if (!persona.leAlcanza())
          throw new UserException(message = "No es posible concretar la compra")
        else self.concretarCompra(persona,objeto,metodoPago)
    } 
     
}

// este esta
class UserException inherits Exception{}
