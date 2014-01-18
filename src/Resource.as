package  {
	import flash.display.Bitmap;
	import flash.media.Sound;
	public class Resource {
		
		[Embed( source = "../resc/ground.png" )]
		private static var IMPORT_GROUND:Class;
		public static var RESC_GROUND:Bitmap = new IMPORT_GROUND as Bitmap;
		
		[Embed( source = "../resc/ground_fill.png" )]
		private static var IMPORT_GROUND_FILL:Class;
		public static var RESC_GROUND_FILL:Bitmap = new IMPORT_GROUND_FILL as Bitmap;
		
		[Embed( source = "../resc/sky.png" )]
		private static var IMPORT_SKY:Class;
		public static var RESC_SKY:Bitmap = new IMPORT_SKY as Bitmap;
		
		[Embed( source = "../resc/tree.png" )]
		private static var IMPORT_TREE:Class;
		public static var RESC_TREE:Bitmap = new IMPORT_TREE as Bitmap;
		
		
		//girl anim frames
		[Embed( source = "../resc/girl/run_0.png" )]
		private static var IMPORT_GIRL_RUN_0:Class;
		public static var RESC_GIRL_RUN_0:Bitmap = new IMPORT_GIRL_RUN_0 as Bitmap;
		
		[Embed( source = "../resc/girl/run_1.png" )]
		private static var IMPORT_GIRL_RUN_1:Class;
		public static var RESC_GIRL_RUN_1:Bitmap = new IMPORT_GIRL_RUN_1 as Bitmap;
		
		[Embed( source = "../resc/girl/run_2.png" )]
		private static var IMPORT_GIRL_RUN_2:Class;
		public static var RESC_GIRL_RUN_2:Bitmap = new IMPORT_GIRL_RUN_2 as Bitmap;
		
		[Embed( source = "../resc/girl/run_3.png" )]
		private static var IMPORT_GIRL_RUN_3:Class;
		public static var RESC_GIRL_RUN_3:Bitmap = new IMPORT_GIRL_RUN_3 as Bitmap;
		
		[Embed( source = "../resc/girl/punch_left_0.png" )]
		private static var IMPORT_GIRL_PUNCH_LEFT_0:Class;
		public static var RESC_GIRL_PUNCH_LEFT_0:Bitmap = new IMPORT_GIRL_PUNCH_LEFT_0 as Bitmap;
		
		[Embed( source = "../resc/girl/punch_right_0.png" )]
		private static var IMPORT_GIRL_PUNCH_RIGHT_0:Class;
		public static var RESC_GIRL_PUNCH_RIGHT_0:Bitmap = new IMPORT_GIRL_PUNCH_RIGHT_0 as Bitmap;
		
		[Embed( source = "../resc/girl/punch_up_0.png" )]
		private static var IMPORT_GIRL_PUNCH_UP_0:Class;
		public static var RESC_GIRL_PUNCH_UP_0:Bitmap = new IMPORT_GIRL_PUNCH_UP_0 as Bitmap;

        // Song Data
		[Embed( source = "../resc/song/drop.mp3" )]
		private static var IMPORT_SONG_MP3:Class;
		public static var RESC_SONG_MP3:Sound = new IMPORT_SONG_MP3 as Sound;

		[Embed( source = "../resc/song/drop.osu", mimeType="application/octet-stream")]
		private static var IMPORT_SONG_BEATMAP:Class;
		public static var RESC_SONG_BEATMAP:String = new IMPORT_SONG_BEATMAP as String;
	}

}
