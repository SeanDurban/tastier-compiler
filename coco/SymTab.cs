using System;
 
namespace Tastier { 

public class Obj { // properties of declared symbol
   public string name; // its name
   public int kind;    // var, proc or scope
   public int type;    // its type if var (undef for proc)
   public int level;   // lexic level: 0 = global; >= 1 local
   public int constant;// Constant= 1 if a constant val, 0 if not
   public int assigned;  //Keeps track of how many times var has been assigned
   public int adr;     // address (displacement) in scope 
   public Obj next;    // ptr to next object in scope
   public bool param; //if obh is a parameter.
   //For Arrays
   public int isArray;
   public int arraySize;
   // for scopes
   public Obj outer;   // ptr to enclosing scope
   public Obj locals;  // ptr to locally declared objects
   public int nextAdr; // next free address in scope
   //for proc
   public int numParams; //Number of parameters 

}

public class SymbolTable {

   const int // object kinds
      var = 0, proc = 1, scope = 2; 

   const int // types
      undef = 0, integer = 1, boolean = 2;

   public readonly  String[] kinds ={"variable","procedure","scope"};
   public readonly  String[] types ={"undefined","integer","boolean"};
   public readonly  String[] levels ={"Global","Local"};
   public Obj topScope; // topmost procedure scope
   public int curLevel; // nesting level of current scope
   public Obj undefObj; // object node for erroneous symbols
   
   public bool mainPresent;
   Parser parser;
   
   public SymbolTable(Parser parser) {
      curLevel = -1; 
      topScope = null;
      undefObj = new Obj();
      undefObj.name = "undef";
      undefObj.kind = var;
      undefObj.type = undef;
      undefObj.level = 0;
      undefObj.adr = 0;
      undefObj.next = null;
      this.parser = parser; 
 	  mainPresent = false;
   }

// open new scope and make it the current scope (topScope)
   public void OpenScope() {
      Obj scop = new Obj();
      scop.name = "";
      scop.kind = scope; 
      scop.outer = topScope; 
      scop.locals = null;
      scop.nextAdr = 0;
      topScope = scop; 
      curLevel++;
   }

// close current scope
   public void CloseScope() {
      topScope = topScope.outer;
      curLevel--;
	  Obj curObj; 
	  if(topScope!=null){
	  curObj= topScope.locals;
		while(curObj!=null){
			if(curObj.kind==0){       //If identifier is a variable
				int level=0;
				if(curObj.level>=1){   //Set array levels[] index
					level=1;
				}
                String constant = "";
                if(curObj.constant==1){
                    constant= "Constant" ;
                }
                 String isArrayS="";
                if(curObj.isArray==1){
                	isArrayS="Array";
                }

				Console.WriteLine(";"+curObj.name+": "+levels[level]+" "+kinds[curObj.kind]+", "+ types[curObj.type] + ", "+ constant +isArrayS );
			}
			else{
				Console.WriteLine(";"+curObj.name+": "+kinds[curObj.kind]);
			}
			curObj=curObj.next;
		}
	  }
   }

// open new sub-scope and make it the current scope (topScope)
   public void OpenSubScope() {
   // lexic level remains unchanged
      Obj scop = new Obj();
      scop.name = "";
      scop.kind = scope;
      scop.outer = topScope;
      scop.locals = null;
   // next available address in stack frame remains unchanged
      scop.nextAdr = topScope.nextAdr;
      topScope = scop;
   }

// close current sub-scope
   public void CloseSubScope() {
   // update next available address in enclosing scope
      topScope.outer.nextAdr = topScope.nextAdr;
   // lexic level remains unchanged
      topScope = topScope.outer;
	 Obj curObj; 
	  if(topScope!=null){
	  curObj= topScope.locals;
		while(curObj!=null){
			if(curObj.kind==0){       //If identifier is a variable
				int level=0;
				if(curObj.level>=1){   //Set array levels[] index
					level=1;
				}
                String constant = "";
                if(curObj.constant==1){
                    constant= "Constant" ;
                }
                String isArrayS="";
                if(curObj.isArray==1){
                	isArrayS="Array";
                }
				Console.WriteLine(";"+curObj.name+": "+levels[level]+" "+kinds[curObj.kind]+", "+ types[curObj.type] + ", "+ constant +isArrayS );
			}
			else{
				Console.WriteLine(";"+curObj.name+": "+kinds[curObj.kind]);
			}
			curObj=curObj.next;
		}
	  }
   }

   // create new array object node in current scope
   public Obj NewObj(string name, int kind, int type,int constant, int isArray, int arrSize) {
      Obj p, last; 
      Obj obj = new Obj();
      obj.name = name; obj.kind = kind;
      obj.type = type; obj.level = curLevel; 
      obj.constant= constant;
      obj.assigned=0;
      obj.isArray=isArray;
      obj.arraySize=arrSize;
      obj.next = null; 
      obj.param= false;
      p = topScope.locals; last = null;
      while (p != null) { 
         if (p.name == name)
            parser.SemErr("name declared twice");
         last = p; p = p.next;
      }
      if (last == null)
         topScope.locals = obj; else last.next = obj;
      if (kind == var)
         obj.adr = topScope.nextAdr++;
      return obj;
   }
    // create new object node in current scope
   public Obj NewObj(string name, int kind, int type,int constant) {
      Obj p, last; 
      Obj obj = new Obj();
      obj.name = name; obj.kind = kind;
      obj.type = type; obj.level = curLevel; 
      obj.constant= constant;
      obj.assigned=0;
      obj.isArray=0;
      obj.next = null; 
      obj.param= false;
      p = topScope.locals; last = null;
      while (p != null) { 
         if (p.name == name)
            parser.SemErr("name declared twice");
         last = p; p = p.next;
      }
      if (last == null)
         topScope.locals = obj; else last.next = obj;
      if (kind == var)
         obj.adr = topScope.nextAdr++;
      return obj;
   }
   // create new parameter object node in current scope
   public Obj NewObj(string name, int kind, int type,int constant, bool isParam) {
      Obj p, last; 
      Obj obj = new Obj();
      obj.name = name; obj.kind = kind;
      obj.type = type; obj.level = curLevel; 
      obj.constant= constant;
      obj.assigned=0;
      obj.param= isParam;
      obj.isArray=0;
      obj.next = null; 
      p = topScope.locals; last = null;
      while (p != null) { 
         if (p.name == name)
            parser.SemErr("name declared twice");
         last = p; p = p.next;
      }
      if (last == null)
         topScope.locals = obj; else last.next = obj;
      if (kind == var)
         obj.adr = topScope.nextAdr++;
      return obj;
   }

// search for name in open scopes and return its object node
   public Obj Find(string name) {
      Obj obj, scope;
      scope = topScope;
      while (scope != null) { // for all open scopes
         obj = scope.locals;
         while (obj != null) { // for all objects in this scope
            if (obj.name == name) return obj;
            obj = obj.next;
         }
         scope = scope.outer;
      }
      parser.SemErr(name + " is undeclared");
      return undefObj;
   }

} // end SymbolTable

} // end namespace
