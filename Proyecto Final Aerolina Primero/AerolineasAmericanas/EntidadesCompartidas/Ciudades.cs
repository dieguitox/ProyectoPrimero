using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Ciudades
    {
        private string codigo;
        private string nombre;
        private string pais;

        //propiedades
        public string Codigo
        {
            get { return codigo; }
            set
            {
                if (value.Trim().Length != 6)
                    throw new Exception("Fomarto de código incorrecto, debe tener 6 letras");
                else if (value.Trim().Length == 6)
                {
                    for (int i = 0; i < value.Length; i++)
                    {
                        if (!char.IsLetter(value, i))
                            throw new Exception("Los valores del código del aeropuerto deben ser letras");
                    }
 
                }

                codigo = value;
            }
        }

        public string Nombre
        {
            get { return nombre; }
            set
            {
                if (value.Trim().Length >= 20)
                    throw new Exception("Formato de nombre incorrecto, no puede estar vacio y debe tener hasta 20 caractéres");
                else if (string.IsNullOrEmpty(value))
                    throw new Exception("El campo del nombre no puede estar vacío");
                nombre = value;
            }
        }

        public string Pais
        {
            get { return pais; }
            set
            {
                if (value.Trim().Length >= 20)
                    throw new Exception("Fomarto de País incorrecto, no puede estar vacio y debe tener hasta 20 caractéres");
                else if (string.IsNullOrEmpty(value))
                    throw new Exception("El campo de país no puede estar vacío");
                pais = value;
            }
        }

        public Ciudades(string pCodigo, string pNombre, string pPais)
        {
            Codigo = pCodigo;
            Nombre = pNombre;
            Pais = pPais;
        }
    }
}
