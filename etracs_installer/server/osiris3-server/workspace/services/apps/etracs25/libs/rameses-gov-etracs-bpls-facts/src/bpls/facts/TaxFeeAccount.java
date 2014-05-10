/*
 * TaxFeeAccount.java
 *
 * Created on December 1, 2013, 6;00 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package bpls.facts;

/**
 *
 * @author Elmo
 */
public class TaxFeeAccount {
    
    private String objid;
    private String acctid;
    private String type;
    private LOB lob;
    private String name;
    private double amount;
    private double  amtdue;
    private double assessedvalue;
    private Object data;
    
    /** Creates a new instance of TaxFeeAccount */
    public TaxFeeAccount() {
    }
    
    public String getObjid() {
        return objid;
    }
    
    public void setObjid(String objid) {
        this.objid = objid;
    }
    
    public String getAcctid() {
        return acctid;
    }
    
    public void setAcctid(String acctid) {
        this.acctid = acctid;
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public LOB getLob() {
        return lob;
    }
    
    public void setLob(LOB lob) {
        this.lob = lob;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public double getAmount() {
        return amount;
    }
    
    public void setAmount(double amount) {
        this.amount = amount;
    }
    
    public double getAmtdue() {
        return amtdue;
    }
    
    public void setAmtdue(double amtdue) {
        this.amtdue = amtdue;
    }
    
    public double getAssessedvalue() {
        return assessedvalue;
    }
    
    public void setAssessedvalue(double assessedvalue) {
        this.assessedvalue = assessedvalue;
    }
    
    public Object getData() {
        return data;
    }
    
    public void setData(Object data) {
        this.data = data;
    }

}
