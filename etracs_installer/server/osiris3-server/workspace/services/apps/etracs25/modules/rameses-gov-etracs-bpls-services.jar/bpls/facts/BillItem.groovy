package bpls.facts;

import java.util.Date;

public class BillItem {
    
    BPApplication application;
    String objid;
    String acctid;
    BPLedger ledger;
    String type;
    LOB lob;
    String name;
    double amount;
    double  amtpaid;
    double amtdue;
    boolean expired;
    Date deadline;
    double surcharge;
    double interest;
    double discount;
    double total;
    Object account;
    int year;
    int qtr;
    int paypriority;
    double balance;
    String receivableid;
    
    Object surchargeaccount;
    Object interestaccount;
    
    /** Creates a new instance of BillItem */
    public BillItem() {
    }
    
    
}
