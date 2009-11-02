package
{
	import flash.geom.*;
	
	import mx.containers.Canvas;
	
	import pl.bmnet.gpcas.geometry.Poly;

	public class PolyCanvas extends Canvas
	{
		public var polygons : Array = [];
		
		
		public function clear(){
			graphics.clear();
		}
		
		
		
		public function drawPoly(poly:Poly, scale:Number = 1, ox:int=0, oy:int=0){
			graphics.lineStyle(2, 0xFF0000);
			graphics.beginFill(0xCC92A8); 
			for (var i:int=0; i<poly.getNumPoints();i++){
				if (i==0){
					graphics.moveTo(poly.getX(i)*scale+ox,poly.getY(i)*scale+oy);
				} else {
					graphics.lineTo(poly.getX(i)*scale+ox,poly.getY(i)*scale+oy);
				}
			}
			for (var i:int=0; i<poly.getNumPoints();i++){
					graphics.drawCircle(poly.getX(i)*scale+ox,poly.getY(i)*scale+oy,3);
			}
			graphics.endFill();
		} 
		
		

		
		public function drawPoint(x:int, y:int){
			graphics.lineStyle(2, 0xA5CC81);
			graphics.drawCircle(x,y,4);
		}
		
		public function drawLine(p1:Array,p2:Array){
			
			graphics.lineStyle(1, 0x0000CC);
			graphics.moveTo(p1[0],p1[1]);
			graphics.lineTo(p2[0],p2[1]);
		}
		
		public function drawPolyline(polyline : Array /* of Point */):void{
			
			graphics.lineStyle(2, 0x0000CC);
			var point : Point = polyline[0] as Point;
			graphics.moveTo(point.x,point.y);
			for (var i : int = 1; i<polyline.length; i++){
				point = polyline[i];
				graphics.lineTo(point.x,point.y);
			}
		}
		
		public function PolyCanvas()
		{
			super();
		}
		
		
		
	}
}