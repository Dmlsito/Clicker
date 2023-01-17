package org.example;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import java.util.ArrayList;

public class CiudadesJAXB {

private String nombre;
private String code;
private ArrayList<CiudadesJAXB> listadoCiudades;



public String getNombre(){
    return this.nombre;
}

public String getCode(){
    return this.code;
}

@XmlAttribute(name = "Name")
public void setNombre(String nombre){
    this.nombre = nombre;
}
@XmlAttribute(name = "Code")
public void setCode(String code){
    this.code = code;
}

public ArrayList<CiudadesJAXB> getListadoCiudades(){
    return this.listadoCiudades;
}

    @Override
    public String toString() {
        return
                "nombre='" + nombre + '\'' +
                ", code='" + code + '\'';
    }
}





