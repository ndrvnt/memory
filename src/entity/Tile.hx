package entity;

import util.Myevent;
import mappa.Mappa;
import h2d.Object;

@:publicFields
class Tile extends h2d.Object {
	var tipo:Int = -1;
	var sprite:h2d.Bitmap;
	var cover:h2d.Bitmap;
	var mappa:Mappa;
	var scoprire:Int = 0;
	var padre:Mappa;

	public function new(tipo:Int, X:Int, Y:Int, padre:Mappa) {
		super();
		this.tipo = tipo;
		this.padre = padre;
		this.cover = new h2d.Bitmap(hxd.Res.cover.toTile());
		this.sprite = this.getSprite();
		this.addChild(this.sprite);

		this.addChild(this.cover);
		this.x = X;
		this.y = Y;
		this.mappa = Mappa.instance;

		var interaction = new h2d.Interactive(150, 150, sprite);
		interaction.onClick = function(event:hxd.Event) {
			Myevent.instance.emit('SELEZIONA', this);
			// if (this.mappa.selezionatoUno != null) {
			// 	if (this.mappa.selezionatoDue != null) {
			// 		return;
			// 	} else {
			// 		this.mappa.selezionatoDue = this;
			// 		this.mappa.selezionati();
			// 	}
			// } else {
			// 	this.mappa.selezionatoUno = this;
			// }
		}
	}

	public function rivelare() {
		this.cover.alpha = 0;
	}

	public function coprire() {
		this.cover.alpha = 1;
	}

	public function update(dt:Float) {}

	private function getSprite():h2d.Bitmap {
		var sprite:h2d.Bitmap;
		switch (this.tipo) {
			case 0:
				sprite = new h2d.Bitmap(hxd.Res.space.toTile());
			case 1:
				sprite = new h2d.Bitmap(hxd.Res.haxe.toTile());
			case 2:
				sprite = new h2d.Bitmap(hxd.Res.georgia.toTile());
			case 3:
				sprite = new h2d.Bitmap(hxd.Res.russia.toTile());
			case 4:
				sprite = new h2d.Bitmap(hxd.Res.node.toTile());
			case 5:
				sprite = new h2d.Bitmap(hxd.Res.gdr.toTile());
			case 6:
				sprite = new h2d.Bitmap(hxd.Res.birra.toTile());
			case 7:
				sprite = new h2d.Bitmap(hxd.Res.angular.toTile());
			case 8:
				sprite = new h2d.Bitmap(hxd.Res.heaps.toTile());
			case 9:
				sprite = new h2d.Bitmap(hxd.Res.bau.toTile());
			case 10:
				sprite = new h2d.Bitmap(hxd.Res.bear.toTile());
			case 11:
				sprite = new h2d.Bitmap(hxd.Res.unipi.toTile());
			case _:
				sprite = new h2d.Bitmap(hxd.Res.bau.toTile());
		}
		return sprite;
	}

	public function elimina() {
		this.removeChildren();
		this.cover = null;
		this.sprite = null;
		this.tipo = -1;
		this.padre.eliminaFiglio(this);
	}
}
