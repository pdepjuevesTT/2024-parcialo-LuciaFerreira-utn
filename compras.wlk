class Compra{
    const objeto
    const montoCompra

    method concretarCompra(persona,unObjeto,metodo){
        persona.agregarObjeto(unObjeto)
        persona.disminuir(montoCompra,metodo)
    }

    method noCumple(persona,costo) = throw new UserException(message = "No es posible concretar la compra")


    method compran(persona, metodoPago){
        if (!persona.leAlcanza(objeto.montoCompra()))
          self.noCumple(persona, objeto.montoCompra())
        else self.concretarCompra(persona,objeto,metodoPago)
    } 
     
}


// este esta
class UserException inherits Exception{}
