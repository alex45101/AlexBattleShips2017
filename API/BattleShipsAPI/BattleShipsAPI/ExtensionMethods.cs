using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BattleShipsAPI
{
    public static class ExtensionMethods
    {
        public static Guid ToGuid(this object thing)
        {
            return Guid.Parse(thing.ToString());
        }

        public static bool ToBool(this object thing)
        {
            return bool.Parse(thing.ToString());
        }

        public static int ToInt(this object thing)
        {
            return int.Parse(thing.ToString());
        }
    }
}