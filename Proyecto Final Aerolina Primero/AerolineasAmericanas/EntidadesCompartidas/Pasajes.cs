using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Pasajes
    {
        //atributos
        private int nroFactura;
        private DateTime fecha;
        private double precioTotal;
        //atributo de asociacion
        private Vuelos codigo;
        private Cliente pasaporte;

        public int NroFactura
        {
            get { return nroFactura; }
            set { nroFactura = value; }
        }

        public DateTime Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }

        public double PrecioTotal
        {
            get { return precioTotal; }
            set
            {
                if (value <= 0)
                {
                    throw new Exception("Los pasajes no se reglan");
                }
                else
                    precioTotal = value;
            }
        }

        public Vuelos unV
        {
            get { return codigo; }
            set
            {
                if (value == null)
                    throw new Exception("El pasaje debe tener un código de vuelo asociado");
                else
                    codigo = value;
            }
        }

        public Cliente unC
        {
            get { return pasaporte; }
            set
            {
                if (value == null)
                    throw new Exception("El pasaje debe tener un pasaporte asociado");
                else
                    pasaporte = value;
            }
        }

        public Pasajes(int pNroFactura, DateTime pFecha, double pPrecio, Vuelos pCodigo, Cliente pPasaporte)
        {
            NroFactura = pNroFactura;
            Fecha = pFecha;
            PrecioTotal = pPrecio;
            unV = pCodigo;
            unC = pPasaporte;
        }
    }
}
