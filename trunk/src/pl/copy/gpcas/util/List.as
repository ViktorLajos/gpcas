package pl.bmnet.gpcas.util
{
	public interface List
	{
	function add(value:Object):void;
	function get(index:int):Object;
	function size():int;	
	function clear():void;
	function equals(list:List):Boolean;
	function hashCode():int;
	function isEmpty():Boolean;
	function toArray():Array;
	}
	
	
}
