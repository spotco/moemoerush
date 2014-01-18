package models {
    public class Enemy {
        public var time:int;
        public var type:EnemyType;
        public function Enemy(time:int, type:EnemyType) {
            this.time = time;
            this.type = type;
        }
    }
}

