package testsrc {
    import asunit.framework.TestCase;
    import src.models.*;

    public class TestModels extends TestCase {
        public function TestModels(testMethod:String) {
            super(testMethod);
        }
        public function testModels():void {
            var song:Song = new Song("test", "test", 1, [], []);
            assertEquals(song.title, "test");
            assertEquals(song.artist, "test");
            assertEquals(song.difficulty, 1);
            assertEquals(song.enemies.length, 0);
            assertEquals(song.timingPoints.length, 0);
        }
    }

}
