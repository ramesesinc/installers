package bpls.actions;

import com.rameses.rules.common.*;
import bpls.facts.*;

public class CollectExcess implements RuleActionHandler {
	def request;
	def NS;
	public void execute(def m, def drools) {
		println "process excess for tax credit " + m.excess;
		request.taxcredit =  m.excess;
	}
}