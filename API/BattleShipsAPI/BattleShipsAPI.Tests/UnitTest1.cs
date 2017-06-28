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
            var user = controller.Register(new UserInfo("test", null));
            Assert.IsNotNull(user.Username, "Username is null");
            Assert.IsNotNull(user.PublicId, "PublicId is null");
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
    }
}
