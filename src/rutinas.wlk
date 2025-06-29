class Rutina {
    
    method caloriasGastadasEn(tiempo) {
        return self.valorBase() * (tiempo -self.descanso(tiempo)) * self.intensidad()
    }

    method valorBase(){
        return 100
    }

    method descanso(tiempo)

    method intensidad()

}

class Running inherits Rutina {

    const intensidad

    override method intensidad() {
        return intensidad
    }

    override method descanso(tiempo){
        return if (tiempo > 20) {5} else {2}
    }

}

class Maraton inherits Running {
    override method caloriasGastadasEn(tiempo) {
        return super(tiempo) * 2
    }

}

class Remo inherits Rutina {

    override method intensidad(){
        return 1.3
    }
    override method descanso(tiempo){
        return tiempo / 5
    }
}

class RemoCompetitivo inherits Remo {

    override method intensidad(){
        return 1.7
    }

    override method descanso(tiempo){
        return (super(tiempo) -3).max(2)
    }

}