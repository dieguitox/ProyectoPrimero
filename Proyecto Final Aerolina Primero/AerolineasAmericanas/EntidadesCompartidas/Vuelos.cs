using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Vuelos
    {
        //atributos
        private string codigoV;
        private DateTime fechaS;
        private DateTime fechaLl;
        private double precio;
        private int cantAsientos;
        //atributos de asociacion
        private Aeropuertos codigoA;
        private Aeropuertos codigoB;

        //propiedades
        public string CodigoV
        {
            get { return codigoV; }
            set { codigoV = value; ; }
        }

        public DateTime FechaS
        {
            get { return fechaS; }
            set { fechaS = value; ;}
        }

        public DateTime FechaLl
        {
            get { return fechaLl; }
            set
            {
                if (value.Date <= fechaS)
                    throw new Exception("La fecha de llegada no puede ser anterior o igual a la de partida");
                else
                    fechaLl = value;
            }
        }

        public double Precio
        {
            get { return precio; }
            set
            {
                if (value <= 0)
                    throw new Exception("Los pasajes no se reglan");
                else
                    precio = value;
            }
        }

        public int Asientos
        {
            get { return cantAsientos; }
            set
            {
                if (value >= 100 && value <= 300)
                    cantAsientos = value;
                else
                    throw new Exception("Los asientos deben tener mínimo 100 pasajes y hasta 300");

            }
        }

        public Aeropuertos AeroP
        {
            get { return codigoA; }
            set
            {
                if (value == null)
                    throw new Exception("Debe tener un Aeropuerto de Partida asociado");
                else
                    codigoA = value;
            }
        }

        public Aeropuertos AeroL
        {

            get { return codigoB; }
            set
            {
                if (value == null)
                    throw new Exception("Debe tener un Aeropuerto de Llegada asociado");
                else if (value.CodigoA.ToString() == codigoA.CodigoA.ToString())
                    throw new Exception("El aeropuerto de llegada no puede coincidir con el de salida");
                else
                    codigoB = value;
            }
        }

        public Vuelos(string pCodigoV, DateTime pFechaS, DateTime pFechaLl, double pPrecio, int pAsiento, Aeropuertos pCodigoA, Aeropuertos pCodigoB)
        {
            CodigoV = pCodigoV;
            FechaS = pFechaS;
            FechaLl = pFechaLl;
            Precio = pPrecio;
            Asientos = pAsiento;
            AeroP = pCodigoA;
            AeroL = pCodigoB;
        }
    }
}
