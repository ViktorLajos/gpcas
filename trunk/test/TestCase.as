package 
{
	import flash.utils.describeType;
	
	public class TestCase
	{
		public var logFunction : Function = function(msg:String):void{trace(msg);};
		public var resultFunction : Function = function(result:Boolean):void{};
		public var assertEqualsFunction : Function = null;
		
		public function TestCase()
		{
		}
		
		 public function assertEquals(o1:Object, o2:Object):void{
		 	if (assertEqualsFunction!=null) assertEqualsFunction(o1,o2);
		 	try{
		 		if ((o1==o2)||(o1["equals"](o2))){
		 			logFunction("Passed - expected "+o2.toString()+" has "+o1.toString());
		 			resultFunction(true);
		 			return;
		 		}
		 	} catch (e:Error){};
		 	logFunction("Not passed - expected "+o2.toString()+" has "+o1.toString());
		 	resultFunction(false);
		 }
		 
		 public function assertTrue(val:Boolean):void{
		 	if (val){
		 		logFunction("Passed - is true");
		 		resultFunction(true);
		 		return;
		 	}
		 	logFunction("Not passed - is false");
		 	resultFunction(false);
		 }
		 
		 
		 public function assertFalse(val:Boolean):void{
		 	if (!val){
		 		logFunction("Passed - is false");
		 		resultFunction(true);
		 		return;
		 	}
		 	logFunction("Not passed - is true");
		 	resultFunction(false);
		 }
		 
		 public function get methods():Array{
		 	var description:XML = describeType(this);
			var methods:Array = [];
			for each (var method : XML in description.method){
				var name : String = method.@name.toString();
				if (name.indexOf("test")==0){
					methods.push(name);
				}		
			}
   			methods=methods.sort();
   			return methods;
		 }
		 
		 
		 public function runTest():void{
   			
   			for each (var methodName : String in methods){
   				logFunction("Executing method "+methodName);
   				this[methodName]();
   			}
		 }

	}
}