package bpls.actions;

import com.rameses.rules.common.*;
import bpls.facts.*;

public class CollectFullPayment implements RuleActionHandler {
	def request;
	def addItems;
	public void execute(def tf, def drools) {
		addItems( tf, request );
	}
}