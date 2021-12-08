package ui;

import h2d.Object;

class BG extends h2d.Object {
	var bg:h2d.Object;
	var cover:h2d.Bitmap;
	var interaction:h2d.Interactive;
	var clicked:Bool = false;
	var _tipo:Int;
	var fronte:h2d.Bitmap;

	public function new(X:Int, Y:Int, width:Int, height:Int, color:Int) {
		super();
		this.bg = new h2d.Bitmap(h2d.Tile.fromColor(color, width, height));
		this.addChild(this.bg);
		this.x = X;
		this.y = Y;
		// cover = new h2d.Bitmap(hxd.Res.cover.toTile(), this);
	}
}
