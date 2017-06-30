using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI.Models
{
    public class RoomItem
    {
        [JsonProperty("rowNum")]
        public int RowNum { get; set; }
        [JsonProperty("roomName")]
        public string RoomName { get; set; }
        [JsonProperty("roomId")]
        public Guid RoomId { get; set; }
        [JsonProperty("hostUser")]
        public string HostUser { get; set; }
        [JsonProperty("status")]
        public string Status { get; set; }
        [JsonProperty("isPrivate")]
        public bool IsPrivate { get; set; }
    }
}