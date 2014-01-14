package  {
	import flash.display.Bitmap;
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
		
	}

}