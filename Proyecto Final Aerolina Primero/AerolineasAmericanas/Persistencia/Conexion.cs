using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia
{
    public class Conexion
    {
        private static string Cnn = "Data Source= .;Initial Catalog = ProyectoFinal1; Integrated Security = true";
        //private static string CNN = "Data Source= (local);Initial Catalog = ProyectoFinal1; Integrated Security = true";
        internal static string CNN
        {
            get { return Cnn; }
        }

    }
}
