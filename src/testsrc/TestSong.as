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

        public function testGetNextEnemy(): void {
            var emptySong:Song = new Song("test", "test", 1, [], []);
            assertEquals(emptySong.getNextEnemy(1), null);

            var enemyOne:Enemy = new Enemy(5, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree], []);
            assertEquals(song.getNextEnemy(1), enemyOne);
            assertEquals(song.getNextEnemy(4), enemyOne);
            assertEquals(song.getNextEnemy(5), enemyOne);
            assertEquals(song.getNextEnemy(6), enemyTwo);
            assertEquals(song.getNextEnemy(7), enemyThree);
            assertEquals(song.getNextEnemy(8), enemyThree);
            assertEquals(song.getNextEnemy(9), null);

        }

        public function testPopFirstEnemy(): void {
            var enemyOne:Enemy = new Enemy(5, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree], []);
            assertEquals(song.popFirstEnemy(), enemyOne);
            assertEquals(song.popFirstEnemy(), enemyTwo);
            assertEquals(song.popFirstEnemy(), enemyThree);
        }

        public function testPopAllEnemiesBeforeMoment(): void {
            var emptySong:Song = new Song("test", "test", 1, [], []);
            var emptyEnemies:Array = emptySong.popAllEnemiesBeforeMoment(7);
            assertEquals(emptyEnemies.length, 0);

            var enemyOne:Enemy = new Enemy(5, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree], []);

            var enemiesBeforeSeven:Array = song.popAllEnemiesBeforeMoment(7);
            assertEquals(enemiesBeforeSeven.length, 2);
            assertEquals(enemiesBeforeSeven[0], enemyOne);
            assertEquals(enemiesBeforeSeven[1], enemyTwo);
            assertEquals(song.enemies.length, 1);

        }

    }
}
