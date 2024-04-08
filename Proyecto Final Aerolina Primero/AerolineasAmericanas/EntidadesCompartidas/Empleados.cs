using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Empleados
    {

        private string usuario;
        private string pass;
        private string nombre;
        private string puesto;

        //propiedades
        public string Usuario
        {
            get { return usuario; }
            set
            {
                if (value.Trim().Length >= 10)
                    throw new Exception("El usuario no puede ser mayor de 10 caracteres.");
                else if (string.IsNullOrEmpty(value))
                    throw new Exception("El Usuario no puede estar vacío.");

                usuario = value;
            }

        }

        public string Contrasenia
        {
            get { return pass; }
            set
            {
                if (value.Trim().Length < 5 && value.Trim().Length >= 15)
                    throw new Exception("La contraseña debe de ser de 6 a 15 caracteres.");
                else if (string.IsNullOrEmpty(value))
                    throw new Exception("La contraseña no puede estar vacío.");

                pass = value;
            }
        }

        public string Nombre
        {
            set
            {
                if (value.Trim().Length > 30)
                    throw new Exception("El nombre no puede ser mayor que 30 caracteres.");
                else if (string.IsNullOrEmpty(value))
                    throw new Exception("El nombre no puede estar vacío.");

                nombre = value;
            }
            get { return nombre; }
        }

        public string Puesto
        {
            get { return puesto; }
            set
            {
                if (string.IsNullOrEmpty(value))
                    throw new Exception("El puesto no puede estar vacio");
                else if (value.ToLower() != "gerente" && value.ToLower() != "vendedor" && value.ToLower() != "admin")
                    throw new Exception("El puesto solamente puede ser Gerente , Vendedor o Admin.");

                puesto = value;
            }
        }

        public Empleados(string pUsuario, string pContrasenia, string pNombre, string pPuesto)
        {
            Usuario = pUsuario;
            Contrasenia = pContrasenia;
            Nombre = pNombre;
            Puesto = pPuesto;
        }

    }
}
