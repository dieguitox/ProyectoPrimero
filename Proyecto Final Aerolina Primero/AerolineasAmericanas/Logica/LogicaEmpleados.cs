using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;


namespace Logica
{
    public class LogicaEmpleados
    {
        public static Empleados LogueoE(string pUsu, string pPass)
        {
            return PersistenciaEmpleados.LogueoE(pUsu, pPass);
        }
    }
}
