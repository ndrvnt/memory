package mappa;

import haxe.Timer;
import util.Myevent;
import entity.Tile;

@:publicFields
class Mappa {
	var wrapper:h2d.Object;
	var map:Array<Tile>;
	var selezionatoUno:Tile = null;
	var selezionatoDue:Tile = null;

	public static final instance:Mappa = new Mappa();

	private function new() {
		this.wrapper = new h2d.Object();
		Myevent.instance.on('SELEZIONA', this.selezionati);
	}

	public function generaTabella():h2d.Object {
		this.wrapper.removeChildren();
		var bg:h2d.Bitmap = new h2d.Bitmap(hxd.Res.background.toTile());
		this.wrapper.addChild(bg);
		var mazzo:Array<Int> = new Array<Int>();
		for (i in 0...12) {
			mazzo.push(i);
			mazzo.push(i);
		}
		Random.shuffle(mazzo);
		Random.shuffle(mazzo);
		var indice = 0;
		for (i in 0...6) {
			for (j in 0...4) {
				var tmp:Tile = new Tile(mazzo[indice], (i * 150), (j * 150), this);
				indice++;
				this.wrapper.addChild(tmp);
			}
		}
		return this.wrapper;
	}

	public function selezionati(tile:Tile) {
		if (this.selezionatoUno == null) {
			this.selezionatoUno = tile;
			tile.rilevare();
			return;
		}
		if (this.selezionatoUno == tile) {
			return;
		}
		if (this.selezionatoDue == null) {
			this.selezionatoDue = tile;
			this.selezionatoDue.rilevare();
		}

		if (this.selezionatoUno != null) {
			if (this.selezionatoDue != null) {
				Timer.delay(controllo, 1000);
			}
		}
	}

	private function controllo() {
		if (this.selezionatoUno != null) {
			if (this.selezionatoDue != null) {
				// ho le tile selezionate
				if (this.selezionatoDue.tipo == this.selezionatoUno.tipo) {
					// le devo aliminare
					this.selezionatoDue.elimina();
					this.selezionatoUno.elimina();
					this.selezionatoDue = null;
					this.selezionatoUno = null;
					this.controllofine();
				} else {
					this.selezionatoDue.coprire();
					this.selezionatoUno.coprire();
					this.selezionatoDue = null;
					this.selezionatoUno = null;
				}
			}
		}
	}

	public function eliminaFiglio(t:Tile) {
		this.wrapper.removeChild(t);
	}

	private function controllofine() {
		// alla fine deve rimanere solo lo spondo
		if (this.wrapper.numChildren == 1) {
			MyeventBTN.instance.emit("END");
		}
	}
}
