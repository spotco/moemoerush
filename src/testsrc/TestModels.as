package testsrc {
    import asunit.framework.TestCase;
    import models.*;

    public class TestModels extends TestCase {
        public function TestModels(testMethod:String) {
            super(testMethod);
        }


        public function testEnemyConstructor():void {
            var enemy:Enemy = new Enemy(42, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            assertEquals(enemy.time, 42);
            assertEquals(enemy.type, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
        }

        public function testEnemyResultConstructor():void {
            var enemy:Enemy = new Enemy(42, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);

            var enemyPerfect:EnemyResult = new EnemyResult(EnemyResult.TYPE_PERFECT, enemy);
            var enemyGreat:EnemyResult = new EnemyResult(EnemyResult.TYPE_GREAT, enemy);
            var enemyOk:EnemyResult = new EnemyResult(EnemyResult.TYPE_OK, enemy);
            var enemyMiss:EnemyResult = new EnemyResult(EnemyResult.TYPE_MISS, enemy);

            assertEquals(enemyPerfect.type, EnemyResult.TYPE_PERFECT);
            assertEquals(enemyGreat.type, EnemyResult.TYPE_GREAT);
            assertEquals(enemyOk.type, EnemyResult.TYPE_OK);
            assertEquals(enemyMiss.type, EnemyResult.TYPE_MISS);

            assertEquals(enemyPerfect.pointValue, EnemyResult.POINT_VALUE_PERFECT);
            assertEquals(enemyGreat.pointValue, EnemyResult.POINT_VALUE_GREAT);
            assertEquals(enemyOk.pointValue, EnemyResult.POINT_VALUE_OK);
            assertEquals(enemyMiss.pointValue, EnemyResult.POINT_VALUE_MISS);

            assertEquals(enemyPerfect.enemy , enemy);
            assertEquals(enemyGreat.enemy, enemy);
            assertEquals(enemyOk.enemy, enemy);
            assertEquals(enemyMiss.enemy, enemy);
        }

        public function testTimingPointConstructor(): void {
            var timingPoint:TimingPoint = new TimingPoint(42, 111, 3);
            assertEquals(timingPoint.time, 42);
            assertEquals(timingPoint.bpm, 111);
            assertEquals(timingPoint.beatsPerMeasure, 3);
        }
    }
}
