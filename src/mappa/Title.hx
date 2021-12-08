package mappa;

import util.Myevent.MyeventBTN;

class Title extends h2d.Object {
	private var sprite:h2d.Bitmap;
	private var start:h2d.Bitmap;

	public function new() {
		super();
	}

	public function init() {
		this.sprite = new h2d.Bitmap(hxd.Res.background.toTile());
		this.addChild(this.sprite);
		this.start = new h2d.Bitmap(hxd.Res.START.toTile());
		this.addChild(this.start);
		this.start.x = 180;
		this.start.y = 241;
		var interaction = new h2d.Interactive(540, 118, this.start);
		interaction.onClick = function(event:hxd.Event) {
			MyeventBTN.instance.emit('START');
		}
	}
}
