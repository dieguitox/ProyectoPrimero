using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;


namespace Logica
{
    public class LogicaClientes
    {
        public static Cliente Buscar(string unP)
        {
            return PersistenciaClientes.Buscar(unP);
        }

        public static void AgregarCliente(Cliente unC)
        {
            PersistenciaClientes.AgregarCliente(unC);
        }

        public static void ModificarCliente(Cliente unC)
        {
            PersistenciaClientes.ModificarCliente(unC);
        }

        public static void EliminarCliente(Cliente unC)
        {
            PersistenciaClientes.EliminarCliente(unC);
        }

        public static Cliente LogueoC(string pUsu, string pPass)
        {
            return PersistenciaClientes.LogueoC(pUsu, pPass);
        }
    }
}
