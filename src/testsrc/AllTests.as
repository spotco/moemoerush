package testsrc
{
    import asunit.framework.TestSuite;
    import models.*;

    public class AllTests extends TestSuite
    {
        public function AllTests()
        {
          super();
          addTest(new TestSong("testConstructor"));
          addTest(new TestSong("testGetNextEnemy"));
          addTest(new TestSong("testPopFirstEnemy"));
          addTest(new TestSong("testPopAllEnemiesBeforeMoment"));
          addTest(new TestModels("testEnemyResultConstructor"));
          addTest(new TestModels("testEnemyConstructor"));
          addTest(new TestModels("testTimingPointConstructor"));
        }
    }
}
