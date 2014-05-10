package bpls.actions;

import com.rameses.rules.common.*;
import bpls.facts.*;

public class CalcInterest implements RuleActionHandler {
	def request;
	def NS;
	def BA;
	public void execute(def params, def drools) {
		def tf = params.billitem;
		def amt = params.amount.doubleValue;
		def sa = params.account;
		if(!sa) 
			throw new Exception("CalcInterest rule error. Please provide interest account");
		tf.interest = NS.round(amt);
		tf.total += NS.round( tf.interest );
		tf.interestaccount = BA.findAccount( [objid: sa.key] );
		if(!tf.interestaccount) {
			throw new Exception("CalcSurcharge rule error. interest account not found " + sa.title);
		}
	}
}