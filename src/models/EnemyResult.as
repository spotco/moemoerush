package models {

    import Util;

    public class EnemyResult {
        // Effectively an ENUM to represent each possible type
        public static const TYPE_PERFECT:String = "TYPE_PERFECT";
        public static const TYPE_GREAT:String = "TYPE_GREAT";
        public static const TYPE_OK:String = "TYPE_OK";
        public static const TYPE_MISS:String = "TYPE_MISS";

        public static const POINT_VALUE_PERFECT:int = 500;
        public static const POINT_VALUE_GREAT:int = 200;
        public static const POINT_VALUE_OK:int = 50;
        public static const POINT_VALUE_MISS:int = 0;

        public var type:String;
        public var pointValue:int;
        public var enemy:Enemy;

        // Arguments:
        //     type: One of the ENEMY_RESULT.TYPE_* values.
        //     enemy: A reference to the original Enemy Object that was marked
        public function EnemyResult(type:String, enemy:Enemy) {
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
