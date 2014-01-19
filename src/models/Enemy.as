package models {
    public class Enemy {
        // Type acts as an ENUM for the different enemy possibilities.
        public static const TYPE_EXAMPLE_FOR_TEST_PURPOSES:String = "TYPE_EXAMPLE_FOR_TEST_PURPOSES";
        public static const TYPE_HELICOPTER:String = "TYPE_HELICOPTER";
        public static const TYPE_JET_FIGHTER:String = "TYPE_JET_FIGHTER";
        public static const TYPE_PARACHUTE_GUY:String = "TYPE_PARACHUTE_GUY";

        public static const SIDE_DOWN:String = "SIDE_DOWN";
        public static const SIDE_UP:String = "SIDE_UP";
        public static const SIDE_LEFT:String = "SIDE_LEFT";
        public static const SIDE_RIGHT:String = "SIDE_RIGHT";

        public var time:int;
        public var type:String;
        public var side:String;

        // This field should only have a reference once the enemy is marked
        public var enemyResult:EnemyResult;

        public function Enemy(time:int, type:String = null) {
            this.time = time;
            this.type = type;
        }

        public function hasBeenMarked(): Boolean {
            return enemyResult != null;
        }
    }
}

