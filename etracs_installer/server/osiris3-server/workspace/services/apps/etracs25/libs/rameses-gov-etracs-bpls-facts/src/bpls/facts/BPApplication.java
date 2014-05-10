/*
 * BPApplication.java
 *
 * Created on December 1, 2013, 5:59 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package bpls.facts;

/**
 *
 * @author Elmo
 */
public class BPApplication {
    
    private String objid;
    private String orgtype;
    private String officetype;
    private String apptype;
    private String txnmode;
    private String barangayid;
    private int appyear;
    private String appno;
    
    /** Creates a new instance of BPApplication */
    public BPApplication() {
    }

    public String getOrgtype() {
        return orgtype;
    }

    public void setOrgtype(String orgtype) {
        this.orgtype = orgtype;
    }

    public String getOfficetype() {
        return officetype;
    }

    public void setOfficetype(String officetype) {
        this.officetype = officetype;
    }

    public String getApptype() {
        return apptype;
    }

    public void setApptype(String apptype) {
        this.apptype = apptype;
    }

    public String getTxnmode() {
        return txnmode;
    }

    public void setTxnmode(String txnmode) {
        this.txnmode = txnmode;
    }

    public String getBarangayid() {
        return barangayid;
    }

    public void setBarangayid(String barangayid) {
        this.barangayid = barangayid;
    }

    public int getAppyear() {
        return appyear;
    }

    public void setAppyear(int appyear) {
        this.appyear = appyear;
    }

    public String getObjid() {
        return objid;
    }

    public void setObjid(String objid) {
        this.objid = objid;
    }

    public String getAppno() {
        return appno;
    }

    public void setAppno(String appno) {
        this.appno = appno;
    }
    
    
    
}
