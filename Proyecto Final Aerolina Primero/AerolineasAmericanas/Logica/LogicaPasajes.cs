using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaPasajes
    {
        public static int AgregarPasaje(Pasajes unP)
        {
            if (unP.PrecioTotal == 1)
            {
                double llegada = unP.unV.AeroL.ImpuestoLleg;
                double salida = unP.unV.AeroP.ImpuestoPar;
                double precio = unP.unV.Precio;
                double monto = llegada + salida + precio;

                unP.PrecioTotal = monto;
            }

            return PersistenciaPasajes.AgregarPasaje(unP);
        }

        public static List<Pasajes> Historico(Cliente unC)
        {
            return PersistenciaPasajes.Historico(unC);
        }
   }
}
