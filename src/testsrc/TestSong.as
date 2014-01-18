package testsrc {

    import asunit.framework.TestCase;
    import asunit.textui.ResultPrinter;
    import models.*;

    public class TestSong extends TestCase {

        public function TestSong(testMethod:String) {
            super(testMethod);
        }

        public function testConstructor():void {
            var song:Song = new Song("test", "test", 1, [], []);
            assertEquals(song.title, "test");
            assertEquals(song.artist, "test");
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

    }
}
