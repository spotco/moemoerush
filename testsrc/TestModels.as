package testsrc {
    import asunit.framework.TestCase;
    import src.models.*;

    public class TestModels extends TestCase {
        public function TestModels(testMethod:String) {
            super(testMethod);
        }

        public function testSongConstructor():void {
            var song:Song = new Song("test", "test", 1, [], []);
            assertEquals(song.title, "test");
            assertEquals(song.artist, "test");
            assertEquals(song.difficulty, 1);
            assertEquals(song.enemies.length, 0);
            assertEquals(song.timingPoints.length, 0);
        }

        public function testEnemyConstructor():void {
            var enemy:Enemy = new Enemy(42, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
            assertEquals(enemy.time, 42);
            assertEquals(enemy.type, EnemyType.ENEMY_EXAMPLE_FOR_TEST_PURPOSES);
        }

        public function testTimingPointConstructor(): void {
            var timingPoint:TimingPoint = new TimingPoint(42, 111, 3);
            assertEquals(timingPoint.time, 42);
            assertEquals(timingPoint.bpm, 111);
            assertEquals(timingPoint.beatsPerMeasure, 3);
        }
    }
}
