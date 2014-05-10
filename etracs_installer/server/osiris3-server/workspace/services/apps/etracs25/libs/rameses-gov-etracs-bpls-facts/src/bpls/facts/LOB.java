/*
 * LOB.java
 *
 * Created on December 1, 2013, 5:59 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package bpls.facts;

/**
 *
 * @author Elmo
 */
public class LOB {
    
    private BPApplication application;
    private String objid; 			
    private String lobid;			
    private String name;
    private String classification;
    private String attributes;
    private String assessmenttype;
    
    /** Creates a new instance of LOB */
    public LOB() {
    }

    public String getObjid() {
        return objid;
    }

    public void setObjid(String objid) {
        this.objid = objid;
    }

    public String getLobid() {
        return lobid;
    }

    public void setLobid(String lobid) {
        this.lobid = lobid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getAttributes() {
        return attributes;
    }

    public void setAttributes(String attributes) {
        this.attributes = attributes;
    }

    public String getAssessmenttype() {
        return assessmenttype;
    }

    public void setAssessmenttype(String assessmenttype) {
        this.assessmenttype = assessmenttype;
    }

    public BPApplication getApplication() {
        return application;
    }

    public void setApplication(BPApplication application) {
        this.application = application;
    }
    
}
