package {
	import com.adobe.utils.*;
	import flash.display.*;
	import flash.display3D.*;
	import flash.events.*;
	import flash.display3D.textures.*;
	import flash.geom.*;
	import flash.utils.*;
	
	public class S3DObj {
		
		private static var RENDER_SHADER:Program3D = null;
		
		private static function lazy_init_shader(context:Context3D){
			var assembler:AGALMiniAssembler = new AGALMiniAssembler();
			RENDER_SHADER = context.createProgram();
			var code:String = "m44 op, va0, vc0\nmov v0, va1\n";
			
			var vertexshader:ByteArray = assembler.assemble(Context3DProgramType.VERTEX, code);
			code = "tex oc, v0, fs0 <2d,linear,mipnone,repeat>"
			var fragmentshader:ByteArray = assembler.assemble(Context3DProgramType.FRAGMENT, code);
			RENDER_SHADER.upload(vertexshader, fragmentshader);
		}
		
		[Embed( source = "../resc/ass.png" )] 
		protected const TEST_RESOURCE:Class;
		
		public var _vertex_uv_buffer:VertexBuffer3D;
		public var _index_buffer:IndexBuffer3D;
		public var _texture:Texture;
		
		public var _context:Context3D;
		
		public function S3DObj(context:Context3D):void {
			lazy_init_shader(context);
			_context = context;
			_vertex_uv_buffer = context.createVertexBuffer(4, 5);
			_index_buffer = context.createIndexBuffer(6);
			
			var texbmp:Bitmap = new TEST_RESOURCE as Bitmap;
			_texture = context.createTexture(texbmp.width, texbmp.height, "bgra", false);
			_texture.uploadFromBitmapData(texbmp.bitmapData);
			
			_vertex_uv_buffer.uploadFromVector(_vertex_data, 0, 4);
			
			var indices:Vector.<uint> = Vector.<uint>([
				0, 1, 2,
				0, 2, 3
			]); 
			_index_buffer.uploadFromVector(indices, 0, 6);
		}
		
		public static var I_ELE_X:int = 0;
		public static var I_ELE_Y:int = 1;
		public static var I_ELE_Z:int = 2;
		public static var I_ELE_U:int = 3;
		public static var I_ELE_V:int = 4;
		private var _vertex_data:Vector.<Number> = Vector.<Number>([
			//	x  y  z     u  v
				0, 0, 0,    0, 1, //0
				0, 1, 0,    0, 0, //1
				1, 1, 0,    1, 0, //2
				1, 0, 0,    1, 1  //3
			]);
		public function update_vertex(i_vertex:int, i_ele:int, val:Number):void {
			_vertex_data[i_vertex * 5 + i_ele] = val;
			_vertex_uv_buffer.uploadFromVector(_vertex_data, 0, 4);
		}
		public function get_vertex(i_vertex:int, i_ele:int):Number {
			return _vertex_data[i_vertex * 5 + i_ele];
		}
		
		private var _matrix:Matrix3D = new Matrix3D();
		public var _scale:Number = 1;
		public var _x:Number = 0, _y:Number = 0, _z:Number = 0;
		public function set_position(x:Number, y:Number, z:Number):void { _x = x; _y = y; _z = z; }
		public var _visible:Boolean = true;
		public var _rotation_x:Number = 0, _rotation_y:Number = 0, _rotation_z:Number = 0;
		
		public function get_matrix():Matrix3D {
			_matrix.identity();
			_matrix.appendScale(_scale, _scale, _scale);
			_matrix.appendRotation(_rotation_x, Vector3D.X_AXIS);
			_matrix.appendRotation(_rotation_y, Vector3D.Y_AXIS);
			_matrix.appendRotation(_rotation_z, Vector3D.Z_AXIS);
			_matrix.appendTranslation(_x, _y, _z);
			return _matrix;
		}
		
		
		//private static var tmp_matrix:Matrix3D = new Matrix3D();
		public function render():void {			
			/*
			tmp_matrix.identity();
			tmp_matrix.appendScale(_scale, _scale, _scale);
			tmp_matrix.appendRotation(_rotation_x, Vector3D.X_AXIS);
			tmp_matrix.appendRotation(_rotation_y, Vector3D.Y_AXIS);
			tmp_matrix.appendRotation(_rotation_z, Vector3D.Z_AXIS);
			tmp_matrix.appendTranslation(_x, _y, _z);
			tmp_matrix.append(camera_view);
			tmp_matrix.append(perspective);
			*/
			
			_context.setVertexBufferAt(0, _vertex_uv_buffer, 0, Context3DVertexBufferFormat.FLOAT_3);
			_context.setVertexBufferAt(1, _vertex_uv_buffer, 3, Context3DVertexBufferFormat.FLOAT_2);
			_context.setProgram(RENDER_SHADER);
			_context.setTextureAt(0, _texture);
			_context.drawTriangles(_index_buffer);
		}
		
		public function update(dt_scale:Number):void {
			this.update_vertex(0, I_ELE_V, this.get_vertex(0, I_ELE_V) - 0.01*dt_scale);
			this.update_vertex(1, I_ELE_V, this.get_vertex(1, I_ELE_V) - 0.01*dt_scale);
			this.update_vertex(2, I_ELE_V, this.get_vertex(2, I_ELE_V) - 0.01*dt_scale);
			this.update_vertex(3, I_ELE_V, this.get_vertex(3, I_ELE_V) - 0.01*dt_scale);
		}
		
		public function dispose():void {
			this._index_buffer.dispose();
			this._vertex_uv_buffer.dispose();
			this._texture.dispose();
		}
		
	}
}