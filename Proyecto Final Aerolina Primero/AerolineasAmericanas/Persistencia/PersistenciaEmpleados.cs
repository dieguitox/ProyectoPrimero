using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using EntidadesCompartidas;


namespace Persistencia
{
    public class PersistenciaEmpleados
    {
        public static Empleados LogueoE(string pUsu, string pPass)
        {
            Empleados unE = null;
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("LoginE", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@usu", pUsu);
            oComando.Parameters.AddWithValue("@pass", pPass);

            try
            {
                oConexion.Open();

                SqlDataReader oRetorno = oComando.ExecuteReader();

                if (oRetorno.HasRows)
                {
                    while (oRetorno.Read())
                    {
                        unE = new Empleados(pUsu, pPass, (string)oRetorno["Nombre"], (string)oRetorno["Puesto"]);
                    }
                }

                oRetorno.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oConexion.Close();
            }

            return unE;
        }
    }
}
