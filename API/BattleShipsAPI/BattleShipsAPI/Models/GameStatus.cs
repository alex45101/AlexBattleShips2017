using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI.Models
{
    public class GameStatus
    {
        [JsonProperty("statusId")]
        public int StatusId { get; set; }
        [JsonProperty("status")]
        public string Status { get; set; }
    }
}