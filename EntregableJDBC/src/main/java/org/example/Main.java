package org.example;

import com.sun.xml.internal.ws.addressing.WsaActionUtil;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;




public class Main
{
    public static void main( String[] args ) throws SQLException {
        String path = "Ciudades.xml";
       insertarDatos(leerXML(path));
    }

    //Metodo para leer el XML
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



    //Metodo para insertar datos
    public static void executeUpdate(String nombre, String code) throws SQLException{
        Connection c = Conexion.getConnection();
        PreparedStatement p = null;
        try{
            String sql = "INSERT INTO Ciudades (codigo, nombre) VALUES(?,?)";
            p = c.prepareStatement(sql);
            p.setString(1, code);
            p.setString(2, nombre);
            p.executeUpdate();
            System.out.println("La operacion salio con exito");
        }catch(SQLException e){
            System.out.println("Ha ocurrido un problema");
        }finally{
            if(c != null) c.close();
            if(p != null) p.close();
        }
    }

    //Metodo recorrer todas las ciudades del XML()
    public static void insertarDatos(Location location) throws SQLException {

        //Guardamos la hora del sistema a la que empieza
        long inicio = System.currentTimeMillis();
        try{

            for(CountryRegion pais: location.getListadoPaises()){
                //Guardamos los paises que vayamos obteniendo en un objeto pais
                CountryRegion country = pais;
                if(country.getListadoEstados() != null){
                    //Si no esta vacio crearemos un arrayList de estados

                    for(State state: country.getListadoEstados()){
                        //Guardamos los estados que obtengamos en un objeto estado
                        State estado = state;
                        //De la misma que comprobamos si cada pais tiene estados comprobaremos que cada estado tenga ciudades
                        if(estado.getListadoCiudades() != null){
                            //Recorremos todas las ciudades de cada estado
                            for(CiudadesJAXB city: state.getListadoCiudades()){
                                //Por cada ciudad se le pasaran su nombre y su codigo al metodo para insertarlos en la BBDD
                                executeUpdate(city.getNombre(), city.getCode());
                            }}}}}

            long duracion = System.currentTimeMillis() - inicio;
            System.out.println("El tiempo que se ha tardado en hacer esta operacion es de: " + duracion + " ms");

        }catch(SQLException e){
            System.out.println("Ha ocurrido algun error al intentar ingresar los datos");
            throw new RuntimeException(e);
        }
    }

    //Metodo para insertar datos con executeBatch()
    public static void insertarDatosBatch(){}
}
