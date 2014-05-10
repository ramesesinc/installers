package bpls.actions;

import com.rameses.rules.common.*;
import bpls.facts.*;

public class CalcSurcharge implements RuleActionHandler {
	def request;
	def NS;
	def BA;
	public void execute(def params, def drools) {
		def tf = params.billitem;
		def amt = params.amount.doubleValue;
		def sa = params.account;
		if(!sa) {
			throw new Exception("CalcSurcharge rule error. Please provide surcharge account");
		}
		tf.surcharge = NS.round(amt);
		tf.total += NS.round( tf.surcharge );
		tf.surchargeaccount = BA.findAccount( [objid: sa.key] );
		if(!tf.surchargeaccount) {
			throw new Exception("CalcSurcharge rule error. surcharge account not found " + sa.title);
		}
	}
}
