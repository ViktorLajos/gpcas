package pl.bmnet.gpcas.geometry
{
	import flash.geom.Point;
	
	public class LineHelper
	{
		public function LineHelper()
		{
		}

public static function equalPoint(p1:Array,p2:Array):Boolean{
	return ((p1[0]==p2[0])&&(p1[1]==p2[1]));
}

public static function equalVertex(s1:Array,e1:Array,s2:Array,e2:Array) : Boolean{
	return (
		((equalPoint(s1,s2))&&(equalPoint(e1,e2)))
		||
		((equalPoint(s1,e2))&&(equalPoint(e1,s2)))
		);
}

public static function distancePoints(p1:Array, p2:Array):Number{
	return Math.sqrt((p2[0]-p1[0])*(p2[0]-p1[0]) + (p2[1]-p1[1])*(p2[1]-p1[1]));  
}

public static function clonePoint(p:Array):Array{
	return [p[0],p[1]];
}

public static function cloneLine(line:Array):Array{
	var res : Array = new Array(line.length);
	for (var i : int = 0; i<line.length; i++){
		res[i]=[line[i][0],line[i][1]];
	}
	return res;
}

public static function addLineToLine(line1:Array,line2:Array):void{
	for (var i : int = 0; i<line2.length; i++){
		line1.push(clonePoint(line2[i]));
	}
}

public static function roundPoint(p:Array) : void{
	p[0]=Math.round(p[0]);
	p[1]=Math.round(p[1]);
}

//---------------------------------------------------------------
//Checks for intersection of Segment if as_seg is true.
//Checks for intersection of Line if as_seg is false.
//Return intersection of Segment "AB" and Segment "EF" as a Point
//Return null if there is no intersection
//---------------------------------------------------------------
public static function lineIntersectLine(A:Point,B:Point,E:Point,F:Point,as_seg:Boolean=true):Point
{
	var ip:Point;
	var a1:Number;
	var a2:Number;
	var b1:Number;
	var b2:Number;
	var c1:Number;
	var c2:Number;
 
	a1= B.y-A.y;
	b1= A.x-B.x;
	c1= B.x*A.y - A.x*B.y;
	a2= F.y-E.y;
	b2= E.x-F.x;
	c2= F.x*E.y - E.x*F.y;
 
	var denom:Number=a1*b2 - a2*b1;
	if(denom == 0){
		return null;
	}
	ip=new Point();
	ip.x=(b1*c2 - b2*c1)/denom;
	ip.y=(a2*c1 - a1*c2)/denom;
 
	//---------------------------------------------------
	//Do checks to see if intersection to endpoints
	//distance is longer than actual Segments.
	//Return null if it is with any.
	//---------------------------------------------------
	if(as_seg){
		if(Math.pow((ip.x - B.x) + (ip.y - B.y), 2) > Math.pow((A.x - B.x) + (A.y - B.y), 2)){
			return null;
		}
		if(Math.pow((ip.x - A.x) + (ip.y - A.y), 2) > Math.pow((A.x - B.x) + (A.y - B.y), 2)){
			return null;
		}	
 
		if(Math.pow((ip.x - F.x) + (ip.y - F.y), 2) > Math.pow((E.x - F.x) + (E.y - F.y), 2)){
			return null;
		}
		if(Math.pow((ip.x - E.x) + (ip.y - E.y), 2) > Math.pow((E.x - F.x) + (E.y - F.y), 2)){
			return null;
		}
	}
	return new Point(Math.round(ip.x),Math.round(ip.y));
}




}
	

	
	
}