package ui;

import h2d.Text;
import h2d.Object;

class Baloon extends h2d.Object {
	var bb:BG;
	var toDelete:Bool;
	var velocity:Float = 0.2;
	var opacity:Float = 0.02;
	var testo:Text;

	public function new(txt:String) {
		super();
		this.toDelete = false;
		this.testo = new Text(hxd.res.DefaultFont.get());
		testo.text = txt;
		testo.textColor = 0xffaa99;
		this.addChild(testo);
	}

	public function update(dt:Float) {
		if (!this.toDelete) {
			if (this.alpha > 0) {
				this.alpha -= this.opacity;
				this.y -= this.velocity;
			} else {
				this.toDelete = true;
			}
		}
	}

	public function cancella() {
		this.removeChild(this.testo);
	}
}
