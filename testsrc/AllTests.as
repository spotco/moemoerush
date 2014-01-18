package testsrc
{
    import asunit.framework.TestSuite;

    public class AllTests extends TestSuite
    {
        public function AllTests()
        {
          super();
          addTest(new TestFirstTry("TestIntegerMath"));
          addTest(new TestFirstTry("TestFloatMath"));
        }
    }
}
