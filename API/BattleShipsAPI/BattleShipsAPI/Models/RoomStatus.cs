using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI.Models
{
    public class RoomStatus
    {
        [JsonProperty("name")]
        public string Name { get; set; }
        [JsonProperty("timeCreated")]
        public DateTime TimeCreated { get; set; }
        [JsonProperty("publicRoomId")]
        public Guid PublicRoomId { get; set; }
        [JsonProperty("hostUser")]
        public string HostUser { get; set; }
        [JsonProperty("hostReady")]
        public bool HostReady { get; set; }
        [JsonProperty("joinUser")]
        public string JoinUser { get; set; }
        [JsonProperty("joinReady")]
        public bool JoinReady { get; set; }
        [JsonProperty("statusId")]
        public int StatusId { get; set; }
        [JsonProperty("status")]
        public string Status { get; set; }
        [JsonProperty("isPrivate")]
        public bool IsPrivate { get; set; }
    }
}