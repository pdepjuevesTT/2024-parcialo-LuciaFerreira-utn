import cuentaBancaria.*
import formasPago.*

class Persona{
    var property formasDePago 
    var property metodoPreferido
    var property efectivo
    const property cuentaBancaria 

    var property compras = [] 
    var property trabajo 
    const property nombre

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
        metodo.criterioDisminucion(self,montoCompra)
    }

    method pagarDeudasConSueldo() = cuentaBancaria.tarjetaCredito().pagarUnaDeuda(mesActual)


    method cobrarSueldo(){
        trabajo.cobrar(self) // lo dividi para el testeo de pagar sueldos
    }

    method pagarDeuda(){
        self.pagarDeudasConSueldo()
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

    method comprar(metodoPag,objeto){
        if (!self.leAlcanza(objeto.montoCompra(),metodoPreferido))
          self.noCumple(objeto)
        else self.concretarCompra(objeto,metodoPreferido)
    } 

}

class Trabajo{
    var property salario // revisar
    var property montoSubida

    method aumentar(unMonto){
        salario +=unMonto
    }

    method cobrar(persona){
        persona.cuentaBancaria().depositar(salario) // le pongo la plata en la cuenta bancaria
    }

    method transcurreMes(){
        self.aumentar(montoSubida)
    }
}


class CompradoresCompulsivos inherits Persona{
    method nuevoMetodo(objeto) = formasDePago.find({forma => self.leAlcanza(objeto.montoCompra(), forma)})

    override method noCumple(objeto){
        self.comprar(self.nuevoMetodo(objeto),objeto)
    }

}

class PagadoresCompulsivos inherits Persona{
    
    method depositarABanco() = self.cuentaBancaria().depositar(self.efectivo())

    method pagarMasDeudas(){
        if(self.deudasVencidas() > 0)
        self.depositarABanco()
        self.disminuirEfectivo(self.efectivo())
    }
}


class Objeto{ // poongo a objeto aca por temas de no agregar un archivo casi vacio solo con esta clase
    const property objeto
    const property montoCompra
}


class UserException inherits Exception{}

// Aclaracion, hice que dependa la compra de la persona para que se pueda cumpli la segunda parte de compradores y pagadores compulsivos, originalmentr
// habia delegado la compra a una clase Compra donde estaba la informacion del objeto

