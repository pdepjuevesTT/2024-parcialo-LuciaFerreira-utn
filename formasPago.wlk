import cuentaBancaria.*
class FormaPago{
    var property max
    method criterio(persona,montodeCompra)
    method criterioDisminucion(persona,montoCompra){}
}


class Efectivo inherits FormaPago{
    override method criterio(persona, montodeCompra) = persona.efectivo() > montodeCompra

    override method criterioDisminucion(persona,montoCompra){
        persona.gastarEfectivo(montoCompra)
    }

}

class Debito inherits FormaPago{

    method cumpleConPapeles(persona,monto) = persona.cuentaBancaria().leAlcanza(monto) and persona.cuentaBancaria().esPropietario(persona)


    override method criterio(persona,montodeCompra) = self.cumpleConPapeles(persona, montodeCompra) // hacer falta lo de cumplir con el titular

    override method criterioDisminucion(persona,montoCompra){
        persona.cuentaBancaria().gastarCC(montoCompra)
    }
}

class Tarjeta inherits Debito{} // puede heredar debito, revisar


class CreditoBancario inherits Debito{
    method leDaElCredito(persona) = persona.cantidadCompras() < 50

    override method criterio(persona,montoCompra) = super(persona,montoCompra) and self.leDaElCredito(persona)

}
