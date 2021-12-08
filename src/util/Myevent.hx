package util;

import entity.Tile;

// import h2d.domkit.Object;
// @:publicFields
// class Evento {
// 	var nome:String;
// 	var fun:Object->Void;
// }
class Myevent {
	private var eventi:Map<String, Tile->Void>;

	public static final instance:Myevent = new Myevent();

	private function new() {
		this.eventi = new Map<String, Tile->Void>();
	}

	public function on(nome:String, f:Tile->Void) {
		this.eventi[nome] = f;
	}

	public function emit(nome:String, arg:Tile) {
		this.eventi[nome](arg);
	}
}

class MyeventBTN {
	private var eventi:Map<String, Void->Void>;

	public static final instance:MyeventBTN = new MyeventBTN();

	private function new() {
		this.eventi = new Map<String, Void->Void>();
	}

	public function on(nome:String, f:Void->Void) {
		this.eventi[nome] = f;
	}

	public function emit(nome:String) {
		this.eventi[nome]();
	}
}
