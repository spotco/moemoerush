package testsrc {
    import asunit.framework.TestCase;

    public class TestStubModels extends TestCase {
        public function TestStubModels(testMethod:String) {
            super(testMethod);
        }

        public function testStubConstruction():void {
            var stubs:StubModels = new StubModels();
        }
    }
}
