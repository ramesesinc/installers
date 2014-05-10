/*
 * PayOption.java
 *
 * Created on December 6, 2013, 6:13 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package bpls.facts;

/**
 *
 * @author Elmo
 */
public class PayOption {
    
    private String type;		
    private int	qtr;		

    /** Creates a new instance of PayOption */
    public PayOption(String type, int qtr) {
        this.type = type;
        this.qtr = qtr;
    }

    public String getType() {
        return type;
    }

    public int getQtr() {
        return qtr;
    }

    
}
