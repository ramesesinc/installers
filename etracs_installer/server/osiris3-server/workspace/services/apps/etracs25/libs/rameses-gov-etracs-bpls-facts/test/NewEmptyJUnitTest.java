import bpls.facts.QtrDeadline;
import junit.framework.*;
/*
 * NewEmptyJUnitTest.java
 * JUnit based test
 *
 * Created on December 6, 2013, 9:07 PM
 */

/**
 *
 * @author Elmo
 */
public class NewEmptyJUnitTest extends TestCase {
    
    public NewEmptyJUnitTest(String testName) {
        super(testName);
    }

    protected void setUp() throws Exception {
    }

    protected void tearDown() throws Exception {
    }
    
    // TODO add test methods here. The name must begin with 'test'. For example:
    public void testHello() throws Exception {
        QtrDeadline d = new QtrDeadline();
        d.setYear(2013);
        d.setMonth(10);
        System.out.println(d.getBeginQtrDate());
    }

}
