/*
 * LateRenewal.java
 *
 * Created on December 3, 2013, 2:32 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package bpls.facts;

/**
 *
 * @author Elmo
 */
public class LateRenewal {
    
    private int year;
    
    /** Creates a new instance of LateRenewal */
    public LateRenewal(int y) {
        year = y;
    }

    public LateRenewal() {
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
}
