package models {
    public class Enemy {
        // Type acts as an ENUM for the different enemy possibilities.
        public static const TYPE_EXAMPLE_FOR_TEST_PURPOSES:int = -1;
        public static const TYPE_HELICOPTER:int = 1;
        public static const TYPE_JET_FIGHTER:int = 2;
        public static const TYPE_PARACHUTE_GUY:int = 3;

        public static const SIDE_UP:int = 1;
        public static const SIDE_DOWN:int = 0;
        public static const SIDE_LEFT:int = 2;
        public static const SIDE_RIGHT:int = 3;

        public var time:int;
        public var type:int;

        // TODO: Invariant checker for side.
        public var side:int;

        // This field should only have a reference once the enemy is marked
        public var enemyResult:EnemyResult;

        public function Enemy(time:int, type:int = 0) {
            this.time = time;
            this.type = type;
        }

        public function hasBeenMarked(): Boolean {
            return enemyResult != null;
        }
    }
}

