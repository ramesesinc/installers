package bpls.facts;

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
