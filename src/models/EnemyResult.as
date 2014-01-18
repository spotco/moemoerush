package src.models {
    public class EnemyResult {

        // Effectively an ENUM to represent each possible type
        public class ResultTypes {
            public static var TYPE_PERFECT:int = 3;
            public static var TYPE_GREAT:int = 3;
            public static var TYPE_OK:int = 3;
            public static var TYPE_MISS:int = 3;
        }

        public class PointValues {
            public static var POINT_VALUE_PERFECT = 500;
            public static var POINT_VALUE_GREAT = 200;
            public static var POINT_VALUE_OK = 50;
            public static var POINT_VALUE_MISS = 0;
        }

        public var type:int;
        public var pointValue:int;
    }
}
