package testsrc {

    import models.*;
    import Resource;

    public class StubModels {

        public var song:Song;

        public function StubModels() {
            var enemies:Array = [];
            enemies.push(new Enemy(3051));
            enemies.push(new Enemy(3277));
            enemies.push(new Enemy(3502));
            enemies.push(new Enemy(3728));
            enemies.push(new Enemy(3954));
            enemies.push(new Enemy(4856));
            enemies.push(new Enemy(5081));
            enemies.push(new Enemy(5307));
            enemies.push(new Enemy(5532));
            enemies.push(new Enemy(5758));
            enemies.push(new Enemy(6660));
            enemies.push(new Enemy(6886));
            enemies.push(new Enemy(7111));
            enemies.push(new Enemy(7337));
            enemies.push(new Enemy(7563));
            enemies.push(new Enemy(8916));
            enemies.push(new Enemy(9367));
            enemies.push(new Enemy(10720));
            enemies.push(new Enemy(11172));
            enemies.push(new Enemy(12074));
            enemies.push(new Enemy(12750));
            enemies.push(new Enemy(12976));
            enemies.push(new Enemy(13427));
            enemies.push(new Enemy(13878));
            enemies.push(new Enemy(14329));
            enemies.push(new Enemy(14781));
            enemies.push(new Enemy(15232));
            enemies.push(new Enemy(15457));
            enemies.push(new Enemy(16134));
            enemies.push(new Enemy(17036));
            enemies.push(new Enemy(17487));
            enemies.push(new Enemy(17938));
            enemies.push(new Enemy(18390));
            enemies.push(new Enemy(18615));
            enemies.push(new Enemy(19292));
            enemies.push(new Enemy(19743));
            enemies.push(new Enemy(20194));
            enemies.push(new Enemy(20645));
            enemies.push(new Enemy(21096));
            enemies.push(new Enemy(21773));
            enemies.push(new Enemy(21999));
            enemies.push(new Enemy(22675));
            enemies.push(new Enemy(22901));
            enemies.push(new Enemy(23578));
            enemies.push(new Enemy(23803));
            enemies.push(new Enemy(24254));
            enemies.push(new Enemy(24705));
            enemies.push(new Enemy(25157));
            enemies.push(new Enemy(25608));
            enemies.push(new Enemy(26284));
            enemies.push(new Enemy(26510));
            enemies.push(new Enemy(27187));
            enemies.push(new Enemy(27412));
            enemies.push(new Enemy(27863));
            enemies.push(new Enemy(28314));


            var timingPoints:Array = [new TimingPoint(3954,451.127819548872, 1)];
            song = new Song("Stub title", "Stub artist", 5, enemies, timingPoints);
            song.music = Resource.RESC_SONG_MP3;
        }
    }
}
