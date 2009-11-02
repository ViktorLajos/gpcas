package pl.bmnet.gpcas.geometry
{
	import flash.geom.Point;
	
	public class IntersectionPoint
	{
		public var polygonPoint1 : Point /* of Point */;
		public var polygonPoint2 : Point /* of Point */;
		public var intersectionPoint : Point;
			
		public function IntersectionPoint(p1:Point,p2:Point,p3:Point){
			polygonPoint1=p1;
			polygonPoint2=p2;
			intersectionPoint=p3;
		}
		
		public function toString():String{
			return "P1 :"+polygonPoint1.toString()+" P2:"+polygonPoint2.toString()+" IP:"+intersectionPoint.toString();
		}

	}
}