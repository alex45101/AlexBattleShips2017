using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI.Models
{
    public class UserReadyStatus
    {
        [JsonProperty("roomName")]
        public string RoomName { get; set; }
        [JsonProperty("publicRoomId")]
        public Guid PublicRoomId { get; set; }
        [JsonProperty("username")]
        public string Username { get; set; }
        [JsonProperty("publicUserId")]
        public Guid PublicUserId { get; set; }     
        [JsonProperty("readyStatus")]
        public bool ReadyStatus { get; set; }

        public UserReadyStatus(Guid publicRoomId, Guid publicUserId, bool readyStatus)
        {
            PublicRoomId = publicRoomId;
            PublicUserId = publicUserId;
            ReadyStatus = readyStatus;
        }
    }
}