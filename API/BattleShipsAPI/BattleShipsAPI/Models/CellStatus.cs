using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI.Models
{
    public class CellStatus
    {
        [JsonProperty("statusId")]
        public int StatusId { get; set; }
        [JsonProperty("status")]
        public string Status { get; set; }
        [JsonProperty("isShip")]
        public bool IsShip { get; set; }
        [JsonProperty("isHit")]
        public bool IsHit { get; set; }
    }
}