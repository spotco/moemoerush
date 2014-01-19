package misc {
  import flash.utils.*;
  import models.*;
 
  public class BeatMapParser {
    public static function parseBeatmapFile(data:String): Song {
      var song:Song = new Song("", "", 0, [], []);

      var map:Dictionary = new Dictionary();
      var array:Array = data.split("\n");

      var timingPointsArray:Array = new Array();;

      var tpIndex:int;
      for (var i:int = 0, len:int = array.length; i < len; i++) {
        var str:String = array[i];

        tpIndex++;

        var index:int = str.indexOf(":");
        if (index != -1) {
          var parts:Array = str.split(":"); //change to split at first :
          map[parts[0]] = parts[1];
         } else {
          if (str == "[TimingPoints]") {
            break;
          }
        }
      }

      var initBPM:Number = 0;

      for (var j:int = tpIndex, len2 = array.length; j < len2; j++) {
        if (array[j] == "") {
          break;
        }

        if (array[j].indexOf(",") != -1) {
          var nums:Array = array[j].split(",");
          var tp:TimingPoint = new TimingPoint(0, 0.0, 0);

          tp.time = nums[0];
          if (nums[1] < 0) {
            tp.bpm = initBPM;
          } else {
            initBPM = nums[1];
          }
          tp.beatsPerMeasure = nums[2];

          timingPointsArray.push(tp);
        }
      }
      
      song.title = map["Title"];
      song.artist = map["Artist"];
      song.difficulty = map["OverallDifficulty"];
      song.enemies = [];
      song.timingPoints = timingPointsArray;

      return song;
    }
  }
}
