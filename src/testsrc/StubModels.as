package testsrc {

    import models.*;
    import Resource;

    public class StubModels {

        public var song:Song;

        public function StubModels() {
            var enemies:Array = [];
            enemies.append(new Enemy(3051));
            enemies.append(new Enemy(3277));
            enemies.append(new Enemy(3502));
            enemies.append(new Enemy(3728));
            enemies.append(new Enemy(3954));
            enemies.append(new Enemy(4179));
            enemies.append(new Enemy(4404));
            enemies.append(new Enemy(4629));
            enemies.append(new Enemy(4856));
            enemies.append(new Enemy(5081));
            enemies.append(new Enemy(5307));
            enemies.append(new Enemy(5532));
            enemies.append(new Enemy(5758));

            var timingPoints:Array = [new TimingPoint(3954,451.127819548872, 1)];
            song = new Song("Stub title", "Stub artist", 5, enemies, timingPoints);
            song.music = Resource.RESC_SONG_MP3;
        }
    }
}
