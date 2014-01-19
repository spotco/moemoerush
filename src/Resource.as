package  {
	import flash.display.Bitmap;
	import flash.media.Sound;
	public class Resource {
		
		//decorations
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
		
		[Embed( source = "../resc/building/building_0.png" )]
		private static var IMPORT_BUILDING_0:Class;
		public static var RESC_BUILING_0:Bitmap = new IMPORT_BUILDING_0 as Bitmap;
		
		[Embed( source = "../resc/building/building_1.png" )]
		private static var IMPORT_BUILDING_1:Class;
		public static var RESC_BUILING_1:Bitmap = new IMPORT_BUILDING_1 as Bitmap;
		
		[Embed( source = "../resc/building/building_2.png" )]
		private static var IMPORT_BUILDING_2:Class;
		public static var RESC_BUILING_2:Bitmap = new IMPORT_BUILDING_2 as Bitmap;
		
		[Embed( source = "../resc/building/lamppost.png" )]
		private static var IMPORT_LAMPPOST:Class;
		public static var RESC_LAMPPOST:Bitmap = new IMPORT_LAMPPOST as Bitmap;
		
		//effects
		[Embed( source = "../resc/effects/pow.png" )]
		private static var IMPORT_EFFECT_POW:Class;
		public static var RESC_EFFECT_POW:Bitmap = new IMPORT_EFFECT_POW as Bitmap;
		
		[Embed( source = "../resc/particle/metal_particle.png" )]
		private static var IMPORT_METAL_PARTICLE:Class;
		public static var RESC_METAL_PARTICLE:Bitmap = new IMPORT_METAL_PARTICLE as Bitmap;
		
		[Embed( source = "../resc/effects/excellent.png" )]
		private static var IMPORT_POPUP_EXCELLENT:Class;
		public static var RESC_POPUP_EXCELLENT:Bitmap = new IMPORT_POPUP_EXCELLENT as Bitmap;	
		
		[Embed( source = "../resc/effects/good.png" )]
		private static var IMPORT_POPUP_GOOD:Class;
		public static var RESC_POPUP_GOOD:Bitmap = new IMPORT_POPUP_GOOD as Bitmap;
		
		[Embed( source = "../resc/effects/poor.png" )]
		private static var IMPORT_POPUP_POOR:Class;
		public static var RESC_POPUP_POOR:Bitmap = new IMPORT_POPUP_POOR as Bitmap;
		
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

        [Embed( source= "../resc/girl/run_4.png" )]
        private static var IMPORT_GIRL_RUN_4:Class;
        public static var RESC_GIRL_RUN_4:Bitmap = new IMPORT_GIRL_RUN_4 as Bitmap;

        [Embed( source= "../resc/girl/run_5.png" )]
        private static var IMPORT_GIRL_RUN_5:Class;
        public static var RESC_GIRL_RUN_5:Bitmap = new IMPORT_GIRL_RUN_5 as Bitmap;

        [Embed( source= "../resc/girl/run_6.png" )]
        private static var IMPORT_GIRL_RUN_6:Class;
        public static var RESC_GIRL_RUN_6:Bitmap = new IMPORT_GIRL_RUN_6 as Bitmap;

        [Embed( source= "../resc/girl/run_7.png" )]
        private static var IMPORT_GIRL_RUN_7:Class;
        public static var RESC_GIRL_RUN_7:Bitmap = new IMPORT_GIRL_RUN_7 as Bitmap;

        [Embed( source= "../resc/girl/run_8.png" )]
        private static var IMPORT_GIRL_RUN_8:Class;
        public static var RESC_GIRL_RUN_8:Bitmap = new IMPORT_GIRL_RUN_8 as Bitmap;

        [Embed( source= "../resc/girl/run_9.png" )]
        private static var IMPORT_GIRL_RUN_9:Class;
        public static var RESC_GIRL_RUN_9:Bitmap = new IMPORT_GIRL_RUN_9 as Bitmap;

        [Embed( source= "../resc/girl/run_10.png" )]
        private static var IMPORT_GIRL_RUN_10:Class;
        public static var RESC_GIRL_RUN_10:Bitmap = new IMPORT_GIRL_RUN_10 as Bitmap;

        [Embed( source= "../resc/girl/run_11.png" )]
        private static var IMPORT_GIRL_RUN_11:Class;
        public static var RESC_GIRL_RUN_11:Bitmap = new IMPORT_GIRL_RUN_11 as Bitmap;
		
		[Embed( source = "../resc/girl/punch_left_0.png" )]
		private static var IMPORT_GIRL_PUNCH_LEFT_0:Class;
		public static var RESC_GIRL_PUNCH_LEFT_0:Bitmap = new IMPORT_GIRL_PUNCH_LEFT_0 as Bitmap;
		
		[Embed( source = "../resc/girl/punch_right_0.png" )]
		private static var IMPORT_GIRL_PUNCH_RIGHT_0:Class;
		public static var RESC_GIRL_PUNCH_RIGHT_0:Bitmap = new IMPORT_GIRL_PUNCH_RIGHT_0 as Bitmap;
		
		[Embed( source = "../resc/girl/punch_up_0.png" )]
		private static var IMPORT_GIRL_PUNCH_UP_0:Class;
		public static var RESC_GIRL_PUNCH_UP_0:Bitmap = new IMPORT_GIRL_PUNCH_UP_0 as Bitmap;

	
		//enemies
		[Embed( source = "../resc/enemies/copter_0.png" )]
		private static var IMPORT_COPTER_0:Class;
		public static var RESC_COPTER_0:Bitmap = new IMPORT_COPTER_0 as Bitmap;	


        // Song Data
		[Embed( source = "../resc/song/drop.mp3" )]
		private static var IMPORT_SONG_MP3:Class;
		public static var RESC_SONG_MP3:Sound = new IMPORT_SONG_MP3 as Sound;

		[Embed( source = "../resc/song/drop.osu", mimeType="application/octet-stream")]
		private static var IMPORT_SONG_BEATMAP:Class;
		public static var RESC_SONG_BEATMAP:String = new IMPORT_SONG_BEATMAP as String;
		
		//sfx
		[Embed( source = "../resc/sfx/hit.mp3" )]
		private static var IMPORT_SFX_HIT:Class;
		public static var RESC_SFX_HIT:Sound = new IMPORT_SFX_HIT as Sound;
		
		[Embed( source = "../resc/sfx/crowd.mp3" )]
		private static var IMPORT_SFX_CROWD:Class;
		public static var RESC_SFX_CROWD:Sound = new IMPORT_SFX_CROWD as Sound;
		
		[Embed( source = "../resc/sfx/miss.mp3" )]
		private static var IMPORT_SFX_MISS:Class;
		public static var RESC_SFX_MISS:Sound = new IMPORT_SFX_MISS as Sound;
		
	}

}
