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
                }
            }

            return false;
        }
    }
}
