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

        // Given a time, returns the first enemy that exists beyond or at that moment in time
        // Returns null if there is no enemy that exists beyond that moment in time.
        public function getNextEnemy(time:int): Enemy {
            if (enemies.length == 0) {
                return null;
            }

            // TODO: This is naive and runs in O(n) time, fix it.
            for (var i:int = 0; i < enemies.length; i++) {
                if (enemies[i].time >= time) {
                    return enemies[i];
                }
            }

            return null;
        }

        // Removes the first enemy and returns it.
        public function popFirstEnemy():Enemy {
            return enemies.shift();
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

