using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BattleShipsAPI.Controllers;
using System.Net.Http;
using Newtonsoft.Json;
using System.Threading.Tasks;
using BattleShipsAPI.Models;
using System.Collections.Generic;

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

        [TestMethod]
        public void ReadyInvokeTest()
        {
            UserController controller = new UserController();
            var result = controller.Ready(new UserReadyStatus(Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"), Guid.Parse("F0BCA20B-E16E-48B5-9B55-5A5A3553BEB5"), true));
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public async Task ReadyHttpTest()
        {
            HttpClient client = new HttpClient();
            UserReadyStatus status = new UserReadyStatus(Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"), Guid.Parse("F0BCA20B-E16E-48B5-9B55-5A5A3553BEB5"), true);

            var result = await client.PostAsJsonAsync($"http://localhost:60253/api/User/Ready", status);
            string response = await result.Content.ReadAsStringAsync();
            var userReadyStatus = JsonConvert.DeserializeObject<UserReadyStatus>(response);
            Assert.IsNotNull(userReadyStatus);
        }

        [TestMethod]
        public void UserJoinEmptyRoomInvokeTest()
        {
            UserController controller = new UserController();
            var result = controller.Join(new UserJoin(Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"), Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972")));
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void UserJoinFullRoomInvokeTest()
        {
            UserController controller = new UserController();
            var result = controller.Join(new UserJoin(Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"), Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972")));
            Assert.IsFalse(result);
        }

        [TestMethod]
        public async Task UserJoinHttpTest()
        {
            HttpClient client = new HttpClient();
            UserJoin join = new UserJoin(Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"), Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972"));

            var result = await client.PostAsJsonAsync($"http://localhost:60253/api/User/Join", join);
            string response = await result.Content.ReadAsStringAsync();
            var joinReponse = JsonConvert.DeserializeObject<bool>(response);
            Assert.IsNotNull(joinReponse);
        }

        [TestMethod]
        public void UserLeaveInvokeTest()
        {
            UserController controller = new UserController();
            var result = controller.Leave(new UserJoin(Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"), Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972")));
            Assert.IsTrue(result);
        }

        [TestMethod]
        public async Task UserLeaveHttpTest()
        {
            HttpClient client = new HttpClient();
            UserJoin leave = new UserJoin(Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"), Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972"));

            var result = await client.PostAsJsonAsync($"http://localhost:60253/api/User/Leave", leave);
            string response = await result.Content.ReadAsStringAsync();
            var leaveResponse = JsonConvert.DeserializeObject<bool>(response);
            Assert.IsNotNull(leaveResponse);
        }

        [TestMethod]
        public void RoomStatusInvokeTest()
        {
            RoomController controller = new RoomController();
            var result = controller.RoomStatus(Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"));
            Assert.IsNotNull(result);
        }

        //dont look at this
        [TestMethod]
        public async Task RoomStatusHttpTest()
        {
            HttpClient client = new HttpClient();
        }

        [TestMethod]
        public void AddShipInvokeTest()
        {
            BoardController controller = new BoardController();
            var result = controller.AddShipCell(new CellGameBoard {
                PublicRoomId = Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"),
                PublicUserId = Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972"),
                X = 0,
                Y = 0
            });

            Assert.IsTrue(result);
        }

        [TestMethod]
        public async Task AddShipHttpTest()
        {
            HttpClient client = new HttpClient();
            CellGameBoard cell = new CellGameBoard {
                PublicRoomId = Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"),
                PublicUserId = Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972"),
                X = 0,
                Y = 0
            };

            var result = await client.PostAsJsonAsync($"http://localhost:60253/api/Board/AddShipCell", cell);
            string response = await result.Content.ReadAsStringAsync();
            var added = JsonConvert.DeserializeObject<bool>(response);
            Assert.IsNotNull(added);
        }

        [TestMethod]
        public void AddEmptyCellInvokeTest()
        {
            BoardController controller = new BoardController();
            var result = controller.AddEmptyCell(new CellGameBoard
            {
                PublicRoomId = Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"),
                PublicUserId = Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972"),
                X = 2,
                Y = 0
            });

            Assert.IsTrue(result);
        }

        [TestMethod]
        public async Task AddEmptyCellHttpTest()
        {
            HttpClient client = new HttpClient();
            CellGameBoard cell = new CellGameBoard
            {
                PublicRoomId = Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"),
                PublicUserId = Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972"),
                X = 1,
                Y = 0
            };

            var result = await client.PostAsJsonAsync($"http://localhost:60253/api/Board/AddEmptyCell", cell);
            string response = await result.Content.ReadAsStringAsync();
            var added = JsonConvert.DeserializeObject<bool>(response);
            Assert.IsNotNull(added);
        }

        [TestMethod]
        public void AttackInvokeTest()
        {
            BoardController controller = new BoardController();
            var result = controller.Attack(new CellGameBoard
            {
                PublicRoomId = Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"),
                PublicUserId = Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972"),
                X = 0,
                Y = 0
            });

            Assert.IsNotNull(result);
        }

        [TestMethod]
        public async Task AttackHttpTest()
        {
            HttpClient client = new HttpClient();
            CellGameBoard cell = new CellGameBoard
            {
                PublicRoomId = Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"),
                PublicUserId = Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972"),
                X = 0,
                Y = 0
            };

            var result = await client.PostAsJsonAsync($"http://localhost:60253/api/Board/Attack", cell);
            string response = await result.Content.ReadAsStringAsync();
            var added = JsonConvert.DeserializeObject<GameStatus>(response);
            Assert.IsNotNull(added);
        }

        [TestMethod]
        public void GetRoomsInvokeTest()
        {
            RoomController controller = new RoomController();
            var result = controller.GetRooms(1);
            Assert.AreSame(new List<RoomItem>(), result);
        }

        [TestMethod]
        public void GetBoardInkoveTest()
        {
            BoardController controller = new BoardController();
            var result = controller.GetBoard(Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"), Guid.Parse("62978E72-14C0-4A95-AEC0-F3489ABF8972"));
            Assert.AreSame(new List<CellGameBoard>(), result);
        }

        [TestMethod]
        public void GetUsersInRoomInvokeTest()
        {
            RoomController controller = new RoomController();
            var result = controller.GetUsersInRoom(Guid.Parse("9AEBDC07-593A-4345-89DD-7C1E8BA155DF"));
            Assert.IsNotNull(result.Host);
        }
    }
}
