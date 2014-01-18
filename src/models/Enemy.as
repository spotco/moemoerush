package models {
    public class Enemy {
        // Type acts as an ENUM for the different enemy possibilities.
        public static const TYPE_EXAMPLE_FOR_TEST_PURPOSES:int = -1;
        public static const TYPE_TWO:int = 1;
        public static const TYPE_ONE:int = 2;
        public static const TYPE_THREE:int = 3;
        public static const TYPE_FOUR:int = 4;

        public var time:int;
        public var type:int;

        public function Enemy(time:int, type:int) {
            this.time = time;
            this.type = type;
        }
    }
}

