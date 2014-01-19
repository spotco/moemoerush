package testsrc {

    import asunit.framework.TestCase;
    import asunit.textui.ResultPrinter;
    import models.*;
    import misc.*;

    public class TestSong extends TestCase {

        public function TestSong(testMethod:String) {
            super(testMethod);
        }

        public function testConstructor():void {
            var song:Song = new Song("test title", "test artist", 1, [], []);
            assertEquals(song.title, "test title");
            assertEquals(song.artist, "test artist");
            assertEquals(song.difficulty, 1);
            assertEquals(song.enemies.length, 0);
            assertEquals(song.timingPoints.length, 0);
        }

        public function testPeekAtFirstEnemy(): void {
            var emptySong:Song = new Song("test", "test", 1, [], []);
            assertEquals(emptySong.peekAtFirstTimingPoint(), null);

            var enemyOne:Enemy = new Enemy(5, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree], []);
            assertEquals(song.peekAtFirstEnemy(), enemyOne);
            assertEquals(song.peekAtFirstEnemy(), enemyOne);
        }

        public function testPopFirstEnemy(): void {
            var enemyOne:Enemy = new Enemy(5, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree], []);
            assertEquals(song.popFirstEnemy(), enemyOne);
            assertEquals(song.popFirstEnemy(), enemyTwo);
            assertEquals(song.popFirstEnemy(), enemyThree);
        }

        public function testPeekAtFirstTimingPoint(): void {
            var emptySong:Song = new Song("test", "test", 1, [], []);
            assertEquals(emptySong.peekAtFirstTimingPoint(), null);

            var timingPointOne:TimingPoint = new TimingPoint(5, 100, 3);
            var timingPointTwo:TimingPoint = new TimingPoint(6, 100, 3);
            var timingPointThree:TimingPoint = new TimingPoint(8, 100, 3);
            var song:Song = new Song("test", "test", 1, [], [timingPointOne, timingPointTwo, timingPointThree]);
            assertEquals(song.peekAtFirstTimingPoint(), timingPointOne);
            assertEquals(song.peekAtFirstTimingPoint(), timingPointOne);
        }

        public function testPopFirstTimingPoint(): void {
            var timingPointOne:TimingPoint = new TimingPoint(5, 100, 3);
            var timingPointTwo:TimingPoint = new TimingPoint(6, 100, 3);
            var timingPointThree:TimingPoint = new TimingPoint(8, 100, 3);
            var song:Song = new Song("test", "test", 1, [], [timingPointOne, timingPointTwo, timingPointThree]);
            assertEquals(song.popFirstTimingPoint(), timingPointOne);
            assertEquals(song.popFirstTimingPoint(), timingPointTwo);
            assertEquals(song.popFirstTimingPoint(), timingPointThree);
        }

        public function testPopAllEnemiesBeforeMoment(): void {
            var emptySong:Song = new Song("test", "test", 1, [], []);
            var emptyEnemies:Array = emptySong.popAllEnemiesBeforeMoment(7);
            assertEquals(emptyEnemies.length, 0);

            var enemyOne:Enemy = new Enemy(5, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree], []);

            var enemiesBeforeSeven:Array = song.popAllEnemiesBeforeMoment(7);
            assertEquals(enemiesBeforeSeven.length, 2);
            assertEquals(enemiesBeforeSeven[0], enemyOne);
            assertEquals(enemiesBeforeSeven[1], enemyTwo);
            assertEquals(song.enemies.length, 1);

            var enemiesBeforeNine:Array = song.popAllEnemiesBeforeMoment(9);
            assertEquals(enemiesBeforeNine.length, 1);
            assertEquals(enemiesBeforeNine[0], enemyThree);
            assertEquals(song.enemies.length, 0);
        }

        public function testMarkEnemy():void {
            // Carefully constructed so that timeMargin will be 2 seconds
            var timingPoint:TimingPoint = new TimingPoint(0, 30, 4);

            var enemyOne:Enemy = new Enemy(5000, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6000, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8000, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyFour:Enemy = new Enemy(10000, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);

            enemyOne.side = Enemy.SIDE_UP;
            enemyTwo.side = Enemy.SIDE_RIGHT;
            enemyThree.side = Enemy.SIDE_RIGHT;
            enemyFour.side = Enemy.SIDE_LEFT;

            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree, enemyFour], [timingPoint]);
 
            // A click to a side with no enemies ever should return nul
            assertEquals(song.markEnemy(1, Enemy.SIDE_DOWN), null);

            // A successful click, and then a click to the same time that has nothing else around itc
            var enemyResult:EnemyResult = song.markEnemy(5000, Enemy.SIDE_UP);
            assertEquals(enemyResult, enemyOne.enemyResult);
            assertEquals(enemyResult.enemy, enemyOne);
            assertEquals(song.markEnemy(5000, Enemy.SIDE_UP), null);

            // Two clicks should mutate the structure and get two different enemies.
            enemyResult = song.markEnemy(6500, Enemy.SIDE_RIGHT);
            assertEquals(enemyResult, enemyTwo.enemyResult);
            assertEquals(enemyResult.enemy, enemyTwo);
            enemyResult = song.markEnemy(6500, Enemy.SIDE_RIGHT);
            assertEquals(enemyResult, enemyThree.enemyResult);
            assertEquals(enemyResult.enemy, enemyThree);

            // A click where there is an enemy around that is too far away should return null
            assertEquals(song.markEnemy(7900, Enemy.SIDE_LEFT), null);
        }

        public function testMarkEnemyScoring():void {
            // Carefully constructed so that timeMargin will be 2 seconds
            var timingPoint:TimingPoint = new TimingPoint(0, 30, 4);

            var enemyOne:Enemy = new Enemy(5000, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);

            enemyOne.side = Enemy.SIDE_UP;
            var song:Song = new Song("test", "test", 1, [enemyOne], [timingPoint]);
            assertEquals(song.markEnemy(5000, Enemy.SIDE_UP).type, EnemyResult.TYPE_PERFECT);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(5500, Enemy.SIDE_UP).type, EnemyResult.TYPE_PERFECT);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(6200, Enemy.SIDE_UP).type, EnemyResult.TYPE_GREAT);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(6400, Enemy.SIDE_UP).type, EnemyResult.TYPE_OK);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(7000, Enemy.SIDE_UP).type, EnemyResult.TYPE_OK);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(4500, Enemy.SIDE_UP).type, EnemyResult.TYPE_PERFECT);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(3800, Enemy.SIDE_UP).type, EnemyResult.TYPE_GREAT);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(3600, Enemy.SIDE_UP).type, EnemyResult.TYPE_OK);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(3000, Enemy.SIDE_UP).type, EnemyResult.TYPE_OK);
        }

        public function testHealth():void {
            var song:Song = new Song("test", "test", 1, [], []);
            assertEquals(song.playerHealth, Song.MAX_HEALTH);
            song.damageHealth();
            assertEquals(song.playerHealth, Song.MAX_HEALTH - 1);
            song.damageHealth();
            assertEquals(song.playerHealth, Song.MAX_HEALTH - 2);
            song.recoverHealth();
            assertEquals(song.playerHealth, Song.MAX_HEALTH - 1);
        }

        public function testGetTimingPointForTime():void  {
            var timingPointOne:TimingPoint = new TimingPoint(5000, 100, 3);
            var timingPointTwo:TimingPoint = new TimingPoint(6000, 100, 3);
            var timingPointThree:TimingPoint = new TimingPoint(8000, 100, 3);
            var song:Song = new Song("test", "test", 1, [], [timingPointOne, timingPointTwo, timingPointThree]);

            assertEquals(song.getTimingPointForTime(0), null);
            assertEquals(song.getTimingPointForTime(5000), timingPointOne);
            assertEquals(song.getTimingPointForTime(5500), timingPointOne);
            assertEquals(song.getTimingPointForTime(6000), timingPointTwo);
            assertEquals(song.getTimingPointForTime(8000), timingPointThree);
            assertEquals(song.getTimingPointForTime(900000), timingPointThree);
        }
    }
}
