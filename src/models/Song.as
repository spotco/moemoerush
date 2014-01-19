package models {

    // TODO: Remove because this is only for debugging
    import asunit.textui.ResultPrinter;
    import Util;
    import Math;

    public class Song {
        public var title:String;
        public var artist:String;
        public var difficulty:int; // Between 1 and 5

        public var enemies:Array;
        public var timingPoints:Array;

        // TODO: Invariant checker for timeMargin.
        // The maximum time away from an Enemy time that an Enemy could qualify
        // for a marking
        public var timeMargin:int;

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

        // Creates and returns an EnemyResult and associates it with the Enemy nearest in time. Enemies that have already been marked are not considered.
        // If there is no enemy near enough in time to be considered a reasonable association, returns null.
        // Arguments:
        //     time: The moment in time that the press occurred.
        //     enemySide: The direction of enemy to attempt to mark. See Enemy.SIDE_*
        public function markEnemy(time:int, enemySide:int): EnemyResult {
            Util.assert(timeMargin != 0);
            // Find the two enemies on either side of the press time
            var frontEnemy:Enemy = null;
            var backEnemy:Enemy = null;
            var markedEnemy:Enemy = null;

            for (var i:int = 0; i < enemies.length; i++) {
                if (enemies[i].side == enemySide && !enemies[i].hasBeenMarked()
                    && Math.abs(enemies[i].time - time) <= timeMargin) {
                    if (enemies[i].time < time) {
                        frontEnemy = enemies[i];
                    } else if (enemies[i].time >= time) {
                        backEnemy = enemies[i];
                        break;
                    }
                }
            }

            if (frontEnemy && backEnemy) {
                if (Math.abs(frontEnemy.time - time) < Math.abs(backEnemy.time - time)) {
                    markedEnemy = frontEnemy;
                } else {
                    markedEnemy = backEnemy;
                }
            } else if (frontEnemy && !backEnemy) {
                markedEnemy = frontEnemy;
            } else if (backEnemy && !frontEnemy) {
                markedEnemy = backEnemy;
            } else {
                markedEnemy = null;
            }

            if (markedEnemy) {
                var timeDifference:int = Math.abs(markedEnemy.time - time);
                // TODO: Have more than just perfect.
                var enemyResult:EnemyResult = new EnemyResult(EnemyResult.TYPE_PERFECT, markedEnemy);
                markedEnemy.enemyResult = enemyResult;
                return enemyResult;
            }

            return null;
        }
    }
}

