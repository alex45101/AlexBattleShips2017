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
    [RoutePrefix("api/Room")]
    public class RoomController : ApiController
    {
        public static readonly string connectionString = ConfigurationManager.ConnectionStrings["gmrskybase"].ConnectionString;

        [Route("Create")]
        public RoomInfo CreateRoom([FromBody]RoomInfo roomInfo)
        {
            DataTable table = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_setRoom", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@Name", roomInfo.Name));
                    command.Parameters.Add(new SqlParameter("@PublicHostId", roomInfo.HostId));
                    command.Parameters.Add(new SqlParameter("@IsPrivate", roomInfo.IsPrivate));

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
            }

            return new RoomInfo(table.Rows[0]["Name"].ToString(), Guid.Parse(table.Rows[0]["RoomId"].ToString()), bool.Parse(table.Rows[0]["IsPrivate"].ToString()));
        }        
    }
}
