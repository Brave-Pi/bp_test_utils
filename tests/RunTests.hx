package;

import tink.unit.*;
import tink.testrunner.*;
import tink.streams.Stream;
import tink.CoreApi;
import bp.test.Utils.attempt;

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
			Noise;
		}).attempt(true));
		var shouldPass = asserts.assert(attempt(39 / 1) == true);
		return asserts.assert(!shouldFail.holds.toBool() && shouldPass.holds.toBool());
	}
}
