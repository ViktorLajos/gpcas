package pl.bmnet.gpcas.util
{
	import flash.geom.Point;
	

	
	public class ArrayHelper
	{
		public function ArrayHelper()
		{
		}
		
		public static function create2DArray(x:int,y:int):Array{
			var a : Array = new Array(x);
			for (var i:int=0; i<x; i++){
				a[i]=new Array(y);
			}
			return a;
		}
		
		public static function valueEqual(obj1:Object, obj2:Object):Boolean{
			if (obj1==obj2) return true;
			try{
				if (obj1.equals(obj2)==true) return true;
			} catch (e:Error){};
			return false;
		}
		
		public static function sortPointsClockwise(vertices:Object):Object{
			var isArrayList : Boolean = false;
			if (vertices is ArrayList){
				vertices=(vertices as ArrayList).toArray();
				isArrayList=true;
			}
			var maxTop  	: Point = null;
			var maxBottom 	: Point = null;
			var maxLeft  	: Point = null;
			var maxRight 	: Point = null;
			var maxLeftIndex : int;
			var newVertices : Array =vertices as Array;
			for (var i : int = 0; i<vertices.length; i++){
				var vertex : Point = vertices[i] as Point;
				if ((maxTop==null)||(maxTop.y>vertex.y)||((maxTop.y==vertex.y)&&(vertex.x<maxTop.x))){
						maxTop=vertex;	
				}
				if ((maxBottom==null)||(maxBottom.y<vertex.y)||((maxBottom.y==vertex.y)&&(vertex.x>maxBottom.x))){
						maxBottom=vertex;	
				}
 				if ((maxLeft==null)||(maxLeft.x>vertex.x)||((maxLeft.x==vertex.x)&&(vertex.y>maxLeft.y))){
						maxLeft=vertex;
						maxLeftIndex=i;	
				} 
				if ((maxRight==null)||(maxRight.x<vertex.x)||((maxRight.x==vertex.x)&&(vertex.y<maxRight.y))){
						maxRight=vertex;	
				}
			}
			
			if (maxLeftIndex>0){
				newVertices = new Array(vertices.length);
				var j : int = 0;
				for (var i:int=maxLeftIndex; i<vertices.length;i++){
					newVertices[j++]=vertices[i];
				}
				for (var i:int=0; i<maxLeftIndex; i++){
					newVertices[j++]=vertices[i];
				}
				vertices=newVertices;
			}
			var reverse  : Boolean = false;
			for each (var vertex : Point in  vertices){
				if (vertex.equals(maxBottom)){
					reverse=true;
					break;
				} else if (vertex.equals(maxTop)){
					break;
				} 
			}
			if (reverse){
				newVertices=new Array(vertices.length);
				newVertices[0]=vertices[0];
				var j : int=1;
				for (var i:int=vertices.length-1; i>0; i--){
					newVertices[j++]=vertices[i];
				}
				vertices=newVertices;
			}
			return (isArrayList?(new ArrayList(vertices as Array)):(vertices as Array));
		}
		
	}
}