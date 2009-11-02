package pl.bmnet.gpcas.geometry
{
	public class Rectangle
	{
		public var x : int; 
		public  var y : int;
		public  var w : int;
		public  var h : int;
		
		public function Rectangle(_x:int=0, _y:int=0, _w:int=0, _h:int=0)
		{
			x=_x;
			y=_y;
			w=_w;
			h=_h;
		}
		
		
		
		
		public function getMaxY():int{
		return y+h;
		} 
		public function getMinY():int{
		return y;
		}
		public function getMaxX():int{
		return x+w;
		}
		public function getMinX():int{
		return x;
		}
		public function toString():String{
			return "["+x.toString()+" "+y.toString()+" "+w.toString()+" "+h.toString()+"]";
		}
	}
}