using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Aeropuertos
    {
        //atributos
        private string codigoA;
        private string nombreA;
        private string direcion;
        private double impuestoPar;
        private double impuestoLleg;
        //atributos de asociacion
        private Ciudades codigo;

        public string CodigoA
        {
            get { return codigoA; }
            set
            {
                if (value.Length != 3)
                {
                    throw new Exception("El código del aeropuerto debe de contener 3 letras");
                }
                else if (value.Trim().Length == 3)
                {
                    for (int i = 0; i < value.Length; i++)
                    {
                        if (!char.IsLetter(value, i))
                            throw new Exception("Los valores del código del aeropuerto deben ser letras");
                    }
                }

                codigoA = value;
            }
        }

        public string NombreA
        {
            get { return nombreA; }
            set
            {
                if (value.Trim().Length < 3 || value.Trim().Length > 20)
                    throw new Exception("Nombre de Aeropuerto no puede tener menos de 3 caracteres ni más de 20");
                else if (string.IsNullOrEmpty(value))
                    throw new Exception("El nombre del aeropuerto no puede estar vacío.");

                nombreA = value; ;
            }
        }

        public string Direccion
        {
            get { return direcion; }
            set
            {
                if (value.Trim().Length < 3 || value.Trim().Length > 30)
                    throw new Exception("La direccion no puede tener menos de 3 caracteres ni más de 20");
                else if (string.IsNullOrEmpty(value))
                    throw new Exception("La dirección no puede estar vacía.");

                direcion = value;
            }
        }

        public double ImpuestoPar
        {
            get { return impuestoPar; }
            set
            {
                if (value < 0)
                {
                    throw new Exception("El impuesto de partida no son negativos");
                }
                else
                    impuestoPar = value;
            }
        }

        public double ImpuestoLleg
        {
            get { return impuestoLleg; }
            set
            {
                if (value < 0)
                {
                    throw new Exception("El impuesto de llegada no son negativos");
                }
                else
                    impuestoLleg = value;
            }
        }

        public Ciudades unaC
        {
            get { return codigo; }
            set
            {
                if (value == null)
                {
                    throw new Exception("Los aeropuertos deben corresponder a una ciudad");
                }
                else
                    codigo = value;
            }
        }

        public Aeropuertos(string pCodigoA, string pNombre, string pDirecion, double pImpuertoPar, double pImpuestoLleg, Ciudades pCodigo)
        {
            CodigoA = pCodigoA;
            NombreA = pNombre;
            Direccion = pDirecion;
            ImpuestoPar = pImpuertoPar;
            ImpuestoLleg = pImpuestoLleg;
            unaC = pCodigo;
        }
    }
}
