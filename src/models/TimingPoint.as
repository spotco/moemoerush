package models {
    public class TimingPoint {

        public var time:int; // Milliseconds
        public var bpm:Number;
        public var beatsPerMeasure:int;

        public function TimingPoint(time:int, bpm:Number, beatsPerMeasure:int) {
            this.time = time;
            this.bpm = bpm;
            this.beatsPerMeasure = beatsPerMeasure;
        }

        public function getBPMAsMillisecondsPerBeat(): Number  {
            return (1000 / (this.bpm / 60));
        }
    }
}

