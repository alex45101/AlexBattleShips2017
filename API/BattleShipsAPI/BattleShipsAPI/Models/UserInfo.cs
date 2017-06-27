using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI.Models
{
    public class UserInfo
    {
        [JsonProperty("username")]
        public string Username { get; }
        [JsonProperty("publicId")]
        public Guid? PublicId { get; }

        public UserInfo(string username, Guid? publicId)
        {
            Username = username;
            PublicId = publicId;
        }
    }
}