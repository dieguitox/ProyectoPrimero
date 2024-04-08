using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaClientes
    {
        public static Cliente Buscar(string unP)
        {
            Cliente unC = null;
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("BuscarC", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@pasaporte", unP);

            SqlDataReader oRetorno;

            try
            {
                oConexion.Open();
                oRetorno = oComando.ExecuteReader();

                if (oRetorno.HasRows)
                {
                    while (oRetorno.Read())
                    {
                        string pass = (string)oRetorno["Contrasenia"];
                        string nombre = (string)oRetorno["Nombre"];
                        long tarjeta = (long)oRetorno["Tarjeta"];

                        unC = new Cliente(unP, pass,nombre,tarjeta);
                    }
                }

                oRetorno.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                oConexion.Close();
            }

            return unC;
        }

        public static void AgregarCliente(Cliente unC)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("AltaCliente", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@pasaporte", unC.Pasaporte);
            oComando.Parameters.AddWithValue("@nom", unC.Nombre);
            oComando.Parameters.AddWithValue("@pass", unC.Contrasenia);
            oComando.Parameters.AddWithValue("@tarj", unC.Tarjeta);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                int resultado = (int)oComando.Parameters["@retorno"].Value;

                if (resultado == -1)
                    throw new Exception("Ya existe ese Pasaporte");
                else if (resultado == -2)
                    throw new Exception("Error al dar el alta al cliente.");

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                oConexion.Close();
            }
        }

        public static void ModificarCliente(Cliente unC)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("ModificarCliente", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@pasaporte", unC.Pasaporte);
            oComando.Parameters.AddWithValue("@pass", unC.Contrasenia);
            oComando.Parameters.AddWithValue("@nom", unC.Nombre);
            oComando.Parameters.AddWithValue("@tarj", unC.Tarjeta);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                int resultado = (int)oComando.Parameters["@retorno"].Value;

                if (resultado == -1)
                    throw new Exception("No existe esa cliente");
                else if (resultado == -2)
                    throw new Exception("Error al modificar la ciudad.");

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                oConexion.Close();
            }
        }

        public static void EliminarCliente(Cliente unC)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("BajaCliente", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@pasaporte", unC.Pasaporte);


            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                int resultado = (int)oComando.Parameters["@retorno"].Value;

                if (resultado == -1)
                    throw new Exception("No existe el Cliente a eliminar");
                else if (resultado == -2)
                    throw new Exception("Tiene viajes asociados. No se puede eliminar");
                else if (resultado == -3)
                    throw new Exception("Error al eliminar el cliente .");

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                oConexion.Close();
            }
        }

        public static Cliente LogueoC(string pUsu, string pPass)
        {
            Cliente unC = null;

            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("LoginC", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@pasaporte", pUsu);
            oComando.Parameters.AddWithValue("@pass", pPass);

            try
            {
                oConexion.Open();

                SqlDataReader oRetorno = oComando.ExecuteReader();

                if (oRetorno.HasRows)
                {
                    while (oRetorno.Read())
                    {
                        unC = new Cliente(pUsu, pPass, (string)oRetorno["Nombre"], (long)oRetorno["Tarjeta"]);
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

            return unC;
        }
    }
}
