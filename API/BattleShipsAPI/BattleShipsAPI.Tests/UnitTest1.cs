using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BattleShipsAPI.Controllers;
using System.Net.Http;
using Newtonsoft.Json;
using System.Threading.Tasks;
using BattleShipsAPI.Models;

namespace BattleShipsAPI.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void RegisterInvokeTest()
        {
            UserController controller = new UserController();
            var result = controller.Register(new UserInfo("test", null));
            Assert.IsNotNull(result.Username, "Username is null");
            Assert.IsNotNull(result.PublicId, "PublicId is null");           
        }

        [TestMethod]
        public async Task RegisterHttpTest()
        {
            HttpClient client = new HttpClient();
            UserInfo info = new UserInfo("test", null);

            var result = await client.PostAsJsonAsync($"http://localhost:60253/api/User/Register", info);
            string response = await result.Content.ReadAsStringAsync();
            var user = JsonConvert.DeserializeObject<UserInfo>(response);
            Assert.IsNotNull(user);
        }

        [TestMethod]
        public void CreateRoomInvokeTest()
        {
            RoomController controller = new RoomController();
            var result = controller.CreateRoom(new RoomInfo("test", Guid.Parse("F0BCA20B-E16E-48B5-9B55-5A5A3553BEB5"), false));
            Assert.IsNotNull(result.Name, "Name is null");
            Assert.IsNotNull(result.HostId, "Guid is null");            
        }

        [TestMethod]
        public async Task CreateroomHttpTest()
        {
            HttpClient client = new HttpClient();
            RoomInfo info = new RoomInfo("test", Guid.Parse("F0BCA20B-E16E-48B5-9B55-5A5A3553BEB5"), false);

            var result = await client.PostAsJsonAsync($"http://localhost:60253/api/Room/Create", info);
            string response = await result.Content.ReadAsStringAsync();
            var room = JsonConvert.DeserializeObject<RoomInfo>(response);
            Assert.IsNotNull(room);
        }
    }
}
