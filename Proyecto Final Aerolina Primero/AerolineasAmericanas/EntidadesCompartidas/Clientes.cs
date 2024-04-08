using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Cliente
    {
        private string pasaporte;
        private string contrasenia;
        private string nombre;
        private long tarjeta;

        //propiedades
        public string Pasaporte
        {
            set
            {
                if (value.Trim().Length == 7)
                    pasaporte = value;
                else
                    throw new Exception("El pasaporte debe tener 7 caracteres");
            }
            get { return pasaporte; }
        }

        public string Contrasenia
        {
            set
            {
                if (value.Trim().Length < 5 && value.Trim().Length >= 15)
                    throw new Exception("La contraseña debe de ser de 6 a 15 caracteres.");
                else if (string.IsNullOrEmpty(value))
                    throw new Exception("La contraseña no puede estar vacío.");
            }
            get { return contrasenia; }
        }

        public string Nombre
        {
            set
            {
                if (value.Trim().Length < 30)
                    nombre = value;
                else
                    throw new Exception("El nombre no puede tener más de 30 caracteres");
            }
            get { return nombre; }
        }

        public long Tarjeta
        {
            get { return tarjeta; }
            set
            {
                if (value.ToString().Trim().Length != 15)
                    throw new Exception("La tarjeta debe tener 15 dígitos");

                tarjeta = value;
            }
        }

        public Cliente(string pPasaporte, string pContrasenia, string pNombre, long pTarjeta)
        {
            Pasaporte = pPasaporte;
            Contrasenia = pContrasenia;
            Nombre = pNombre;
            Tarjeta = pTarjeta;
        }
    }
}
