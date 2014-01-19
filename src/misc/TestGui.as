package misc {
  import flash.display.Sprite;
  import asunit.textui.TestRunner;

  public class TestGui extends Sprite {
    public function TestGui() {
      var unittests:TestRunner = new TestRunner();
      stage.addChild(unittests);
      unittests.start(misc.AllTests, null, TestRunner.SHOW_TRACE);
    }
  }
}
