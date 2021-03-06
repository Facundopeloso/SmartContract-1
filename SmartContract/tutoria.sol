pragma solidity ^0.4.7;
contract Tutoria {
    
    mapping (address => TutoriaData)  Tutorias;
    
    
    struct TutoriaData {
        string materia;
        address idProfesor;
        address alumno;
        bool isConfirmado;
        bool isCancelado;
    }
    
    function solicitar(string mater, address idProf) public{
        require(msg.sender != idProf);
        TutoriaData t = Tutorias[msg.sender];
        t.materia = mater;
        t.idProfesor = idProf;
        t.alumno = msg.sender;
        t.isConfirmado = false;
        t.isCancelado = false;
        
    }
    
    function getMateria(address key) public view returns (string) {
        return Tutorias[key].materia;
    }
    
    function getIdProfesor(address key) public view returns (address) {
        return Tutorias[key].idProfesor;
    }
    
    function getAlumno(address key) public view returns (address) {
        return Tutorias[key].alumno;
    }
    
    function confirmar(address key) public returns (bool) {
        require(Tutorias[key].idProfesor == msg.sender);
        require(Tutorias[key].isConfirmado == false);
        return Tutorias[key].isConfirmado = true;
    }
    
    function cancelar(address key) public returns (bool) {
        require(Tutorias[key].alumno == msg.sender);
        require(Tutorias[key].isConfirmado == false);
        require(Tutorias[key].isCancelado == false);
        return Tutorias[key].isCancelado = true;
    }
    
    function estaConfirmado(address key) public view returns (bool){
        return Tutorias[key].isConfirmado;
    }
    
    function estaCancelado(address key) public view returns (bool){
        return Tutorias[key].isCancelado;
    }
    
}