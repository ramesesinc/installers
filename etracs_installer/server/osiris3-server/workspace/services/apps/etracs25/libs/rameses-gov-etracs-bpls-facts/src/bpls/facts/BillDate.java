/*
 * BillDate.java
 *
 * Created on December 6, 2013, 6:11 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package bpls.facts;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Elmo
 */
public class BillDate {
    
    private Date date;
    private int qtr;
    private int month;
    private int year;
    private int day;
    private Date monthEnd = null;
    private Date validUntil;
    
  
    
    public BillDate(Date d) {
        this.date = d;
        //we need to remove the time component
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String s = df.format( this.date );
            this.date = df.parse( s );
        }
        catch(Exception ign){;}
        
        Calendar cal = Calendar.getInstance();
	cal.setTime( d );
        this.month = cal.get( Calendar.MONTH ) + 1;
	this.day = cal.get( Calendar.DATE );
	this.year = cal.get( Calendar.YEAR );
	if( month >= 1 && month <= 3 ) this.qtr = 1;
        else if( month >= 4 && month <= 6 ) this.qtr = 2;
        else if( month >= 7 && month <= 9 ) this.qtr = 3;
        else this.qtr = 4;
        int ds = cal.getActualMaximum( Calendar.DAY_OF_MONTH );
        cal.set( Calendar.DAY_OF_MONTH, ds );
        monthEnd = cal.getTime();
        
        validUntil = monthEnd;
    }
    
    public Date getDate() {
        return date;
    }
    
    public int getQtr() {
        return qtr;
    }
    
    public int getMonth() {
        return month;
    }
    
    public int getYear() {
        return year;
    }
    
    public int getDay() {
        return day;
    }
    
    public void setDay(int day) {
        this.day = day;
    }
    
    
    public Date getMonthEnd() {
        return monthEnd;
    }

    public Date getValidUntil() {
        return validUntil;
    }

    public void setValidUntil(Date validUntil) {
        this.validUntil = validUntil;
    }
    
}
