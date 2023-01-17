package org.example;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;

@XmlRootElement(name = "Location")
public class Location {

    private ArrayList<CountryRegion> listadoPaises;





    //Getters

    public ArrayList<CountryRegion> getListadoPaises(){
        return this.listadoPaises;
    }

    @XmlElement(name = "CountryRegion")
    public void setListadoPaises(ArrayList<CountryRegion> listadoPaises){
        this.listadoPaises = listadoPaises;
    }

    @Override
    public String toString() {
        return "" + listadoPaises;
    }

}
