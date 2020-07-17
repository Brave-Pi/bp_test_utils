package bp.test;

class Utils {
	public static macro function attempt(expr:haxe.macro.Expr, verbose:Bool = false) {
		var print = if (verbose) macro trace(e); else macro null;
		return macro try {
			$expr;
			true;
		} catch (e) {
			$print;
			false;
		};
	}
}
