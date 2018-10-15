package com.zzj.course.model;

import java.util.Date;

public class Inform {
    private int infid;
    private String inftitle;
    private String infcontext;
    private String inftime;
    private int infstates;
    private int infposition;
    private String infimg;

    public String getInfimg() {
        return infimg;
    }

    public void setInfimg(String infimg) {
        this.infimg = infimg;
    }

    public int getInfposition() {
        return infposition;
    }

    public void setInfposition(int infposition) {
        this.infposition = infposition;
    }

    public int getInfid() {
        return infid;
    }

    public void setInfid(int infid) {
        this.infid = infid;
    }

    public String getInftitle() {
        return inftitle;
    }

    public void setInftitle(String inftitle) {
        this.inftitle = inftitle;
    }

    public String getInfcontext() {
        return infcontext;
    }

    public void setInfcontext(String infcontext) {
        this.infcontext = infcontext;
    }

    public String getInftime() {
        return inftime;
    }

    public void setInftime(String inftime) {
        this.inftime = inftime;
    }

    public int getInfstates() {
        return infstates;
    }

    public void setInfstates(int infstates) {
        this.infstates = infstates;
    }
}
