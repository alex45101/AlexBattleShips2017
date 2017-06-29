using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI.Models
{
    public class RoomInfo
    {
        [JsonProperty("name")]
        public string Name { get; set; }
        [JsonProperty("timeCreated")]
        public DateTime TimeCreated { get; set; }
        [JsonProperty("publicId")]
        public Guid? PublicId { get; set; }
        [JsonProperty("hostId")]
        public Guid HostId { get; set; }
        [JsonProperty("joinId")]
        public Guid? JoinId { get; set; }
        [JsonProperty("statusId")]
        public int StatusId { get; set; }
        [JsonProperty("status")]
        public string Status { get; set; }
        [JsonProperty("isPrivate")]
        public bool IsPrivate { get; set; }

        public RoomInfo(string name, Guid hostId, bool isPrivate)
        {
            Name = name;
            HostId = hostId;
            IsPrivate = isPrivate;
        }
    }
}