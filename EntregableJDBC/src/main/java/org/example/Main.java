package org.example;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.util.ArrayList;

/**
 * Hello world!
 *
 */
public class Main
{
    public static void main( String[] args )
    {
     String path = "Ciudades.xml";
     Location location = leerXML(path);
        System.out.println(location);


    }

    public static Location leerXML(String path){

        Location location = null;

        try{
            File file = new File(path);
            if(file.exists()){
                JAXBContext context = JAXBContext.newInstance(Location.class);
                Unmarshaller unmarshaller = context.createUnmarshaller();
                location = (Location) unmarshaller.unmarshal(file);
            }else{
                System.out.println("El fichero no se ha podido encontrar");
            }
        }catch(Exception e){
            System.out.println("Se ha producido un error");
        }
        return location;


    }
}
