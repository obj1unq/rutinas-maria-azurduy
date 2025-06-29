import rutinas.*

class Persona {
    var property peso

    method practicar(rutina) {
        self.validar(rutina)
        peso-= self.pesoAPerderCon(rutina)
    }

    method validar(rutina){
        return if (not self.puedePracticar(rutina)) {self.error("No podes practicar rutina")}
    }

    method puedePracticar(rutina) 

    method pesoAPerderCon(rutina) {
        return self.caloriasQueGasta(rutina)  / self.kilosPorCaloriaQuePierde()
    
    }

    method kilosPorCaloriaQuePierde()

    method tiempoEjercicio()

    method caloriasQueGasta(rutina) {
		return rutina.caloriasGastadasEn(self.tiempoEjercicio())
	}


}

class Sedentaria inherits Persona {

    const tiempoEjercicio

    override method tiempoEjercicio() {
        return tiempoEjercicio
    }

    override method puedePracticar(rutina) {
        return peso > 50
    }

    override method kilosPorCaloriaQuePierde(){
        return 7000
    }

}

class Atleta inherits Persona {

    override method pesoAPerderCon(rutina) {
        return super(rutina) -1
    }

    override method tiempoEjercicio(){
        return 90
    }

    override method kilosPorCaloriaQuePierde(){
        return 8000
    }

    override method puedePracticar(rutina) {
        return rutina.caloriasGastadasEn(self.tiempoEjercicio()) > 10000
    }

}