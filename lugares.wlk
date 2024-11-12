class Localidad{
    var ejercito = []
    method potencialDefensivo() = ejercito.potenciaTotal()
    method serOcupada(unEjercito)
    method desalojar() = ejercito.clear()

}

class Aldea inherits Localidad{
    const property cantidadMaximaHabitantes
    override method serOcupada(unEjercito){
        if(unEjercito.size() > cantidadMaximaHabitantes){
        ejercito = unEjercito.nuevoEjercitoFuerte(10)
        }
    }
}
class Ciudad inherits Localidad{
   override method potencialDefensivo() = super() +300
   override method serOcupada(unEjercito){ejercito=unEjercito}
}

class Ejercito{
    const property personajes = []
    method potenciaTotal()=
           personajes.sum({p=>p.potencialOfensivo()})
    method puedeTomarLocalidad(unaLocalidad) =
    self.potenciaTotal() > 
                             unaLocalidad.potencialDefensivo()
    method invadir(unaLocalidad){
           if (self.puedeTomarLocalidad(unaLocalidad)){
            unaLocalidad.serOcupada(self)
           }
    }
    method nuevoEjercitoFuerte(unaCantidad) {
        const nuevoEjercito = 
        personajes.sortBy({p1,p2 => p1.potencialOfensivo()
                              >p2.potencialOfensivo()})
                              .take(unaCantidad)
    personajes.removeAll(nuevoEjercito)
    return new Ejercito(personajes = nuevoEjercito)
    }
}