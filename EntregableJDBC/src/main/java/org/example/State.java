package org.example;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import java.util.ArrayList;

public class State {
    private ArrayList<CiudadesJAXB> listadoCiudades;




    //Getters

    public ArrayList<CiudadesJAXB> getListadoCiudades(){
        return this.listadoCiudades;
    }

    //Setters
    @XmlElement(name = "City")
    public void setListadoCiudades(ArrayList<CiudadesJAXB> listadoCiudades){
        this.listadoCiudades =  listadoCiudades;

    }

    @Override
    public String toString() {
        return ""
                 + listadoCiudades;

    }
}
