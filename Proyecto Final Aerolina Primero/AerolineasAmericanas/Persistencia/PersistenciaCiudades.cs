using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using System.Data;
using System.Data.SqlClient;

namespace Persistencia
{
    public class PersistenciaCiudades
    {
        public static Ciudades Buscar(string unC)
        {
            Ciudades C = null;
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("BuscarCiudades", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@cod", unC);

            SqlDataReader oRetorno;

            try
            {
                oConexion.Open();
                oRetorno = oComando.ExecuteReader();

                if (oRetorno.HasRows)
                {
                    while (oRetorno.Read())
                    {
                        string nombre = (string)oRetorno["NombreC"];
                        string pais = (string)oRetorno["Pais"];

                        C = new Ciudades(unC, nombre, pais);
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

            return C;
        }

        public static void AgregarCiudad(Ciudades unC)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("AltaCiudad", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@cod", unC.Codigo);
            oComando.Parameters.AddWithValue("@nom", unC.Nombre);
            oComando.Parameters.AddWithValue("@pais", unC.Pais);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                int resultado = (int)oComando.Parameters["@retorno"].Value;

                if (resultado == -1)
                    throw new Exception("Ya existe esa ciudad");
                else if (resultado == -2)
                    throw new Exception("Error al dar el alta de ciudad.");

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

        public static void ModificarCiudad(Ciudades unC)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("ModificarCiudad", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@cod", unC.Codigo);
            oComando.Parameters.AddWithValue("@nom", unC.Nombre);
            oComando.Parameters.AddWithValue("@pais", unC.Pais);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                int resultado = (int)oComando.Parameters["@retorno"].Value;

                if (resultado == -1)
                    throw new Exception("No existe esa ciudad");
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

        public static void EliminarCiudad(Ciudades unC)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("BajaCiudad", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@cod", unC.Codigo);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                int resultado = (int)oComando.Parameters["@retorno"].Value;

                if (resultado == -1)
                    throw new Exception("No existe esa ciudad a eliminar");
                else if (resultado == -2)
                    throw new Exception("Tiene Aeropuertos asociados. No se puede eliminar");
                else if (resultado == -3)
                    throw new Exception("Error al eliminar la ciudad.");

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
    }
}
