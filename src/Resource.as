package  {
	import flash.display.Bitmap;
    import flash.utils.ByteArray;
	import flash.media.Sound;
	public class Resource {
		
		[Embed( source = "../resc/car/car1.png" )]
		private static var IMPORT_CAR1:Class;
		public static var RESC_CAR1:Bitmap = new IMPORT_CAR1 as Bitmap;
		
		[Embed( source = "../resc/car/car2.png" )]
		private static var IMPORT_CAR2:Class;
		public static var RESC_CAR2:Bitmap = new IMPORT_CAR2 as Bitmap;
		
		[Embed( source = "../resc/car/car3.png" )]
		private static var IMPORT_CAR3:Class;
		public static var RESC_CAR3:Bitmap = new IMPORT_CAR3 as Bitmap;
		
		[Embed( source = "../resc/car/car4.png" )]
		private static var IMPORT_CAR4:Class;
		public static var RESC_CAR4:Bitmap = new IMPORT_CAR4 as Bitmap;
		
		//ui
		[Embed( source = "../resc/ui/combotoast.png" )]
		private static var IMPORT_COMBOTOAST:Class;
		public static var RESC_COMBOTOAST:Bitmap = new IMPORT_COMBOTOAST as Bitmap;
		
		[Embed( source = "../resc/ui/healthbar_back.png" )]
		private static var IMPORT_HEALTHBAR_BACK:Class;
		public static var RESC_HEALTHBAR_BACK:Bitmap = new IMPORT_HEALTHBAR_BACK as Bitmap;
		
		[Embed( source = "../resc/ui/healthbar_fill.png" )]
		private static var IMPORT_HEALTHBAR_FILL:Class;
		public static var RESC_HEALTHBAR_FILL:Bitmap = new IMPORT_HEALTHBAR_FILL as Bitmap;
		
		//intro
		[Embed( source = "../resc/intro/intro_0.jpg" )]
		private static var IMPORT_INTRO_0:Class;
		public static var RESC_INTRO_0:Bitmap = new IMPORT_INTRO_0 as Bitmap;
		
		[Embed( source = "../resc/intro/intro_1.jpg" )]
		private static var IMPORT_INTRO_1:Class;
		public static var RESC_INTRO_1:Bitmap = new IMPORT_INTRO_1 as Bitmap;
		
		[Embed( source = "../resc/intro/intro_2.jpg" )]
		private static var IMPORT_INTRO_2:Class;
		public static var RESC_INTRO_2:Bitmap = new IMPORT_INTRO_2 as Bitmap;
		
		[Embed( source = "../resc/intro/intro_3.jpg" )]
		private static var IMPORT_INTRO_3:Class;
		public static var RESC_INTRO_3:Bitmap = new IMPORT_INTRO_3 as Bitmap;
		
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
		
		[Embed( source = "../resc/particle/star.png" )]
		private static var IMPORT_STAR:Class;
		public static var RESC_STAR:Bitmap = new IMPORT_STAR as Bitmap;
		
		[Embed( source = "../resc/effects/perfect.png" )]
		private static var IMPORT_POPUP_PERFECT:Class;
		public static var RESC_POPUP_PERFECT:Bitmap = new IMPORT_POPUP_PERFECT as Bitmap;	
		
		[Embed( source = "../resc/effects/great.png" )]
		private static var IMPORT_POPUP_GREAT:Class;
		public static var RESC_POPUP_GREAT:Bitmap = new IMPORT_POPUP_GREAT as Bitmap;
		
		[Embed( source = "../resc/effects/ok.png" )]
		private static var IMPORT_POPUP_OK:Class;
		public static var RESC_POPUP_OK:Bitmap = new IMPORT_POPUP_OK as Bitmap;
		
		[Embed( source = "../resc/effects/miss.png" )]
		private static var IMPORT_POPUP_MISS:Class;
		public static var RESC_POPUP_MISS:Bitmap = new IMPORT_POPUP_MISS as Bitmap;
		
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
		
		[Embed( source = "../resc/girl/punch_up_1.png" )]
		private static var IMPORT_GIRL_PUNCH_UP_1:Class;
		public static var RESC_GIRL_PUNCH_UP_1:Bitmap = new IMPORT_GIRL_PUNCH_UP_1 as Bitmap;
		
		[Embed( source = "../resc/girl/hit.png" )]
		private static var IMPORT_GIRL_HIT_0:Class;
		public static var RESC_GIRL_HIT_0:Bitmap = new IMPORT_GIRL_HIT_0 as Bitmap;
	
		//enemies
		[Embed( source = "../resc/enemies/copter_0.png" )]
		private static var IMPORT_COPTER_0:Class;
		public static var RESC_COPTER_0:Bitmap = new IMPORT_COPTER_0 as Bitmap;	

		[Embed( source = "../resc/enemies/jet_fighter_0.png" )]
		private static var IMPORT_JET_FIGHTER_0:Class;
		public static var RESC_JET_FIGHTER_0:Bitmap = new IMPORT_JET_FIGHTER_0 as Bitmap;	

		[Embed( source = "../resc/enemies/nuke_0.png" )]
		private static var IMPORT_NUKE_0:Class;
		public static var RESC_NUKE_0:Bitmap = new IMPORT_NUKE_0 as Bitmap;	

		[Embed( source = "../resc/enemies/parachute_guy_0.png" )]
		private static var IMPORT_PARACHUTE_GUY_0:Class;
		public static var RESC_PARACHUTE_GUY_0:Bitmap = new IMPORT_PARACHUTE_GUY_0 as Bitmap;	
		
		//sfx
		[Embed( source = "../resc/sfx/hit.mp3" )]
		private static var IMPORT_SFX_HIT:Class;
		public static var RESC_SFX_HIT:Sound = new IMPORT_SFX_HIT as Sound;
		
		[Embed( source = "../resc/sfx/hit_ok.mp3" )]
		private static var IMPORT_SFX_HIT_OK:Class;
		public static var RESC_SFX_HIT_OK:Sound = new IMPORT_SFX_HIT_OK as Sound;
		
		[Embed( source = "../resc/sfx/crowd.mp3" )]
		private static var IMPORT_SFX_CROWD:Class;
		public static var RESC_SFX_CROWD:Sound = new IMPORT_SFX_CROWD as Sound;
		
		[Embed( source = "../resc/sfx/miss.mp3" )]
		private static var IMPORT_SFX_MISS:Class;
		public static var RESC_SFX_MISS:Sound = new IMPORT_SFX_MISS as Sound;
		
		[Embed( source = "../resc/sfx/explosion.mp3" )]
		private static var IMPORT_SFX_EXPLOSION:Class;
		public static var RESC_SFX_EXPLOSION:Sound = new IMPORT_SFX_EXPLOSION as Sound;
		
		[Embed( source = "../resc/sfx/whatthehell.mp3" )]
		private static var IMPORT_SFX_WHATTHEHELL:Class;
		public static var RESC_SFX_WHATTHEHELL:Sound = new IMPORT_SFX_WHATTHEHELL as Sound;
		
		[Embed( source = "../resc/sfx/hai.mp3" )]
		private static var IMPORT_SFX_HAI:Class;
		public static var RESC_SFX_HAI:Sound = new IMPORT_SFX_HAI as Sound;
		
        // Song Data
        // Songs we have available:
        // * days-of-dash (Normal)
        // * drop (Hard)
        // * my-pace-de-ikimashou (Normal)
        // * scheol (Insane)
        // * weed-circulation (Normal)
		[Embed( source = "../resc/song/weed-circulation.mp3" )]
		private static var IMPORT_SONG_MP3:Class;
		public static var RESC_SONG_MP3:Sound = new IMPORT_SONG_MP3 as Sound;

		[Embed( source = "../resc/song/weed-circulation.osu", mimeType="application/octet-stream")]
		private static var IMPORT_SONG_BEATMAP:Class;
		public static var RESC_SONG_BEATMAP:String = (new IMPORT_SONG_BEATMAP as ByteArray).toString();
	}

}
