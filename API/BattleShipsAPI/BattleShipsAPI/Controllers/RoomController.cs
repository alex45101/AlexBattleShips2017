﻿using BattleShipsAPI.Models;
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

            return new RoomInfo(table.Rows[0]["Name"].ToString(), table.Rows[0]["RoomId"].ToGuid(), table.Rows[0]["IsPrivate"].ToBool());
        }

        [Route("RoomStatus/{publicRoomId}")]
        [HttpGet]
        public RoomStatus RoomStatus(Guid publicRoomId)
        {
            DataTable table = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_getRoom", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@PublicRoomId", publicRoomId));

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
            }

            return new RoomStatus()
            {
                Name = table.Rows[0]["Name"].ToString(),
                TimeCreated = DateTime.Parse(table.Rows[0]["TimeCreated"].ToString()),
                PublicRoomId = table.Rows[0]["RoomId"].ToGuid(),
                HostUser = table.Rows[0]["HostUser"].ToString(),
                HostReady = table.Rows[0]["HostReady"].ToBool(),
                JoinUser = table.Rows[0]["JoinedUser"].ToString(),
                JoinReady = table.Rows[0]["JoinedReady"].ToBool(),
                StatusId = table.Rows[0]["StatusId"].ToInt(),
                Status = table.Rows[0]["Status"].ToString(),
                IsPrivate = table.Rows[0]["IsPrivate"].ToBool() 
            };
        }
    }
}
