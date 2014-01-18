package testsrc
{
    import asunit.framework.TestSuite;
    import src.models.*;

    public class AllTests extends TestSuite
    {
        public function AllTests()
        {
          super();
          addTest(new TestModels("testSongConstructor"));
          addTest(new TestModels("testEnemyConstructor"));
          addTest(new TestModels("testTimingPointConstructor"));
        }
    }
}
