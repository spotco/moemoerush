package models {

    // TODO: Remove because this is only for debugging
    import flash.media.Sound;
    import Util;
    import Math;

    public class Song {
        // TODO: Get this damn health code out of the song model
        public static const MAX_HEALTH:int = 10;
        public static const PERFECT_RATIO:Number = 0.33333;

        public var title:String;
        public var artist:String;
        public var difficulty:int; // Between 1 and 10?? ahaha
        public var music:Sound;

        public var savedTimingPoints:Array;
        public var savedEnemies:Array;

        public var enemies:Array;
        public var timingPoints:Array;

        // In-game state fields:
        public var playerHealth:int;

        public function Song(title:String, artist:String, difficulty:int, enemies:Array, timingPoints:Array) {
            this.title = title;
            this.artist = artist;
            this.difficulty = difficulty;
            this.enemies = enemies;
            this.timingPoints = timingPoints;

            // Shallow copies
            this.savedTimingPoints = timingPoints.concat();
            this.savedEnemies = enemies.concat();

            this.playerHealth = MAX_HEALTH;

            assignSides(this.enemies);
            testInvariants();
        }

        // TODO: better patterns for side assignments
        public function assignSides(enemies:Array): void {
            Util.seedRandom(3939);
            for (var i:int = 0; i < enemies.length; i++) {
                var sideId:int = Math.floor(Math.abs(Util.random() * 3));
                if (enemies[i].side == null) {
                    if (sideId == 0) {
                        enemies[i].side = Enemy.SIDE_LEFT;
                    } else if (sideId == 1) {
                        enemies[i].side = Enemy.SIDE_RIGHT;
                    } else if (sideId == 2) {
                        enemies[i].side = Enemy.SIDE_UP;
                    }
                }
            }
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

        // Creates and returns an EnemyResult and associates it with the Enemy
        // nearest in time. Enemies that have already been marked are not
        // considered.  If there is no enemy near enough in time to be
        // considered a reasonable association, returns null.
        //
        // Arguments:
        //     time: The moment in time that the press occurred in Milliseconds.
        //     enemySide: The direction of enemy to attempt to mark. See Enemy.SIDE_*
        public function markEnemy(time:Number, enemySide:String): EnemyResult {
            var applicableTimingPoint:TimingPoint = getTimingPointForTime(time);

            // One quarter note - in milliseconds
            var timeMargin:Number = applicableTimingPoint.getBPMAsMillisecondsPerBeat();

            // Find the two enemies on either side of the press time
            var frontEnemy:Enemy = null;
            var backEnemy:Enemy = null;
            var markedEnemy:Enemy = null;

            for (var i:int = 0; i < savedEnemies.length; i++) {
                if (savedEnemies[i].side == enemySide && !savedEnemies[i].hasBeenMarked()
                    && Math.abs(savedEnemies[i].time - time) <= timeMargin) {
                    if (savedEnemies[i].time < time) {
                        frontEnemy = savedEnemies[i];
                    } else if (savedEnemies[i].time >= time) {
                        backEnemy = savedEnemies[i];
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
                var timeDifference:Number = Math.abs(markedEnemy.time - time);
                var differenceRatio:Number = ( timeDifference / timeMargin);
                var resultType:String = null;

                if (differenceRatio <= 0.33333) {
                    resultType = EnemyResult.TYPE_PERFECT;
                } else if (differenceRatio <= 0.66666) {
                    resultType = EnemyResult.TYPE_GREAT;
                } else {
                    resultType = EnemyResult.TYPE_OK;
                }

                var enemyResult:EnemyResult = new EnemyResult(resultType, markedEnemy);
                markedEnemy.enemyResult = enemyResult;
                return enemyResult;
            }

            return null;
        }

        public function damageHealth(): void {
            this.playerHealth -= 1;
        }

        public function recoverHealth(): void {
            this.playerHealth += 1;
        }

        /************************************************************************************
         * Really just used as internal utility, public because it makes it easier to test. *
         ************************************************************************************/

        // Given a time, returns the timing point who's values affect this time.
        // Returns null if there are no timing points at all.
        public function getTimingPointForTime(time:int): TimingPoint {
            var mostRecentTimingPoint:TimingPoint = null;
            for (var i:int = 0; i < timingPoints.length; i++) {
                if (timingPoints[i].time <= time) {
                    mostRecentTimingPoint = timingPoints[i];
                } else {
                    if (!mostRecentTimingPoint) {
                        mostRecentTimingPoint = timingPoints[i];
                    }
                    break;
                }
            }
            return mostRecentTimingPoint;
        }

        public function testInvariants(): void {
            for (var i:int = 0; i < enemies.length; i++) {
                Util.assert(enemies[i].side != -1);
            }

            for (i = 0; i < timingPoints.length; i++) {
                Util.assert(timingPoints[i].bpm > 0);
            }
        }
    }
}

