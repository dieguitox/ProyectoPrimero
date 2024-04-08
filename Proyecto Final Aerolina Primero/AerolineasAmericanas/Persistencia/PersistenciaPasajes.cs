using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaPasajes
    {
        public static int AgregarPasaje(Pasajes unP)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("AltaPasaje", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@precio", unP.PrecioTotal);
            oComando.Parameters.AddWithValue("@codigo", unP.unV.CodigoV);
            oComando.Parameters.AddWithValue("@pasaporte", unP.unC.Pasaporte);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);
            int resultado = 0;
            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();
                resultado = (int)oComando.Parameters["@retorno"].Value;

                if (resultado == -1)
                    throw new Exception("No existe el vuelo seleccionado");
                else if (resultado == -2)
                    throw new Exception("El vuelo ya partió.");
                else if (resultado == -3)
                    throw new Exception("No existe el Pasaporte del Cliente");
                else if (resultado == -4)
                    throw new Exception("El avión ya esta lleno.No se puede crear pasaje");
                else if (resultado == -5)
                    throw new Exception("Error al crear el Pasaje.");


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                oConexion.Close();
            }

            return resultado;
        }

        public static List<Pasajes> Historico(Cliente unC)
        {
            List<Pasajes> listaP = new List<Pasajes>();
            SqlConnection oConexion = new SqlConnection(Conexion.CNN);
            SqlCommand oComando = new SqlCommand("HistoricoCompras", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@pasaporte", unC.Pasaporte);

            SqlDataReader oRetorno;
            try
            {
                oConexion.Open();
                oRetorno = oComando.ExecuteReader();

                if (oRetorno.HasRows)
                {
                    while (oRetorno.Read())
                    {
                        int nroFactura = Convert.ToInt32(oRetorno["nroFactura"]);
                        DateTime fecha = Convert.ToDateTime(oRetorno["Fecha"]);
                        double precio = Convert.ToDouble(oRetorno["Precio"]);
                        string codigoV = (string)oRetorno["CodigoV"];

                        Vuelos codV = PersistenciaVuelos.BuscarV(codigoV);

                        Pasajes unP = new Pasajes(nroFactura, fecha, precio, codV, unC);
                        listaP.Add(unP);
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

            return listaP;
        }      
    }
}
