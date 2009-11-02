package {
	
	public class ET
	{
		public var value : int = 10;
		
		public function ET(val:int){
			value=val;
		}
		
		public function equals(obj:Object):Boolean{
			if (!(obj is ET)) return false;
			return (obj as ET).value==value;
		}
						
		public function EqualTest()
		{
		}

	}
}