package models {
    public class EnemyResult {

        // Effectively an ENUM to represent each possible type
        public const TYPE_PERFECT:int = 3;
        public const TYPE_GREAT:int = 2;
        public const TYPE_OK:int = 1;
        public const TYPE_MISS:int = 0;

        public static var POINT_VALUE_PERFECT = 500;
        public static var POINT_VALUE_GREAT = 200;
        public static var POINT_VALUE_OK = 50;
        public static var POINT_VALUE_MISS = 0;

        public var type:int;
        public var pointValue:int;

        public 
    }
}
