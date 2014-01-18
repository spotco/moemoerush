package testsrc {
    import asunit.framework.TestCase;
    import models.*;

    public class TestModels extends TestCase {
        public function TestModels(testMethod:String) {
            super(testMethod);
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
