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
using System.Web.Http.Cors;

namespace BattleShipsAPI.Controllers
{
    /// <summary>
    /// User-related functions
    /// </summary>
    [RoutePrefix("api/User")]
    [EnableCors("*","*","*")]
    public class UserController : ApiController
    {
        public static readonly string connectionString = ConfigurationManager.ConnectionStrings["gmrskybase"].ConnectionString;

        /// <summary>
        /// Register a new user
        /// </summary>
        /// <param name="userInfo">The users username</param>
        /// <returns>UserInfo model containing public ID and username</returns>
        [Route("Register")]
        [HttpPost]
        public UserInfo Register([FromBody]UserInfo userInfo)
        {
            DataTable table = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_setUser", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@Username", userInfo.Username));

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
            }

            return new UserInfo(table.Rows[0]["Username"].ToString(), table.Rows[0]["PublicUserId"].ToGuid());
        }

        [Route("Ready")]
        [HttpPost]
        public UserReadyStatus Ready([FromBody]UserReadyStatus readyStatus)
        {
            DataTable table = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_changeReadyRoom", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@PublicRoomId", readyStatus.PublicRoomId));
                    command.Parameters.Add(new SqlParameter("@PublicUserId", readyStatus.PublicUserId));
                    command.Parameters.Add(new SqlParameter("@ReadyStatus", readyStatus.ReadyStatus));

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
            }

            return new UserReadyStatus(table.Rows[0]["PublicRoomId"].ToGuid(), table.Rows[0]["PublicUserId"].ToGuid(), table.Rows[0]["ReadyStatus"].ToBool())
            {
                RoomName = table.Rows[0]["RoomName"].ToString(),
                Username = table.Rows[0]["Username"].ToString(),
            };
        }

        [Route("Join")]
        [HttpPost]
        public bool Join([FromBody]UserJoin userJoin)
        {
            DataTable table = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_playerJoin", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@PublicRoomId", userJoin.PublicRoomId));
                    command.Parameters.Add(new SqlParameter("@PublicJoinedId", userJoin.PublicUserId));

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
            }

            if (table.Rows.Count == 0)
            {
                return true;
            }

            return false;
        }

        [Route("Leave")]
        [HttpPost]
        public bool Leave([FromBody]UserJoin userJoin)
        {
            DataTable table = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_playerLeave", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@PublicRoomId", userJoin.PublicRoomId));
                    command.Parameters.Add(new SqlParameter("@PublicUserId", userJoin.PublicUserId));

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
            }

            if (table.Rows[0]["StatusId"].ToInt() == 1)
            {
                return true;
            }

            return false;
        }
    }
}