// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.piirivalve.entities;

import ee.piirivalve.entities.Vaeosa;
import java.lang.String;
import java.util.Date;

privileged aspect Piiripunkti_alluvus_Roo_JavaBean {
    
    public String Piiripunkti_alluvus.getKommentaar() {
        return this.kommentaar;
    }
    
    public void Piiripunkti_alluvus.setKommentaar(String kommentaar) {
        this.kommentaar = kommentaar;
    }
    
    public Date Piiripunkti_alluvus.getAlates() {
        return this.alates;
    }
    
    public void Piiripunkti_alluvus.setAlates(Date alates) {
        this.alates = alates;
    }
    
    public Date Piiripunkti_alluvus.getKuni() {
        return this.kuni;
    }
    
    public void Piiripunkti_alluvus.setKuni(Date kuni) {
        this.kuni = kuni;
    }
    
    public void Piiripunkti_alluvus.setVaeosa(Vaeosa vaeosa) {
        this.vaeosa = vaeosa;
    }
    
}
