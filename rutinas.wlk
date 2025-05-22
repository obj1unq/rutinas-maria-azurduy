class Rutina {

    method caloriasQuemadas(tiempo) {
        return  100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }

    method intensidad()
    method descanso(tiempo)
} 

class Running inherits Rutina {
    var property intensidad

    override method descanso(tiempo){
        if(tiempo > 20) {5}
        else {2}
    }

}

class Maraton inherits Running  {

    override method caloriasQuemadas(tiempo){
        return super(tiempo)*2 //llama al mismo mensaje, y empieza desde la superclase(por herencia), no de la madre

    }

}

class Remo inherits Rutina {

 // const property intensidad =  1.3 //es const porque dice "es siempre" *opcion 1

    override method descanso(tiempo){
        return tiempo / 5

    }

}

class RemoCompeticion inherits Remo(){ //Remo(intensidad=1.7){ *opcion1
    override method intensidad(){
        return 1.7
    }


    override method descanso(tiempo) {
        return super(tiempo)-3.max(2) //o puedo poner 2.max(super(tiempo)-3)
        
    }
     
}