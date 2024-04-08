using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;


namespace Logica
{
    public class LogicaVuelos
    {
        public static void AgregarVuelo(Vuelos unV) 
        {
            PersistenciaVuelos.AgregarVuelo(unV);
        }

        public static Vuelos BuscarV(string pCod)
        {
            return PersistenciaVuelos.BuscarV(pCod);
        }

        public static List<Vuelos> ListadeSalida(Aeropuertos unA)
        {
            return PersistenciaVuelos.ListadeSalida(unA);
        }

        public static List<Vuelos> ListadeLlegada(Aeropuertos unB)
        {
            return PersistenciaVuelos.ListadeLlegada(unB);
        }
    }
}
