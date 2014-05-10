package bpls.facts;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class Payment {
    
    double amtpaid;
    private double balance;
    
    /** Creates a new instance of Payment */
    public Payment(double amtpaid) {
        amtpaid = amtpaid;
        balance = amtpaid;
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
