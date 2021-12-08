import mappa.End;
import util.Myevent.MyeventBTN;
import mappa.Title;
import mappa.Mappa;

@:publicFields
class Game extends hxd.App {
	var titleScene:h2d.Scene;
	var mainscene:h2d.Scene;
	var endscene:h2d.Scene;
	var mappa:Mappa;
	var title:Title;
	var fine:End;

	override function init() {
		super.init();
		this.titleScene = new h2d.Scene();
		this.title = new Title();

		this.endscene = new h2d.Scene();
		this.fine = new End();

		this.mainscene = new h2d.Scene();
		this.mappa = Mappa.instance;
		this.title.init();
		this.titleScene.addChild(this.title);
		this.mainscene.addChild(this.mappa.generaTabella());

		this.fine.init();
		this.endscene.addChild(this.fine);

		setScene(this.titleScene);
		MyeventBTN.instance.on("START", this.iniziaGioco);
		MyeventBTN.instance.on("END", this.fineGioco);
	}

	public function iniziaGioco():Void {
		this.mainscene.removeChildren();
		this.mainscene.addChild(this.mappa.generaTabella());
		setScene(this.mainscene);
	}

	public function fineGioco():Void {
		setScene(this.endscene);
	}

	override function update(dt:Float):Void {}

	private function controlloHit() {}

	public static var inst:Game;

	static function main() {
		#if js
		hxd.Res.initEmbed();
		#else
		hxd.res.Resource.LIVE_UPDATE = true;
		hxd.Res.initLocal();
		#end
		inst = new Game();
	}
}
