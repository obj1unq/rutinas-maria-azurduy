class Rutina {

    method caloriasQuemadas(tiempo) { //consulta 
        return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()

    }
    method intensidad()      //metodos abstractos
    method descanso(tiempo)

} 

class Running inherits Rutina {

    var property intensidad 

    override method intensidad(){ //
        return intensidad     //porque varia cada vez que lo inicializan. 
    }
    
    override method descanso(tiempo) {
        if (tiempo > 20) {5} else {2}
    }
}
//Es un tipo especial de Running con la siguiente diferencia:

//Las calorías que gasta siempre es el doble de una rutina de running común

class Maraton inherits Running  {

    override method caloriasQuemadas(tiempo){
        return super(tiempo) * 2 //? 
    }

}

class Remo inherits Rutina {
    
    override method intensidad(){ //digo que mi rutina es de 1.5.
        return 1.3
    }

    override method descanso(tiempo){
        return tiempo /5
    }

}

class RemoCompeticion inherits Remo{ //Remo(intensidad=1.7){ *opcion1
    
    override method intensidad(){  
        return 1.7
    }

    override method descanso(tiempo){
        return (super(tiempo) - 3).max(2) //super sobre mi base, el tiempo del descanso de remo. 

    }


} 
////////////////////////////////////////////////////////////////////   
class Persona {

    var property peso // podria ser method peso() ?

    method pesoAPerderCon(rutina) {
        return self.caloriasBajadasConRutina(rutina) / self.kilosPorCaloriaQuePierde()

    }  

    method aplicar(rutina){
        self.validarRutina(rutina)
        peso -= self.pesoAPerderCon(rutina)
    }

    method kilosPorCaloriaQuePierde() //depende del tipo de persona en cuestión
    method tiempoQueEjercitaRutina()

    method validarRutina(rutina) {
        if (not self.puedeRealizar(rutina)) {self.error("no puedes hacer esta rutina")}

    }

    method puedeRealizar(rutina) //no siempre pueden hacer una rutina

    method caloriasBajadasConRutina(rutina) { //consulta, RETURNNN
        return rutina.caloriasQuemadas(self.tiempoQueEjercitaRutina())
        //  esto podria ir de una en la tarea pricipal, pero hacer subtarea
    }

}

class Sedentaria inherits Persona {

    const property tiempo 
    
    override method kilosPorCaloriaQuePierde(){
        return 7000
    }

    override method tiempoQueEjercitaRutina() {
        return tiempo
    }

    override method puedeRealizar(rutina) {
        return self.peso() > 50

    }
}

class Atleta inherits Persona {
    const property tiempo = 90

    override method tiempoQueEjercitaRutina() {
        return tiempo
    }
    override method pesoAPerderCon(rutina) { //
        return super(rutina) -1
    }

    override method kilosPorCaloriaQuePierde(){
        return 8000
    }
    
    override method puedeRealizar(rutina) {
        return self.caloriasBajadasConRutina(rutina) > 1000
    }
    
}
////////////////////////////////////////////////////////////////////
class Club {
    const property predios= #{}

    method mejorPredioPara(persona) {
        return predios.max({predio => predio.caloríasQueQuemarianRutinasA(persona)})
    }

    method prediosTranquilosPara(persona){
        return predios.filter({predio => })

    }

    method rutinasMasExigentesPara(persona) {
        return predios.maxp({predio => predio.rutinaMasExigentePara(persona)}) //map(closure) Answers a new collection that contains the result of transforming
                                                                                //each of self collection's elements using a given closure.
    }

}

class Predio {
    const property rutinas=#{}

    method caloríasQueQuemarianRutinasA(persona) {
        return rutinas.sum({rutina => persona.caloriasBajadasConRutina(rutina)})

    }

    method predioQueMasCaloriasQuemaA(persona){
        return rutinas.any({rutina => persona.caloriasBajadasConRutina(rutina) < 500})
    }

    method rutinaMasExigentePara(persona) {
        return rutinas.max({rutina => persona.caloriasBajadasConRutina(rutina)})
        //rutina más exigente es la que más calorías le hace quemar a esa persona                
    }


}