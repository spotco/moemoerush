package src.models {
    public class Song {
        public var title:String;
        public var artist:String;
        public var difficulty:int; // Between 1 and 5

        public var enemies:Array;
        public var timingPoints:Array;

        public function Song(title:String, artist:String, difficulty:int, enemies:Array, timingPoints:Array) {
            this.title = title;
            this.artist = artist;
            this.difficulty = difficulty;
            this.enemies = enemies;
            this.timingPoints = timingPoints;
        }
    }
}

