package models {
    import asunit.textui.ResultPrinter;
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

        // Returns the first Enemy. Returns null if there are none.
        public function peekAtFirstEnemy():Enemy {
            if (enemies.length == 0) {
                return null;
            }
            return enemies[0];
        }

        // Removes the first enemy and returns it.
        public function popFirstEnemy():Enemy {
            return enemies.shift();
        }

        // Returns the first Timing Point. Returns null if there are none.
        public function peekAtFirstTimingPoint():TimingPoint {
            if (timingPoints.length == 0) {
                return null;
            }
            return timingPoints[0];
        }

        // Removes the first TimngPoint and returns it.
        public function popFirstTimingPoint():TimingPoint {
            return timingPoints.shift();
        }

        // Given a moment in time, returns and removes returns all enemies that exist in
        // the song before that moment in time. 
        public function popAllEnemiesBeforeMoment(time:int): Array {
            if (enemies.length == 0) {
                return [];
            }

            var results:Array = [];
            var foundEnemyBeyondMoment:Boolean = false;
            while (!foundEnemyBeyondMoment) {
                if (enemies.length > 0 && enemies[0].time < time) {
                    results.push(enemies.shift());
                } else {
                    foundEnemyBeyondMoment = true;
                }
            }
            return results;
        }

    }
}

