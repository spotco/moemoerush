package misc {
    import asunit.textui.ResultPrinter; //TODO: remove
    import flash.utils.*;
    import models.*;

    public class BeatMapParser {
        public static function parseBeatmapFile(data:String): Song {

            var map:Dictionary = new Dictionary();         // contains every line in data with key:value format
            var rawTimingPointsArray:Array = new Array();  // contains every line in [TimingPoints] section
            var rawHitObjectsArray:Array = new Array();    // contains every line in [HitObjects] section

            var array:Array = null;
            // I want to die
            if (data.indexOf("\r") == -1) {
                array = data.split("\n");
            } else {
                array = data.split("\r\n");

            }

            var iteratingTimingPoints:Boolean = false;
            var iteratingHitObjects:Boolean = false;

            for (var i:int = 0, len:int = array.length; i < len; i++) {
                var str:String = array[i];

                var index:int = str.indexOf(":");
                // If there is no :, then it means we are reading a section header
                if (index != -1 && !iteratingTimingPoints && !iteratingHitObjects) {
                    map[str.substring(0, index)] = str.substring(index + 1, str.length);
                } else {
                    if (iteratingTimingPoints) {
                        if (str == "") {
                            iteratingTimingPoints = false;
                            continue;
                        }
                        rawTimingPointsArray.push(str);
                    } else if (iteratingHitObjects) {
                        if (str == "") {
                            iteratingHitObjects = false;
                            continue;
                        }
                        rawHitObjectsArray.push(str);
                    }
                    if (str == "[TimingPoints]") {
                        iteratingTimingPoints = true;
                    } else if (str == "[HitObjects]") {
                        iteratingHitObjects = true;
                    }
                }
            }

            var song:Song = new Song(map["Title"], map["Artist"], map["OverallDifficulty"],
                                     parseHitObjects(rawHitObjectsArray),
                                     parseTimingPoints(rawTimingPointsArray));
            return song;
        }

        private static function parseTimingPoints(array:Array):Array {
            var timingPointsArray:Array = new Array();
            var initBPM:Number = 0;

            for (var i:int = 0, len:int = array.length; i < len; i++) {
                if (array[i].indexOf(",") != -1) {
                    var parts:Array = array[i].split(",");
                    var tp:TimingPoint = new TimingPoint(0, 0.0, 0);

                    tp.time = parts[0];
                    if (parts[1] < 0) {
                        tp.bpm = initBPM / (parts[1] / -100.0); // -100 -> 1x bpm, -50 -> 2x bpm, -200 -> 0.5x bpm
                    } else {
                        initBPM = parts[1];
                        tp.bpm = initBPM;
                    }
                    tp.beatsPerMeasure = parts[2];

                    timingPointsArray.push(tp);
                }
            }
            return timingPointsArray;
        }

        private static function parseHitObjects(array:Array):Array {
            var hitObjectsArray:Array = new Array();

            var currentId:int = 0;

            for (var i:int = 0, len:int = array.length; i < len; i++) {
                if (array[i].indexOf(",") != -1) {
                    var parts:Array = array[i].split(",");
                    if (parts.length == 7) {
                        continue;
                    }

                    var enemy:Enemy = new Enemy(0);

                    enemy.time = parts[2];

                    var comboNum:int = parts[3];
                    if (comboNum == 5 || comboNum == 6) {
                        currentId++;
                    }
                    enemy.comboId = currentId;

                    hitObjectsArray.push(enemy);
                 }
            }
            return hitObjectsArray;
        }
    }
}
