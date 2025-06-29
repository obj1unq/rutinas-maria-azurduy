class Club {
    const predios = #{}

    method mejorPredioPara(persona) {
        return predios.max({predio => predio.caloriasAlPracticarTodasLasRutinas(persona)})
    }

    method prediosTranquisPara(persona) {
        return predios.filter({predio => predio.tieneRutinaQueGastaMenosDe500A(persona) })
    }

    method rutinasMasExigentesPara(persona) {
        return predios.map({predio => predio.rutinaMasExigentePara(persona)}).asSet()
    }
}

class Predio {
    const rutinas = #{}

    method caloriasAlPracticarTodasLasRutinas(persona) {
        return rutinas.sum({rutina => persona.caloriasQueGasta(rutina)})
    }

    method tieneRutinaQueGastaMenosDe500A(persona){
        return rutinas.any({rutina => persona.caloriasQueGasta(rutina) < 500})
    }

    method rutinaMasExigentePara(persona) {
        return rutinas.max({rutina => persona.caloriasQueGasta(rutina)})
    }
}