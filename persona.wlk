import cuentaBancaria.*
class Persona{
    var property formasDePago 
    var property metodoPreferido
    var property efectivo
    const property cuentaBancaria 

    var property compras = [] 
    var property trabajo 

    var property mesActual // ver

    method disminuirEfectivo(monto){
        efectivo-=monto
    }

    method metodoPreferido(nuevo){
        metodoPreferido = nuevo
    }

    method agregarObjeto(objeto){
        compras.add(objeto)
    }

    method leAlcanza(montoCompra,metodoPago) = metodoPago.criterio(self,montoCompra)

    method disminuir(montoCompra, metodo){
        metodo.criterioDisminucion()
    }

    method cobrarSueldo(){
        trabajo.cobrar(self)
        cuentaBancaria.tarjetaCredito().pagarDeudas(mesActual)
    }

    method deudasVencidas() = cuentaBancaria.deudasVencidas()

    method cantidadCompras() = compras.size()

    method concretarCompra(unObjeto,metodo){
        self.agregarObjeto(unObjeto)
        self.disminuir(unObjeto.montoCompra(),metodo)
    }

    method noCumple(objeto) {
       throw new UserException(message = "No es posible concretar la compra")
    }

    method comprar(metodoPago,objeto){
        if (!self.leAlcanza(objeto.montoCompra(),metodoPago))
          self.noCumple(objeto)
        else self.concretarCompra(objeto,metodoPago)
    } 

}

class Sueldo{
    var property salario // revisar
    var property montoMax 

    method aumentar(unMonto){
        salario +=unMonto
    }

    method cobrar(persona){
        persona.CuentaBancaria().montoMax(salario) // le pongo la plata en la cuenta bancaria
    }

    method transcurreMes(){
        self.aumentar(montoMax)
    }
}


class CompradoresCompulsivos inherits Persona{
    method nuevoMetodo(objeto) = formasDePago.find({forma => self.leAlcanza(objeto.montoCompra(), forma)})

    override method noCumple(objeto){
        self.comprar(self.nuevoMetodo(objeto),objeto)
    }

}

class PagadoresCompulsivos inherits Persona{
    method pagarMasDeudas(){
        if(self.deudasVencidas() > 0)
        self.cuentaBancaria().depositar(self.efectivo())
        self.disminuirEfectivo(self.efectivo())
    }
}

class Objeto{
    const property objeto
    const property montoCompra
}


class UserException inherits Exception{}

// Aclaracion, hice que dependa la compra de la persona para que se pueda cumpli la segunda parte de compradores y pagadores compulsivos, originalmentr
// habia delegado la compra a una clase Compra donde estaba la informacion del objeto
