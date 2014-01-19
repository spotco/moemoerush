package misc {
  import asunit.textui.ResultPrinter; //TODO: remove
  import flash.utils.*;
  import models.*;
 
  public class BeatMapParser {
    public static function parseBeatmapFile(data:String): Song {
      var song:Song = new Song("", "", 0, [], []);

      var map:Dictionary = new Dictionary();         // contains every line in data with key:value format
      var rawTimingPointsArray:Array = new Array();  // contains every line in [TimingPoints] section
      var rawHitObjectsArray:Array = new Array();    // contains every line in [HitObjects] section

      var array:Array = data.split("\n");

      var iteratingTimingPoints:Boolean = false;
      var iteratingHitObjects:Boolean = false;

      for (var i:int = 0, len:int = array.length; i < len; i++) {
        var str:String = array[i];

        var index:int = str.indexOf(":");
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

      song.title = map["Title"];
      song.artist = map["Artist"];
      song.difficulty = map["OverallDifficulty"];
      song.enemies = parseHitObjects(rawHitObjectsArray);
      song.timingPoints = parseTimingPoints(rawTimingPointsArray);

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
            tp.bpm = initBPM;
          } else {
            initBPM = parts[1];
          }
          tp.beatsPerMeasure = parts[2];

          timingPointsArray.push(tp);
        }
      }

      return timingPointsArray;
    }

    private static function parseHitObjects(array:Array):Array {
      var hitObjectsArray:Array = new Array();

      for (var i:int = 0, len:int = array.length; i < len; i++) {
        if (array[i].indexOf(",") != -1) {
          var parts:Array = array[i].split(",");
          var enemy:Enemy = new Enemy(0, 0);

          enemy.time = parts[2];

          hitObjectsArray.push(enemy);
        }
      }

      return hitObjectsArray;
    }

  }
}
