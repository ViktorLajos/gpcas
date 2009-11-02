package pl.bmnet.gpcas.geometry
{
	import flash.geom.Point;
	
	import mx.controls.Alert;
	
	public class LineIntersection
	{
		public function LineIntersection(){
		}
		
		
		

		public static function iteratePoints(points:Array, s1:Point, s2:Point,e1:Point,e2:Point):Array{
			var direction:Boolean=true;
			var pl : int = points.length;
			var s1Ind : int = points.indexOf(s1);
			var s2Ind : int = points.indexOf(s2);
			var start : int = s1Ind;
			if (s2Ind>s1Ind) direction=false;
			var newPoints : Array = [];
			var point : Point ;
			if (direction){
			for (var i : int=0; i<pl; i++){
				point=(i+start<pl)?points[i+start]:points[i+start-pl];
				newPoints.push(point);
				if ((point.equals(e1))||(point.equals(e2))){
					break;
				}
			}
			} else {
			for (var i : int =pl; i>=0; i--){
				point=(i+start<pl)?points[i+start]:points[i+start-pl];
				newPoints.push(point);
				if ((point.equals(e1))||(point.equals(e2))){
					break;
				}
			}	
			}
			
			return newPoints;			
		}
		
		
		public static function intersectPoly(poly:Poly, line : Array /* of Points */):Array{
			var res : Array = [];
			var numPoints : int = poly.getNumPoints();
			var ip : Point;
			var p1 : Point;
			var p2 : Point;
			var p3 : Point;
			var p4 : Point;
			var firstIntersection : IntersectionPoint = null;
			var lastIntersection  : IntersectionPoint = null;
			var firstIntersectionLineIndex:int=-1;
			var lastIntersectionLineIndex:int=-1;
			var firstFound : Boolean = false;
			for (var i : int = 1; i<line.length; i++){
				p1=line[i-1];
				p2=line[i];
				var maxDist : Number = 0;
				var minDist	: Number = Number.MAX_VALUE;
				var dist : int = -1;
				for (var j : int = 0; j<numPoints; j++){
					p3=poly.getPoint(j==0?numPoints-1:j-1);
					p4=poly.getPoint(j);	
					if ((ip=LineHelper.lineIntersectLine(p1,p2,p3,p4))!=null){
						dist=Point.distance(ip,p2);		
							
						if ((dist>maxDist)&&(!firstFound)){
							maxDist=dist;
							firstIntersection=new IntersectionPoint(p3,p4,ip);
							firstIntersectionLineIndex=i;
						}
						if (dist<minDist){
							minDist=dist;
							lastIntersection=new IntersectionPoint(p3,p4,ip);
							lastIntersectionLineIndex=i-1;
						}
					}
				}
				firstFound=(firstIntersection!=null);
			}
			/*
			Alert.show(firstIntersection.toString());
			Alert.show(lastIntersection.toString());*/
			if ((firstIntersection!=null)&&(lastIntersection!=null)){
			var newLine : Array /* of Point */ = new Array(lastIntersectionLineIndex-firstIntersectionLineIndex+3);
			newLine[0]=firstIntersection.intersectionPoint;
			var j : int = 1;
			for (var i : int = firstIntersectionLineIndex; i<=lastIntersectionLineIndex; i++){
				newLine[j++] = line[i];
			}
			newLine[newLine.length-1]=lastIntersection.intersectionPoint;
			if (
			(
			(firstIntersection.polygonPoint1.equals(lastIntersection.polygonPoint1))&&
			(firstIntersection.polygonPoint2.equals(lastIntersection.polygonPoint2))
			)||
			(
			(firstIntersection.polygonPoint1.equals(lastIntersection.polygonPoint2))&&
			(firstIntersection.polygonPoint2.equals(lastIntersection.polygonPoint1))
			)
			){
				var poly1 : PolySimple = new PolySimple();
				poly1.add(newLine);
				var finPoly1 : PolyDefault = poly.intersection(poly1) as PolyDefault;
				var finPoly2 : PolyDefault = poly.xor(poly1) as PolyDefault;
				if ((checkPoly(finPoly1))&&(checkPoly(finPoly2))){
					return [finPoly1,finPoly2];
				}
			} else {
				var points1 : Array = iteratePoints(poly.getPoints(),firstIntersection.polygonPoint1,firstIntersection.polygonPoint2, lastIntersection.polygonPoint1, lastIntersection.polygonPoint2);
				points1=points1.concat(newLine.reverse());
				var points2 : Array = iteratePoints(poly.getPoints(),firstIntersection.polygonPoint2,firstIntersection.polygonPoint1, lastIntersection.polygonPoint1, lastIntersection.polygonPoint2);
				points2=points2.concat(newLine);
				var poly1 : PolySimple = new PolySimple();
				poly1.add(points1);
				var poly2 : PolySimple = new PolySimple();
				poly2.add(points2);
				var finPoly1 : PolyDefault = poly.intersection(poly1) as PolyDefault;
				var finPoly2 : PolyDefault = poly.intersection(poly2) as PolyDefault;
				if ((checkPoly(finPoly1))&&(checkPoly(finPoly2))){
					return [finPoly1,finPoly2];
				}
			}	
		}
		return null;	
		}
		
		public static function checkPoly(poly:PolyDefault):Boolean{
			var noHoles : int=0;
			for (var i : int = 0; i<poly.getNumInnerPoly(); i++){
				var innerPoly : Poly = poly.getInnerPoly(i) as Poly;
				if (innerPoly.isHole()){
					return false;
				} else {
					noHoles++;
				}
				if (noHoles>1) return false;
			}
			return true;
		}
	
	}
	
}