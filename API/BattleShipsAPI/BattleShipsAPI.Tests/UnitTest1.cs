using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BattleShipsAPI.Controllers;

namespace BattleShipsAPI.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void RegisterInvokeTest()
        {
            UserController controller = new UserController();
            var user = controller.Register("test");
            Assert.IsNotNull(user.Username);
            Assert.IsNotNull(user.PublicId);
        }
    }
}
