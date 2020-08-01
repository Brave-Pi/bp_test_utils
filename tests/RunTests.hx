package;

import tink.unit.*;
import tink.testrunner.*;
import tink.CoreApi;

using Lambda;
using bp.test.Utils;

class RunTests {
	static function main() {
		Runner.run(TestBatch.make([new Test(),])).handle(Runner.exit);
	}
}

@:asserts
class Test {
	public function new() {}

	public function quick_test() {
		var shouldFail = asserts.assert(({
			var d:Dynamic = null;
			var z = d.x * d.x;
			trace(z);
			Noise;
		}).attempt());
		var shouldPass = asserts.assert((39 / 1).attempt() == true);
		return asserts.assert(!shouldFail.holds.toBool() && shouldPass.holds.toBool());
	}
}
