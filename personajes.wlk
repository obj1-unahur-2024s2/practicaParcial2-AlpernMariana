class Personaje{
    var fuerza
    var inteligencia
    var rol
    method cambiarRol(nuevoRol) {rol = nuevoRol}
    method rol() = rol
    method fuerza() = fuerza
    method inteligencia() =inteligencia

    method potencialOfensivo() = fuerza*10 + rol.extra()

}

class Orco inherits Personaje{
    override method potencialOfensivo() = super() *1.1
}
class Humano inherits Personaje{

}

object guerrero {
    method extra() = 100
}

class Cazador{
  const property mascota  
  method extra() = mascota.extra()
  
}
object brujo {
    method extra() = 0
}

class Mascota{
    const property fuerza
    var property edad
    var property tieneGarras

    method aumentarEdad(){edad+=1}
    method extra() =
    if (tieneGarras){fuerza*2}
    else{fuerza}
}