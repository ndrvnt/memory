package mappa;

import util.Myevent.MyeventBTN;

class End extends h2d.Object {
	private var sprite:h2d.Bitmap;
	private var kiss:h2d.Anim;

	public function new() {
		super();
	}

	public function init() {
		this.sprite = new h2d.Bitmap(hxd.Res.background.toTile());
		this.addChild(this.sprite);
		var tf = new h2d.Text(hxd.Res.fonts.amiga.toFont());
		tf.scaleX = 0.5;
		tf.scaleY = 0.5;
		tf.x = 230;
		tf.y = 300;
		tf.text = "[clicca per ricominciare]";
		this.addChild(tf);

		var interaction = new h2d.Interactive(900, 600, this);
		interaction.onClick = function(event:hxd.Event) {
			MyeventBTN.instance.emit('START');
		}
	}
}
