package pl.bmnet.gpcas.util
{
	public class ArrayList implements List
	{
		private var _array : Array = [];
		public function ArrayList(arr:Array = null){
			_array=arr==null?[]:arr;	
		}
		
		public function add(value:Object):void{
			_array.push(value);
			
		};
		public function get(index:int):Object{
		return _array[index];
		};
		public function size():int{
		return _array.length;
		}
		
		public function clear():void{
			_array  = [];
		}
		
		public function equals(list:List):Boolean{
			if (size()!=list.size()) return false;
			for (var i : int = 0; i<size(); i++){
				var obj1 : Object = get(i);
				var obj2 : Object = list.get(i);
				if (!ArrayHelper.valueEqual(obj1,obj2)){
					return false;
				}
			}
			return true;
		}
		
		public function hashCode():int{
			return 0;
		}
		
		public function isEmpty():Boolean{
			return size()==0;
		}
		
		public function toArray():Array{
			return _array;
		}
	}
}