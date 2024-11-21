import cuentaBancaria.*
class FormaPago{
    var property max

    method criterio(persona,montodeCompra)
}


class Efectivo inherits FormaPago{
    var property efectivo
    override method criterio(persona, montodeCompra) = persona.efectivo() > montodeCompra

}

class Debito inherits FormaPago{
    const property cuentaBancaria 

    override method criterio(persona,montodeCompra){
        persona.cuentaBancaria().leAlcanza(montodeCompra) // hacer
    }
}

class Tarjeta inherits FormaPago{
    override method criterio(persona,montodeCompra) {
      persona.CuentaBancaria().tarjeta().leAlcanza(montodeCompra)
    }
}
