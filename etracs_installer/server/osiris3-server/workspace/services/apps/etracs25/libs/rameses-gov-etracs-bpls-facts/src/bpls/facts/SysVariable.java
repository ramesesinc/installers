/*
 * SysVariable.java
 *
 * Created on December 1, 2013, 6;01 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package bpls.facts;

/**
 *
 * @author Elmo
 */
public class SysVariable {
    
    private String objid;
    private LOB lob;
    private String name;
    private String stringvalue;
    private int intvalue;
    private boolean booleanvalue;
    private double decimalvalue;
    
    /** Creates a new instance of SysVariable */
    public SysVariable() {
    }
    
    public SysVariable(String datatype, Object value) {
        if(value == null) return;
        datatype = datatype.toLowerCase();
        if( datatype.equals("decimal") ) {
            setDecimalvalue( Double.parseDouble(value+"") );
        } else if(datatype.equals("integer")) {
            setIntvalue( Integer.parseInt(value+"") );
        } else if( datatype.equals("boolean")) {
            String v = value.toString().toLowerCase().trim();
            if(v.equals("1") || v.equals("true")) {
                v = "true";
            } else {
                v = "false";
            }
            setBooleanvalue( Boolean.parseBoolean(v));
        } else if(datatype.startsWith("string")) {
            setStringvalue( (String)value );
        }
    }
    
    public String getObjid() {
        return objid;
    }
    
    public void setObjid(String objid) {
        this.objid = objid;
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
    
    public String getStringvalue() {
        return stringvalue;
    }
    
    public void setStringvalue(String stringvalue) {
        this.stringvalue = stringvalue;
    }
    
    public int getIntvalue() {
        return intvalue;
    }
    
    public void setIntvalue(int intvalue) {
        this.intvalue = intvalue;
    }
    
    public boolean isBooleanvalue() {
        return booleanvalue;
    }
    
    public void setBooleanvalue(boolean booleanvalue) {
        this.booleanvalue = booleanvalue;
    }
    
    public double getDecimalvalue() {
        return decimalvalue;
    }
    
    public void setDecimalvalue(double decimalvalue) {
        this.decimalvalue = decimalvalue;
    }
    
}
