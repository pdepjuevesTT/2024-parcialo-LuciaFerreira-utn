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

    method comprar(objeto){
        objeto.compran(self,metodoPreferido)
    } 

    method cobrarSueldo(){
        trabajo.cobrar(self)
        cuentaBancaria.tarjetaCredito().pagarDeudas(mesActual)
    }

    method deudasVencidad() = cuentaBancaria.deudasVencidas()

    method cantidadCompras() = compras.size()

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



// puede que haya objeto cuenta bancaria o class
// tarjeta de credito es entidad
// hay un banco 
