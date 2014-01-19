package testsrc {
    import asunit.framework.TestCase;
    import Resource;

    public class TestMisc extends TestCase {
        public function TestMisc(testMethod:String) {
            super(testMethod);
        }

        public function testResourceAccess():void {
            assertNotNull(Resource.RESC_SONG_MP3);
            assertNotNull(Resource.RESC_SONG_BEATMAP);
        }
    }
}
