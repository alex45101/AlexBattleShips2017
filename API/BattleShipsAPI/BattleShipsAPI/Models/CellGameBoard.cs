using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI.Models
{
    public class CellGameBoard
    {
        [JsonProperty("publicRoomId")]
        public Guid PublicRoomId { get; set; }
        [JsonProperty("publicUserId")]
        public Guid PublicUserId { get; set; }
        [JsonProperty("X")]
        public int X { get; set; }
        [JsonProperty("Y")]
        public int Y { get; set; }
    }
}