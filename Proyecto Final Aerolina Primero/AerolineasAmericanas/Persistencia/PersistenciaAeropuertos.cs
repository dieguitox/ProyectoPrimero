using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaAeropuertos
    {
        public static Aeropuertos Buscar(string pCod)
        {
            Aeropuertos unA = null;
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("BuscarAeropuerto", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@cod", pCod);

            SqlDataReader oRetorno;

            try
            {
                oConexion.Open();
                oRetorno = oComando.ExecuteReader();
                if (oRetorno.HasRows)
                {
                    while (oRetorno.Read())
                    {
                        string nombre = (string)oRetorno["NombreA"];
                        string direccion = (string)oRetorno["Direccion"];
                        double impuestoPar = (double)oRetorno["ImpuestoPar"];
                        double impuestoLleg = (double)oRetorno["ImpuestoLleg"];
                        string cod = (string)oRetorno["CodigoC"];

                        Ciudades codigoC = PersistenciaCiudades.Buscar(cod);

                        unA = new Aeropuertos(pCod, nombre, direccion, impuestoPar, impuestoLleg, codigoC);
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

            return unA;
        }

        public static void AgregarAeropuerto(Aeropuertos unA)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("AltaAeropuerto", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@cod", unA.CodigoA);
            oComando.Parameters.AddWithValue("@nom", unA.NombreA);
            oComando.Parameters.AddWithValue("@dir", unA.Direccion);
            oComando.Parameters.AddWithValue("@partida", unA.ImpuestoPar);
            oComando.Parameters.AddWithValue("@llegada", unA.ImpuestoLleg);
            oComando.Parameters.AddWithValue("@ciu", unA.unaC.Codigo);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                int resultado = (int)oComando.Parameters["@retorno"].Value;

                if (resultado == -1)
                    throw new Exception("Ya existe ese Aeropuerto");
                else if (resultado == -2)
                    throw new Exception("No existe la Ciudad. No se puede dar de alta el Aeropuerto");
                else if (resultado == -2)
                    throw new Exception("Error al dar el alta el Aeropuerto.");

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

        public static void ModificarAeropuerto(Aeropuertos unA)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("ModificarAeropuerto", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@cod", unA.CodigoA);
            oComando.Parameters.AddWithValue("@nom", unA.NombreA);
            oComando.Parameters.AddWithValue("@dir", unA.Direccion);
            oComando.Parameters.AddWithValue("@partida", unA.ImpuestoPar);
            oComando.Parameters.AddWithValue("@llegada", unA.ImpuestoLleg);
            oComando.Parameters.AddWithValue("@CodC", unA.unaC.Codigo);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                int resultado = (int)oComando.Parameters["@retorno"].Value;

                if (resultado == -1)
                    throw new Exception("No existe el Aeropuerto ");
                else if (resultado == -2)
                    throw new Exception("No existe la ciudad.");
                else if (resultado == -2)
                    throw new Exception("Error al modificar el Aeropuerto.");

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

        public static void EliminarAeropuerto(Aeropuertos unA)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("BajaAeropuerto", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@cod", unA.CodigoA);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                int resultado = (int)oComando.Parameters["@retorno"].Value;

                if (resultado == -1)
                    throw new Exception("No existe el Aeropuerto a eliminar");
                else if (resultado == -2)
                    throw new Exception("Tiene viajes asociados. No se puede eliminar el Aeropuerto");
                else if (resultado == -3)
                    throw new Exception("Error al eliminar el Aeropuerto .");

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

        public static List<Aeropuertos> Listar()
        {
            List<Aeropuertos> lista = new List<Aeropuertos>();

            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("ListarAeropuerto", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            SqlDataReader oRetorno;

            try
            {
                oConexion.Open();
                oRetorno = oComando.ExecuteReader();

                if (oRetorno.HasRows)
                {
                    while (oRetorno.Read())
                    {
                        string codigoA = (string)oRetorno["CodigoA"];
                        string nombre = (string)oRetorno["NombreA"];
                        string direccion = (string)oRetorno["Direccion"];
                        double impuestoPar = (double)oRetorno["ImpuestoPar"];
                        double impuestoLleg = (double)oRetorno["ImpuestoLleg"];
                        string cod = (string)oRetorno["CodigoC"];

                        Ciudades codigoC = PersistenciaCiudades.Buscar(cod);

                        Aeropuertos unA = new Aeropuertos(codigoA, nombre, direccion, impuestoPar, impuestoLleg, codigoC);
                        lista.Add(unA);
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
            return lista;
        }
    }
}
