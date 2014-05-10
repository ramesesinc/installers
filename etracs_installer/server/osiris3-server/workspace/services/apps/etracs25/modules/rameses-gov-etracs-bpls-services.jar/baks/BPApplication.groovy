package bpls.facts;

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

    public BPApplication(int yr) {
        this.appyear = appyear;
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
