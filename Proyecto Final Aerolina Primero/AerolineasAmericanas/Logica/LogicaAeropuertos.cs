using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;


namespace Logica
{
    public class LogicaAeropuertos
    {
        public static Aeropuertos Buscar(string pCod)
        {
            return PersistenciaAeropuertos.Buscar(pCod);
        }

        public static void AgregarAeropuerto(Aeropuertos unA)
        {
            PersistenciaAeropuertos.AgregarAeropuerto(unA);
        }

        public static void ModificarAeropuerto(Aeropuertos unA)
        {
            PersistenciaAeropuertos.ModificarAeropuerto(unA);
        }

        public static void EliminarAeropuerto(Aeropuertos unA)
        {
            PersistenciaAeropuertos.EliminarAeropuerto(unA);
        }

        public static List<Aeropuertos> Listar()
        {
            return PersistenciaAeropuertos.Listar();
        }
    }
}
