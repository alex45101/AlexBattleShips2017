using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI.Models
{
    public class UserJoin 
    {
        [JsonProperty("publicRoomId")]
        public Guid PublicRoomId { get; set; }
        [JsonProperty("publicUserId")]
        public Guid? PublicUserId { get; set; }

        public UserJoin(Guid publicRoomId, Guid? publicUserId)            
        {
            PublicRoomId = publicRoomId;
            PublicUserId = publicUserId;
        }
    }
}