package org.example;

import javax.xml.bind.annotation.XmlElement;
import java.util.ArrayList;
import java.util.zip.CheckedOutputStream;

public class CountryRegion {

   private  ArrayList<State> listadoEstados;

    public CountryRegion(){}



    @XmlElement(name = "State")
    public void setListadoEstados(ArrayList<State> listadoEstados){
        this.listadoEstados = listadoEstados;
    }

    public ArrayList<State> getListadoEstados(){
        return this.listadoEstados;
    }


    @Override
    public String toString() {
        return "" +
                 listadoEstados;

    }
}
