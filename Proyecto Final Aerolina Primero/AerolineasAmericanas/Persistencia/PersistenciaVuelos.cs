using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaVuelos
    {
        public static Vuelos BuscarV(string pCod)
        {
            Vuelos unV = null;
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("BuscarVuelo", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@codV", pCod);

            SqlDataReader oRetorno;

            try
            {
                oConexion.Open();
                oRetorno = oComando.ExecuteReader();

                if (oRetorno.HasRows)
                {
                    while (oRetorno.Read())
                    {
                        DateTime fechaS = (DateTime)oRetorno["FechaS"];
                        DateTime fechaLl = (DateTime)oRetorno["FechaLl"];
                        double precio = (double)oRetorno["Precio"];
                        int asiento = (int)oRetorno["Asientos"];
                        string codA = (string)oRetorno["CodigoA"];
                        string codB = (string)oRetorno["CodigoB"];

                        Aeropuertos codigoA = PersistenciaAeropuertos.Buscar(codA);
                        Aeropuertos codigoB = PersistenciaAeropuertos.Buscar(codB);

                        unV = new Vuelos(pCod, fechaS, fechaLl, precio, asiento, codigoA, codigoB);
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

            return unV;
        }

        public static void AgregarVuelo(Vuelos unV)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("AltaVuelos", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@fechaS", unV.FechaS);
            oComando.Parameters.AddWithValue("@fechaL", unV.FechaLl);
            oComando.Parameters.AddWithValue("@precio", unV.Precio);
            oComando.Parameters.AddWithValue("@asientos", unV.Asientos);
            oComando.Parameters.AddWithValue("@codA", unV.AeroP.CodigoA);
            oComando.Parameters.AddWithValue("@codB", unV.AeroL.CodigoA);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                int resultado = (int)oComando.Parameters["@Retorno"].Value;

                if (resultado == -1)
                    throw new Exception("No existe ese Aeropuerto de salida");
                else if (resultado == -2)
                    throw new Exception("No existe ese Aeropuerto de Llegada");
                else if (resultado == -3)
                    throw new Exception("El vuelo ya esta activo.Cambie nuevamente las fechas.");
                else if (resultado == -4)
                    throw new Exception("Error al dar el alta el Vuelo.");

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

        public static List<Vuelos> ListadeSalida(Aeropuertos unA)
        {
            List<Vuelos> lista = new List<Vuelos>();

            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("ListaVuelosPartidas", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@cod",unA.CodigoA);

            SqlDataReader oRetorno;

            try
            {
                oConexion.Open();
                oRetorno = oComando.ExecuteReader();

                if (oRetorno.HasRows)
                {
                    while (oRetorno.Read())
                    {
                        string codigo = oRetorno["CodigoV"].ToString();
                        DateTime fechaS = Convert.ToDateTime(oRetorno["FechaS"]);
                        DateTime fechaLl = Convert.ToDateTime(oRetorno["FechaLl"]);
                        double precio = Convert.ToDouble(oRetorno["Precio"]);
                        int asiento = Convert.ToInt32(oRetorno["Asientos"]);
                        string codB = (string)oRetorno["CodigoB"];

                        Aeropuertos codigoB = PersistenciaAeropuertos.Buscar(codB);

                        Vuelos unV = new Vuelos(codigo, fechaS, fechaLl, precio, asiento, unA, codigoB);
                        lista.Add(unV);
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

        public static List<Vuelos> ListadeLlegada(Aeropuertos unB)
        {
            List<Vuelos> lista = new List<Vuelos>();
            SqlDataReader oRetorno;

            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("ListaVuelosArribos", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@cod", unB.CodigoA);

            try
            {
                oConexion.Open();
                oRetorno = oComando.ExecuteReader();

                if (oRetorno.HasRows)
                {
                    while (oRetorno.Read())
                    {
                        string codigo = oRetorno["CodigoV"].ToString();
                        DateTime fechaS = Convert.ToDateTime(oRetorno["FechaS"]);
                        DateTime fechaLl = Convert.ToDateTime(oRetorno["FechaLl"]);
                        double precio = Convert.ToDouble(oRetorno["Precio"]);
                        int asiento = Convert.ToInt32(oRetorno["Asientos"]);
                        string codA = (string)oRetorno["CodigoA"];

                        Aeropuertos codigoA = PersistenciaAeropuertos.Buscar(codA);

                        Vuelos unV = new Vuelos(codigo, fechaS, fechaLl, precio, asiento, codigoA, unB);
                        lista.Add(unV);
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
