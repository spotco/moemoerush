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
          addTest(new TestSong("testPeekAtFirstEnemy"));
          addTest(new TestSong("testPopFirstEnemy"));
          addTest(new TestSong("testPeekAtFirstTimingPoint"));
          addTest(new TestSong("testPopFirstTimingPoint"));
          addTest(new TestSong("testPopAllEnemiesBeforeMoment"));
          addTest(new TestSong("testMarkEnemy"));
          addTest(new TestSong("testMarkEnemyScoring"));
          addTest(new TestSong("testHealth"));
          addTest(new TestSong("testGetTimingPointForTime"));
          addTest(new TestModels("testEnemyResultConstructor"));
          addTest(new TestModels("testEnemyConstructor"));
          addTest(new TestModels("testTimingPointConstructor"));
          // addTest(new TestMisc("testResourceAccess"));
        }
    }
}
