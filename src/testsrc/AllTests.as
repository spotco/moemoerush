package misc
{
    import asunit.framework.TestSuite;
    import models.*;

    public class AllTests extends TestSuite
    {
        public function AllTests()
        {
          super();
          addTest(new TestSong("testParse"));
        }
    }
}
