package models {

    import Util;

    public class EnemyResult {
        // Effectively an ENUM to represent each possible type
        public static const TYPE_PERFECT:int = 3;
        public static const TYPE_GREAT:int = 2;
        public static const TYPE_OK:int = 1;
        public static const TYPE_MISS:int = 0;

        public static const POINT_VALUE_PERFECT:int = 500;
        public static const POINT_VALUE_GREAT:int = 200;
        public static const POINT_VALUE_OK:int = 50;
        public static const POINT_VALUE_MISS:int = 0;

        public var type:int;
        public var pointValue:int;
        public var enemy:Enemy;

        // Arguments:
        //     type: One of the ENEMY_RESULT.TYPE_* values.
        //     enemy: A reference to the original Enemy Object that was marked
        public function EnemyResult(type: int, enemy:Enemy) {
            this.type = type;
            this.enemy = enemy;
            if (this.type == TYPE_PERFECT) {
                this.pointValue = POINT_VALUE_PERFECT;
            } else if (this.type == TYPE_GREAT) {
                this.pointValue = POINT_VALUE_GREAT;
            } else if (this.type == TYPE_OK) {
                this.pointValue = POINT_VALUE_OK;
            } else if (this.type == TYPE_MISS) {
                this.pointValue = POINT_VALUE_MISS;
            } else {
                Util.assert(false);
            }
        }
    }
}
