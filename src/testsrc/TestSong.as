package testsrc {

    import asunit.framework.TestCase;
    import asunit.textui.ResultPrinter;
    import models.*;
    import misc.*;

    public class TestSong extends TestCase {

        public function TestSong(testMethod:String) {
            super(testMethod);
        }

        public function testConstructor():void {
            var song:Song = BeatMapParser.parseBeatmapFile("osu file format v9\n[General]\nAudioFilename: Drop.mp3\nAudioLeadIn: 0\nPreviewTime: 75001\nCountdown: 0\nSampleSet: Soft\nStackLeniency: 0.7\nMode: 0\nLetterboxInBreaks: 0\n\n[Editor]\nBookmarks: 18384,32820,46805,60790,75001,89662,122820,136805,151016,165452,184399,198835,212369,226805,245752\nDistanceSpacing: 1\nBeatDivisor: 4\nGridSize: 8\n\n[Metadata]\nTitle:Drop\nArtist:ClariS\nCreator:Fight69\nVersion:Hard\nSource:\nTags:LRJ Alice Clara kz livetune _LRJ_\n\n[Difficulty]\nHPDrainRate:6\nCircleSize:4\nOverallDifficulty:7\nApproachRate:7\nSliderMultiplier:1.6\nSliderTickRate:1\n\n[Events]\n//Background and Video events\n0,0,\"claris.jpg\"\n//Break Periods\n2,112424,121926\n2,184605,197264\n2,199041,204482\n2,205808,208317\n//Storyboard Layer 0 (Background)\n//Storyboard Layer 1 (Fail)\n//Storyboard Layer 2 (Pass)\n//Storyboard Layer 3 (Foreground)\n//Storyboard Sound Samples\n//Background Colour Transformations\n3,100,163,162,255\n\n[TimingPoints]\n3954,451.127819548872,4,2,0,75,1,0\n76134,-100,4,2,0,75,0,1\n89668,-100,4,2,0,75,0,0\n90570,-100,4,2,0,75,0,1\n104211,-100,4,2,0,0,0,1\n104437,-100,4,2,0,75,0,1\n108615,-100,4,2,0,75,0,0\n108841,-100,4,2,0,70,0,0\n109066,-100,4,2,0,65,0,0\n109292,-100,4,2,0,60,0,0\n109517,-100,4,2,0,55,0,0\n109743,-100,4,2,0,50,0,0\n109969,-100,4,2,0,45,0,0\n110194,-100,4,2,0,40,0,0\n110420,-100,4,2,0,35,0,0\n110645,-100,4,2,0,30,0,0\n110871,-100,4,2,0,25,0,0\n111096,-100,4,2,0,20,0,0\n111322,-100,4,2,0,15,0,0\n111547,-100,4,2,0,10,0,0\n111773,-100,4,2,0,5,0,0\n112106,-100,4,2,0,0,0,0\n112331,-100,4,2,0,75,0,0\n151918,-100,4,2,0,75,0,1\n165452,-100,4,2,0,75,0,0\n166354,-100,4,2,0,75,0,1\n184399,-100,4,2,0,75,0,0\n212031,-100,4,2,0,0,0,0\n212256,-100,4,2,0,75,0,0\n213277,-100,4,2,0,75,0,1\n226811,-100,4,2,0,75,0,0\n227713,-100,4,2,0,75,0,1\n241354,-100,4,2,0,0,0,1\n241579,-100,4,2,0,75,0,1\n245758,-100,4,2,0,75,0,0\n246209,-100,4,2,0,70,0,0\n246435,-100,4,2,0,65,0,0\n246660,-100,4,2,0,60,0,0\n246886,-100,4,2,0,55,0,0\n247111,-100,4,2,0,50,0,0\n247337,-100,4,2,0,45,0,0\n247563,-100,4,2,0,40,0,0\n247788,-100,4,2,0,35,0,0\n248014,-100,4,2,0,30,0,0\n248239,-100,4,2,0,25,0,0\n248465,-100,4,2,0,20,0,0\n248690,-100,4,2,0,15,0,0\n248916,-100,4,2,0,10,0,0\n249141,-100,4,2,0,5,0,0\n249249,-100,4,2,0,0,0,0\n\n[Colours]\nCombo1 : 105,75,90\nCombo2 : 250,210,210\nCombo3 : 225,245,240\n\n[HitObjects]\n160,240,3051,1,0\n80,264,3277,1,0\n40,192,3502,1,2\n80,120,3728,1,0\n160,144,3954,2,0,B|192:64|320:64|352:144,1,240,4|0\n432,120,4856,5,0\n472,192,5081,1,0\n432,264,5307,1,2\n352,240,5532,1,0\n368,320,5758,2,0,B|312:376|200:376|144:320,1,240\n80,264,6660,5,0\n80,264,6886,1,0\n160,240,7111,1,2\n160,240,7337,1,0\n104,184,7563,6,0,B|72:96|152:40,2,160,0|2|0\n256,136,8916,1,2\n408,184,9367,2,0,B|440:96|360:40,2,160,0|2|0\n256,136,10720,1,2\n168,264,11172,6,0,B|184:352|328:352|344:264,1,240\n344,263,12074,1,2\n128,160,12750,5,0\n128,160,12976,1,0\n256,64,13427,1,2\n384,160,13878,1,0\n336,312,14329,1,2\n176,312,14781,1,0\n296,208,15232,1,2\n296,208,15457,2,0,B|336:168|336:104|296:64,1,160\n216,64,16134,2,0,B|176:104|176:168|216:208,1,160,2|0\n96,312,17036,5,2\n256,312,17487,1,0\n416,312,17938,1,4\n256,312,18390,5,4\n288,240,18615,2,0,B|376:240,2,80,0|2|0\n216,216,19292,2,0,B|160:160,1,80\n232,120,19743,2,0,B|175:63,1,80,2|0\n96,80,20194,2,0,B|152:136,1,80\n80,176,20645,2,0,B|136:232,1,80,2|0\n192,288,21096,2,0,B|248:344,2,80,0|0|2\n200,208,21773,5,0\n200,208,21999,2,0,B|143:151,2,80,0|0|2\n280,200,22675,1,0\n280,200,22901,2,0,B|336:256,2,80,0|0|2\n232,136,23578,1,0\n312,120,23803,6,0,B|344:88|400:104,1,80\n424,248,24254,2,0,B|392:280|336:264,1,80,2|0\n151,148,24705,2,0,B|183:116|239:132,1,80,2|0\n271,284,25157,2,0,B|239:316|183:300,1,80,2|0\n120,288,25608,6,0,B|32:272,2,80,0|0|2\n196,303,26284,1,0\n248,248,26510,2,0,B|336:264,2,80,0|0|2\n171,232,27187,1,0\n160,152,27412,2,0,B|88:184,1,80\n216,95,27863,2,0,B|142:67,1,80,2|0\n296,96,28314,2,0,B|264:24,1,80\n352,152,28766,2,0,B|380:78,1,80,2|0\n320,224,29217,6,0,B|291:297,2,80,0|0|2\n352,152,29893,1,0\n272,160,30119,2,0,B|199:191,2,80,0|0|2\n352,152,30796,1,0\n352,152,31021,6,0,B|384:120|440:136,1,80\n472,288,31472,2,0,B|440:320|384:304,1,80,2|0\n199,188,31923,2,0,B|231:156|287:172,1,80,2|0\n319,324,32375,2,0,B|287:356|231:340,1,80,2|0\n256,248,32826,6,0,B|304:176|256:96,1,160,4|2\n176,96,33502,1,0\n176,96,33728,2,0,B|128:168|176:248,1,160,0|2\n144,320,34405,1,0\n144,320,34630,2,0,B|184:360|248:360|288:320,1,160,0|2\n368,320,35307,1,0\n368,320,35532,2,0,B|408:280|408:216|367:176,1,160,0|2\n288,176,36209,1,0\n320,248,36435,6,0,B|272:268|224:244|208:212|208:168,1,160,0|2\n248,104,37111,1,0\n248,104,37337,2,0,B|200:40|104:40,1,160,0|2\n64,192,38239,1,0\n64,192,38465,1,0\n64,192,38690,1,2\n106,343,39141,2,0,B|200:344|248:280,1,160,0|2\n312,232,39818,1,0\n312,152,40044,5,0\n464,192,40495,1,2\n464,112,40720,1,0\n392,152,40946,2,0,B|392:72|312:16,1,160,0|2\n256,72,41623,1,0\n196,18,41848,2,0,B|120:72|120:152,1,160,0|2\n48,192,42525,1,0\n119,232,42750,2,0,B|120:312|196:365,1,160,0|2\n256,312,43427,1,0\n256,312,43653,6,0,B|184:280|192:176,1,160,0|2\n256,128,44329,1,0\n320,177,44555,2,0,B|328:280|256:312,1,160,0|2\n184,344,45232,1,0\n104,344,45457,1,0\n32,304,45683,1,0\n16,224,45908,2,0,B|16:144|88:72,1,160,2|0\n344,248,47036,5,0\n344,248,47262,2,0,B|288:312|192:280,1,160,4|2\n168,128,47938,1,0\n168,128,48164,2,0,B|224:64|320:96,1,160,0|2\n352,272,48841,5,0\n352,272,49066,2,0,B|296:336|200:304,1,160,0|2\n160,96,49743,1,0\n160,96,49969,2,0,B|216:32|312:64,1,160,0|2\n306,62,50645,5,0\n368,112,50871,2,0,B|437:169,1,80\n408,240,51322,2,0,B|346:188,1,80,2|0\n272,224,51773,2,0,B|341:281,1,80\n312,352,52224,2,0,B|250:300,1,80,2|0\n192,248,52675,1,0\n192,248,52901,1,0\n184,328,53126,2,0,B|96:328|56:240,1,160,2|0\n58,164,53803,2,0,B|58:76,2,80,0|2|0\n58,243,54480,6,0,B|143:275|205:212,1,160,0|2\n112,144,55157,1,0\n24,72,55382,2,0,B|85:10|171:42,1,160,0|2\n272,104,56059,1,0\n272,104,56284,2,0,B|416:184,1,160,0|2\n376,256,56961,2,0,B|296:208,1,80,0|2\n240,264,57412,2,0,B|308:305,2,80,0|2|0\n168,288,58089,6,0,B|84:250|84:162,1,160,0|2\n199,179,58766,1,0\n318,196,58991,2,0,B|317:108|234:70,1,160,0|2\n199,179,59668,1,0\n168,288,59893,2,0,B|84:250|84:162,2,160,0|2|0\n256,96,61247,5,2\n256,96,61472,1,0\n256,96,61698,2,0,B|192:32|104:64,2,160,4|2|0\n172,240,63051,5,2\n172,240,63277,1,0\n172,240,63502,2,0,B|149:327|221:387,2,160,0|2|0\n339,239,64856,5,2\n339,239,65081,1,0\n339,239,65307,2,0,B|426:216|442:124,2,160,0|2|0\n256,104,66660,1,2\n96,96,67111,2,0,B|24:128|24:256|96:296,1,240\n96,296,68014,1,2\n216,192,68465,5,2\n216,192,68690,1,0\n216,192,68916,2,0,B|288:224|312:312,2,160,4|2|0\n216,192,70269,5,2\n216,192,70495,1,0\n216,192,70720,2,0,B|288:160|312:72,2,160,0|2|0\n368,248,72074,5,2\n424,192,72299,1,0\n368,136,72525,1,0\n216,192,72976,2,0,B|56:192,2,160,2|0|2\n344,288,74329,6,0,B|424:256|424:128|344:96,1,240\n344,96,75232,1,0\n136,144,75457,2,0,B|224:144,1,80\n376,208,75908,2,0,B|288:208,1,80,0|4\n232,256,76360,6,0,B|192:280,2,40,0|0|2\n296,304,76811,2,0,B|224:352,2,80\n360,256,77487,2,0,B|427:212,1,80,2|0\n427,212,77938,1,0\n360,168,78164,2,0,B|400:144,2,40,0|0|2\n296,216,78615,5,0\n296,216,78841,2,0,B|224:264,1,80\n288,136,79292,2,0,B|355:92,1,80,2|0\n216,96,79743,2,0,B|120:104|88:192,2,160,0|2|0\n240,352,81096,2,0,B|336:344|368:256,2,160,2|0|2\n48,192,82450,1,0\n256,56,82901,1,2\n464,192,83352,6,0,B|456:280|360:304,1,160,0|2\n336,184,84029,1,0\n296,72,84254,2,0,B|205:95|197:183,1,160,0|2\n336,184,84931,1,0\n312,304,85157,2,0,B|225:297|202:205,1,160,0|2\n360,64,86059,2,0,B|456:72|471:164,1,160,0|2\n312,304,86961,6,0,B|245:360|164:311,1,160,0|2\n164,151,87638,2,0,B|240:96|312:144,1,160\n312,304,88314,2,0,B|245:360|164:311,2,160,2|0|2\n136,168,89668,5,0\n152,88,89893,1,0\n80,48,90119,1,2\n16,104,90344,1,0\n56,176,90570,2,0,B|8:208|8:280|56:312,1,160,4|2\n136,312,91247,6,0,B|224:312,1,80\n184,240,91698,2,0,B|104:240,2,80,0|2|0\n152,168,92375,2,0,B|208:96|304:96|360:168,1,240\n328,240,93277,2,0,B|408:240,1,80\n376,312,93728,2,0,B|288:312,2,80,2|0|0\n488,192,94630,5,2\n376,80,95081,1,0\n256,184,95532,1,2\n136,80,95984,5,0\n24,192,96435,1,2\n136,304,96886,1,0\n256,200,97337,1,2\n376,304,97788,5,0\n488,192,98239,1,2\n488,192,98465,1,0\n488,192,98690,2,0,B|488:104|408:64,1,160,0|2\n328,80,99367,1,0\n376,144,99593,5,0\n336,296,100044,1,2\n176,296,100495,1,0\n136,144,100946,1,2\n184,80,101172,1,0\n103,64,101397,6,0,B|24:104|24:192,1,160,0|2\n24,272,102074,2,0,B|48:336|120:352|192:336|216:272,1,240,0|2\n256,208,102976,1,4\n256,192,103202,12,0,104330\n320,136,104555,5,0\n320,136,104781,1,0\n320,136,105006,2,0,B|232:104|168:176,1,160,2|0\n192,248,105683,2,0,B|280:280|344:208,2,160,2|2|6\n96,64,107262,5,2\n256,32,107713,1,2\n416,64,108164,1,2\n256,192,108615,12,0,112224\n336,296,122826,5,0\n336,296,123051,2,0,B|424:264|408:160,1,160,0|2\n488,152,123728,1,0\n488,152,123954,6,0,B|456:64|352:80,1,160,0|2\n376,160,124630,1,0\n296,184,124856,6,0,B|327:270|422:256,1,160,0|2\n496,280,125532,1,0\n495,280,125758,6,0,B|448:352|351:323,1,160,0|2\n312,256,126435,1,0\n240,288,126660,6,0,B|153:241|171:157,1,160,0|2\n208,88,127337,1,0\n128,88,127563,1,0\n176,240,128014,5,2\n216,312,128239,1,0\n296,312,128465,1,0\n336,240,128690,1,0\n331,159,128916,2,0,B|254:114|179:159,1,160,2|0\n416,200,129818,5,2\n416,200,130044,1,0\n416,200,130269,2,0,B|408:288|312:304,1,160,0|2\n256,248,130946,1,0\n199,303,131172,2,0,B|104:288|96:200,1,160,0|2\n152,144,131848,5,0\n216,104,132074,2,0,B|311:119|319:207,1,160,0|2\n319,207,132750,2,0,B|320:288,1,80\n392,264,133202,2,0,B|392:344,2,80,0|2|0\n392,184,133878,2,0,B|392:16,2,160,0|2|0\n288,312,135232,5,2\n208,336,135457,1,0\n136,304,135683,2,0,B|64:248|88:160,1,160,0|2\n88,80,136360,1,0\n16,120,136585,1,0\n176,112,137036,5,2\n176,112,137262,1,0\n176,112,137487,2,0,B|135:37|41:37,2,160,4|2|0\n336,112,138841,5,2\n336,112,139067,1,0\n336,112,139292,2,0,B|376:37|470:37,2,160,0|2|0\n328,272,140645,5,2\n328,272,140871,1,0\n328,272,141096,2,0,B|288:312|224:312|184:272,1,160,0|2\n184,112,141999,2,0,B|224:72|288:72|328:112,1,160,0|2\n464,192,142901,6,0,B|408:152|352:192|352:192|296:232|240:192,1,240\n240,192,143803,1,2\n104,272,144254,5,2\n104,272,144480,1,0\n104,272,144705,2,0,B|128:352|224:368,2,160,4|2|0\n408,272,146059,5,2\n408,272,146284,1,0\n408,272,146510,2,0,B|384:352|288:368,2,160,0|2|0\n256,216,147863,1,2\n256,136,148089,1,0\n312,80,148314,6,0,B|304:32|256:16|208:32|200:80,1,160,0|2\n200,304,149217,2,0,B|208:352|256:368|304:352|312:304,1,160,0|2\n424,192,150119,2,0,B|368:152|312:192|312:192|256:232|200:192,1,240\n128,232,151021,5,2\n128,232,151247,1,0\n128,152,151472,1,2\n128,152,151698,1,0\n56,192,151923,2,0,B|32:248|56:304|120:320,1,160,4|2\n256,240,152826,6,0,B|256:160,2,80,0|0|2\n328,280,153502,1,0\n397,318,153728,2,0,B|456:304|480:248|456:192,1,160,0|2\n368,64,154630,5,0\n304,16,154856,1,0\n256,80,155081,1,2\n208,16,155307,1,0\n144,64,155532,5,0\n48,192,155984,1,2\n144,320,156435,1,0\n256,208,156886,1,2\n368,320,157337,5,0\n464,192,157788,1,2\n368,64,158239,1,0\n256,176,158690,1,2\n144,64,159141,6,0,B|80:32|16:72|8:144,1,160,0|2\n96,136,159818,1,0\n96,136,160044,2,0,B|160:152|160:232|96:248,1,160,0|2\n16,264,160720,1,0\n16,264,160946,2,0,B|24:312|88:352|152:320,2,160,0|2|0\n160,192,162299,1,2\n304,264,162750,6,0,B|352:192|304:112,1,160,0|2\n376,72,163427,2,0,B|432:192|376:312,1,240,0|2\n312,344,164329,1,0\n240,312,164555,2,0,B|200:344|128:344|88:312,1,160,2|2\n64,240,165232,1,0\n144,216,165457,6,0,B|128:176|80:160,1,80,2|0\n48,96,165908,2,0,B|86:76|125:93,1,80,2|0\n200,128,166360,2,0,B|235:165|241:236|213:279,1,160,4|2\n272,336,167036,6,0,B|310:266,2,80\n351,336,167713,2,0,B|389:266,1,80,2|0\n448,320,168164,2,0,B|475:279|468:207|433:170,1,160,0|2\n352,168,168841,6,0,B|264:168,1,80\n168,88,169292,2,0,B|248:88,1,80,0|2\n328,88,169743,1,0\n192,168,169969,6,0,B|112:192|72:272,2,160,0|2|0\n351,168,171322,2,0,B|431:192|471:272,2,160,2|0|2\n272,32,172675,1,0\n272,192,173126,1,2\n344,336,173578,6,0,B|304:368|232:368|192:336,1,160,0|2\n266,280,174254,1,0\n193,223,174480,2,0,B|231:192|303:192|343:224,1,160,0|2\n400,280,175157,1,0\n432,208,175382,2,0,B|381:138|296:128,1,160,0|2\n152,64,176284,1,0\n72,200,176735,1,2\n184,312,177187,6,0,B|272:336|336:272,1,160,0|2\n332,276,177863,2,0,B|356:188|292:124,1,160\n295,128,178540,1,2\n240,64,178766,1,4\n240,64,179217,5,0\n160,64,179442,1,2\n56,184,179893,1,0\n216,192,180344,5,2\n272,248,180570,1,0\n320,184,180796,2,0,B|408:176|456:256,1,160,0|2\n407,317,181472,2,0,B|319:325|271:245,1,160,0|2\n168,128,182375,1,4\n392,40,183051,5,2\n424,200,183502,1,2\n272,144,183953,1,2\n296,304,184405,1,4\n256,192,198164,5,0\n256,192,198390,1,4\n256,192,198841,1,2\n256,192,205382,5,0\n256,192,205608,1,2\n256,192,209217,12,0,212149\n232,264,212375,5,0\n232,264,212600,2,0,B|144:264,1,80,0|2\n320,208,213051,2,0,B|408:208,1,80,0|4\n280,128,213502,6,0,B|320:104,2,40,0|0|2\n216,80,213953,2,0,B|288:32,2,80\n152,128,214630,2,0,B|85:172,1,80,2|0\n85,172,215081,1,0\n152,216,215307,2,0,B|112:240,2,40,0|0|2\n216,168,215758,5,0\n216,168,215984,2,0,B|288:120,1,80\n224,248,216435,2,0,B|157:292,1,80,2|0\n296,288,216886,2,0,B|392:280|424:192,2,160,0|2|0\n272,32,218239,6,0,B|176:40|144:128,2,160,2|0|2\n464,192,219593,1,0\n256,328,220044,1,2\n48,192,220495,6,0,B|56:104|152:80,1,160,0|2\n176,200,221172,1,0\n216,312,221397,2,0,B|307:289|315:201,1,160,0|2\n176,200,222074,1,0\n200,80,222299,2,0,B|287:87|310:179,1,160,0|2\n152,320,223202,2,0,B|64:312|41:220,1,160,0|2\n200,80,224104,6,0,B|272:32|352:80,1,160,0|2\n350,239,224781,2,0,B|278:287|198:239,1,160,0|0\n200,80,225457,2,0,B|272:32|352:80,2,160,2|0|2\n128,192,226811,5,0\n128,192,227036,1,0\n64,144,227262,1,2\n64,144,227487,1,0\n89,70,227713,6,0,B|128:40|200:40|240:72,1,160,4|2\n312,40,228390,1,0\n312,120,228615,2,0,B|256:176,2,80,0|0|2\n384,80,229292,1,0\n384,80,229517,2,0,B|480:64|512:152,1,160,0|2\n360,192,230420,6,0,B|280:192,2,80,0|0|2\n440,192,231096,1,0\n511,234,231322,2,0,B|480:320|384:304,1,160,0|2\n256,208,232224,2,0,B|256:128,2,80,0|0|2\n127,304,233126,2,0,B|32:320|0:234,1,160,0|2\n72,192,233803,2,0,B|112:192,2,40\n0,149,234254,2,0,B|-16:112|0:72,1,80,0|2\n72,32,234705,1,0\n72,112,234931,6,0,B|136:112|152:48|216:48,1,160,0|2\n296,48,235608,1,0\n296,48,235833,2,0,B|358:47|374:111|438:111,1,160,0|2\n456,192,236510,1,0\n442,274,236735,5,0\n153,368,237187,1,2\n69,109,237638,1,0\n358,15,238089,1,2\n256,192,238540,5,0\n104,248,238991,2,0,B|80:288|32:288,2,80,2|0|0\n256,192,239893,1,2\n256,192,240119,1,0\n256,192,240344,12,0,241472\n296,40,241698,6,0,B|256:24|216:40,1,80\n256,112,242149,2,0,B|256:272,1,160,2|0\n336,288,242826,2,0,B|328:352|288:376|224:376|184:352|176:288,1,240\n136,220,243728,1,6\n376,220,244405,5,2\n336,64,244856,1,2\n176,64,245307,1,4\n136,220,245758,1,2\n256,192,245984,12,0,249367");
            //var song:Song = new Song("test", "test", 1, [], []);
            assertEquals(song.title, "Drop");
            assertEquals(song.artist, "ClariS");
            assertEquals(song.difficulty, 7);
            assertEquals(song.enemies.length, 0);
            assertEquals(song.timingPoints.length, 50);
        }

        public function testPeekAtFirstEnemy(): void {
            var emptySong:Song = new Song("test", "test", 1, [], []);
            assertEquals(emptySong.peekAtFirstTimingPoint(), null);

            var enemyOne:Enemy = new Enemy(5, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree], []);
            assertEquals(song.peekAtFirstEnemy(), enemyOne);
            assertEquals(song.peekAtFirstEnemy(), enemyOne);
        }

        public function testPopFirstEnemy(): void {
            var enemyOne:Enemy = new Enemy(5, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree], []);
            assertEquals(song.popFirstEnemy(), enemyOne);
            assertEquals(song.popFirstEnemy(), enemyTwo);
            assertEquals(song.popFirstEnemy(), enemyThree);
        }

        public function testPeekAtFirstTimingPoint(): void {
            var emptySong:Song = new Song("test", "test", 1, [], []);
            assertEquals(emptySong.peekAtFirstTimingPoint(), null);

            var timingPointOne:TimingPoint = new TimingPoint(5, 100, 3);
            var timingPointTwo:TimingPoint = new TimingPoint(6, 100, 3);
            var timingPointThree:TimingPoint = new TimingPoint(8, 100, 3);
            var song:Song = new Song("test", "test", 1, [], [timingPointOne, timingPointTwo, timingPointThree]);
            assertEquals(song.peekAtFirstTimingPoint(), timingPointOne);
            assertEquals(song.peekAtFirstTimingPoint(), timingPointOne);
        }

        public function testPopFirstTimingPoint(): void {
            var timingPointOne:TimingPoint = new TimingPoint(5, 100, 3);
            var timingPointTwo:TimingPoint = new TimingPoint(6, 100, 3);
            var timingPointThree:TimingPoint = new TimingPoint(8, 100, 3);
            var song:Song = new Song("test", "test", 1, [], [timingPointOne, timingPointTwo, timingPointThree]);
            assertEquals(song.popFirstTimingPoint(), timingPointOne);
            assertEquals(song.popFirstTimingPoint(), timingPointTwo);
            assertEquals(song.popFirstTimingPoint(), timingPointThree);
        }

        public function testPopAllEnemiesBeforeMoment(): void {
            var emptySong:Song = new Song("test", "test", 1, [], []);
            var emptyEnemies:Array = emptySong.popAllEnemiesBeforeMoment(7);
            assertEquals(emptyEnemies.length, 0);

            var enemyOne:Enemy = new Enemy(5, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree], []);

            var enemiesBeforeSeven:Array = song.popAllEnemiesBeforeMoment(7);
            assertEquals(enemiesBeforeSeven.length, 2);
            assertEquals(enemiesBeforeSeven[0], enemyOne);
            assertEquals(enemiesBeforeSeven[1], enemyTwo);
            assertEquals(song.enemies.length, 1);

            var enemiesBeforeNine:Array = song.popAllEnemiesBeforeMoment(9);
            assertEquals(enemiesBeforeNine.length, 1);
            assertEquals(enemiesBeforeNine[0], enemyThree);
            assertEquals(song.enemies.length, 0);
        }

        public function testMarkEnemy():void {
            // Carefully constructed so that timeMargin will be 2 seconds
            var timingPoint:TimingPoint = new TimingPoint(0, 30, 4);

            var enemyOne:Enemy = new Enemy(5, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyTwo:Enemy = new Enemy(6, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyThree:Enemy = new Enemy(8, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);
            var enemyFour:Enemy = new Enemy(10, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);

            enemyOne.side = Enemy.SIDE_UP;
            enemyTwo.side = Enemy.SIDE_RIGHT;
            enemyThree.side = Enemy.SIDE_RIGHT;
            enemyFour.side = Enemy.SIDE_LEFT;

            var song:Song = new Song("test", "test", 1, [enemyOne, enemyTwo, enemyThree, enemyFour], [timingPoint]);
 
            // A click to a side with no enemies ever should return nul
            assertEquals(song.markEnemy(1, Enemy.SIDE_DOWN), null);

            // A successful click, and then a click to the same time that has nothing else around itc
            var enemyResult:EnemyResult = song.markEnemy(5, Enemy.SIDE_UP);
            assertEquals(enemyResult, enemyOne.enemyResult);
            assertEquals(enemyResult.enemy, enemyOne);
            assertEquals(song.markEnemy(5, Enemy.SIDE_UP), null);

            // Two clicks should mutate the structure and get two different enemies.
            enemyResult = song.markEnemy(6.5, Enemy.SIDE_RIGHT);
            assertEquals(enemyResult, enemyTwo.enemyResult);
            assertEquals(enemyResult.enemy, enemyTwo);
            enemyResult = song.markEnemy(6.5, Enemy.SIDE_RIGHT);
            assertEquals(enemyResult, enemyThree.enemyResult);
            assertEquals(enemyResult.enemy, enemyThree);

            // A click where there is an enemy around that is too far away should return null
            assertEquals(song.markEnemy(7.9, Enemy.SIDE_LEFT), null);
        }

        public function testMarkEnemyScoring():void {
            // Carefully constructed so that timeMargin will be 2 seconds
            var timingPoint:TimingPoint = new TimingPoint(0, 30, 4);

            var enemyOne:Enemy = new Enemy(5, Enemy.TYPE_EXAMPLE_FOR_TEST_PURPOSES);

            enemyOne.side = Enemy.SIDE_UP;
            var song:Song = new Song("test", "test", 1, [enemyOne], [timingPoint]);
            assertEquals(song.markEnemy(5, Enemy.SIDE_UP).type, EnemyResult.TYPE_PERFECT);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(5.5, Enemy.SIDE_UP).type, EnemyResult.TYPE_PERFECT);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(6.2, Enemy.SIDE_UP).type, EnemyResult.TYPE_GREAT);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(6.4, Enemy.SIDE_UP).type, EnemyResult.TYPE_OK);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(7, Enemy.SIDE_UP).type, EnemyResult.TYPE_OK);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(4.5, Enemy.SIDE_UP).type, EnemyResult.TYPE_PERFECT);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(3.8, Enemy.SIDE_UP).type, EnemyResult.TYPE_GREAT);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(3.6, Enemy.SIDE_UP).type, EnemyResult.TYPE_OK);
            enemyOne.enemyResult = null;
            assertEquals(song.markEnemy(3, Enemy.SIDE_UP).type, EnemyResult.TYPE_OK);
        }

        public function testHealth():void {
            var song:Song = new Song("test", "test", 1, [], []);
            assertEquals(song.playerHealth, Song.MAX_HEALTH);
            song.damageHealth();
            assertEquals(song.playerHealth, Song.MAX_HEALTH - 1);
            song.damageHealth();
            assertEquals(song.playerHealth, Song.MAX_HEALTH - 2);
            song.recoverHealth();
            assertEquals(song.playerHealth, Song.MAX_HEALTH - 1);
        }

        public function testGetTimingPointForTime():void  {
            var timingPointOne:TimingPoint = new TimingPoint(5, 100, 3);
            var timingPointTwo:TimingPoint = new TimingPoint(6, 100, 3);
            var timingPointThree:TimingPoint = new TimingPoint(8, 100, 3);
            var song:Song = new Song("test", "test", 1, [], [timingPointOne, timingPointTwo, timingPointThree]);

            assertEquals(song.getTimingPointForTime(0), null);
            assertEquals(song.getTimingPointForTime(5), timingPointOne);
            assertEquals(song.getTimingPointForTime(5.5), timingPointOne);
            assertEquals(song.getTimingPointForTime(6), timingPointTwo);
            assertEquals(song.getTimingPointForTime(8), timingPointThree);
            assertEquals(song.getTimingPointForTime(900), timingPointThree);
        }
    }
}
