using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI.Models
{
    public class UsersInRoom
    {
        [JsonProperty("host")]
        public Guid Host { get; set; }
        [JsonProperty("joined")]
        public Guid? Joined { get; set; }
    }
}