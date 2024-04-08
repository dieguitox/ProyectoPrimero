using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaCiudades
    {
        public static void AgregarCiudad(Ciudades unC)
        {
            PersistenciaCiudades.AgregarCiudad(unC);
        }

        public static void ModificarCiudad(Ciudades unC)
        {
            PersistenciaCiudades.ModificarCiudad(unC);
        }

        public static void EliminarCiudad(Ciudades unC)
        {
            PersistenciaCiudades.EliminarCiudad(unC);
        }

        public static Ciudades BuscarCiudad(string unC)
        {
            return PersistenciaCiudades.Buscar(unC);
        }
    }
}
