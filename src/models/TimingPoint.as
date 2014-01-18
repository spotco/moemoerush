package models {
    public class TimingPoint {
        public var time:int;
        public var bpm:int;
        public var beatsPerMeasure:int;

        public function TimingPoint(time:int, bpm:int, beatsPerMeasure:int) {
            this.time = time;
            this.bpm = bpm;
            this.beatsPerMeasure = beatsPerMeasure;
        }
    }
}

