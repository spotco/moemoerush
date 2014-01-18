package testsrc
{
    import asunit.framework.TestSuite;
    import src.models.*;

    public class AllTests extends TestSuite
    {
        public function AllTests()
        {
          super();
          addTest(new TestModels("testModels"));
        }
    }
}
