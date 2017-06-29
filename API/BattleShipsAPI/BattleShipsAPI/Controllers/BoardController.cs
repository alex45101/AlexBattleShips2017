using BattleShipsAPI.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BattleShipsAPI.Controllers
{
    [RoutePrefix("api/Board")]
    public class BoardController : ApiController
    {
        public static readonly string connectionString = ConfigurationManager.ConnectionStrings["gmrskybase"].ConnectionString;

        [Route("AddShipCell")]
        [HttpPost]
        public bool AddShipCell([FromBody]CellGameBoard cell)
        {
            DataTable table = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_setShipCellGameBoard", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@PublicRoomId", cell.PublicRoomId));
                    command.Parameters.Add(new SqlParameter("@PublicUserId", cell.PublicUserId));
                    command.Parameters.Add(new SqlParameter("@X", cell.X));
                    command.Parameters.Add(new SqlParameter("@Y", cell.Y));

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
            }

            if (table.Rows.Count != 0)
            {
                return true;
            }

            return false;
        }


        [Route("AddEmptyCell")]
        [HttpPost]
        public bool AddEmptyCell([FromBody]CellGameBoard cell)
        {
            DataTable table = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_setEmptyCellGameBoard", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@PublicRoomId", cell.PublicRoomId));
                    command.Parameters.Add(new SqlParameter("@PublicUserId", cell.PublicUserId));
                    command.Parameters.Add(new SqlParameter("@X", cell.X));
                    command.Parameters.Add(new SqlParameter("@Y", cell.Y));

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
            }

            if (table.Rows.Count != 0)
            {
                return true;
            }

            return false;
        }

        [Route("Attack")]
        [HttpPost]
        public GameStatus Attack([FromBody]CellGameBoard cell)
        {
            DataTable table = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_Attack", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@publicRoomId", cell.PublicRoomId));
                    command.Parameters.Add(new SqlParameter("@publicUserId", cell.PublicUserId));
                    command.Parameters.Add(new SqlParameter("@x", cell.X));
                    command.Parameters.Add(new SqlParameter("@y", cell.Y));

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
            }

            return new GameStatus {
                StatusId = table.Rows[0]["StatusId"].ToInt(),
                Status = table.Rows[0]["Status"].ToString()
            };
        }
    }
}
