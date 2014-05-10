/*
 * BillItem.java
 *
 * Created on December 6, 2013, 3:53 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package bpls.facts;

import java.util.Date;

/**
 *
 * @author Elmo
 */
public class BillItem {
    
    private BPApplication application;
    private String objid;
    private String acctid;
    private BPLedger ledger;
    private String type;
    private LOB lob;
    private String name;
    private double amount;
    private double  amtpaid;
    private double amtdue;
    private boolean expired;
    private Date deadline;
    private double surcharge;
    private double interest;
    private double discount;
    private double total;
    private Object account;
    private int year;
    private int qtr;
    private int paypriority;
    private double balance;
    private String receivableid;
    
    private Object surchargeaccount;
    private Object interestaccount;
    
    /** Creates a new instance of BillItem */
    public BillItem() {
    }
    
    
    public double getAmtpaid() {
        return amtpaid;
    }
    
    public void setAmtpaid(double amtpaid) {
        this.amtpaid = amtpaid;
    }
    
    public BPLedger getLedger() {
        return ledger;
    }
    
    public void setLedger(BPLedger ledger) {
        this.ledger = ledger;
    }
    
    public boolean isExpired() {
        return expired;
    }
    
    public void setExpired(boolean expired) {
        this.expired = expired;
    }
    
    public Date getDeadline() {
        return deadline;
    }
    
    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }
    
    public double getSurcharge() {
        return surcharge;
    }
    
    public void setSurcharge(double surcharge) {
        this.surcharge = surcharge;
    }
    
    public double getInterest() {
        return interest;
    }
    
    public void setInterest(double interest) {
        this.interest = interest;
    }
    
    public double getDiscount() {
        return discount;
    }
    
    public void setDiscount(double discount) {
        this.discount = discount;
    }
    
    public double getTotal() {
        return total;
    }
    
    public void setTotal(double total) {
        this.total = total;
    }
    
    public Object getAccount() {
        return account;
    }
    
    public void setAccount(Object account) {
        this.account = account;
    }
    
    public int getYear() {
        return year;
    }
    
    public void setYear(int year) {
        this.year = year;
    }
    
    public int getQtr() {
        return qtr;
    }
    
    public void setQtr(int qtr) {
        this.qtr = qtr;
    }
    
    public int getPaypriority() {
        return paypriority;
    }
    
    public void setPaypriority(int paypriority) {
        this.paypriority = paypriority;
    }
    
    public double getBalance() {
        return balance;
    }
    
    public void setBalance(double balance) {
        this.balance = balance;
    }
    
    public String getReceivableid() {
        return receivableid;
    }
    
    public void setReceivableid(String receivableid) {
        this.receivableid = receivableid;
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

    public BPApplication getApplication() {
        return application;
    }

    public void setApplication(BPApplication application) {
        this.application = application;
    }

    public Object getSurchargeaccount() {
        return surchargeaccount;
    }

    public void setSurchargeaccount(Object surchargeaccount) {
        this.surchargeaccount = surchargeaccount;
    }

    public Object getInterestaccount() {
        return interestaccount;
    }

    public void setInterestaccount(Object interestaccount) {
        this.interestaccount = interestaccount;
    }
    
}
