using BattleShipsAPI.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace BattleShipsAPI.Controllers
{
    [RoutePrefix("api/User")]
    public class UserController : ApiController
    {
        public static readonly string connectionString = ConfigurationManager.ConnectionStrings["gmrskybase"].ConnectionString;        

        [Route("Register")]
        [HttpPost]
        public UserInfo Register([FromBody]UserInfo username)
        {
            DataTable table = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_setUser", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@Username", username.Username));

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }               
            }

            return new UserInfo(table.Rows[0]["Username"].ToString(), Guid.Parse(table.Rows[0]["PublicUserId"].ToString()));
        }
    }
}