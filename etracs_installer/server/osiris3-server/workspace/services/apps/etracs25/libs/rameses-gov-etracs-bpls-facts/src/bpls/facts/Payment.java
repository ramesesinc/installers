/*
 * Payment.java
 *
 * Created on December 6, 2013, 6:13 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package bpls.facts;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 *
 * @author Elmo
 */
public class Payment {
    
    private double amtpaid;
    private double balance;
    
    /** Creates a new instance of Payment */
    public Payment(double amtpaid) {
        amtpaid = amtpaid;
        balance = amtpaid;
    }

    public double getAmtpaid() {
        return amtpaid;
    }

    public void setAmtpaid(double amtpaid) {
        this.amtpaid = amtpaid;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        DecimalFormat format = new DecimalFormat("0.00");
        String s = format.format(balance); 
        this.balance = (new BigDecimal(s)).doubleValue();
    }
    
}
