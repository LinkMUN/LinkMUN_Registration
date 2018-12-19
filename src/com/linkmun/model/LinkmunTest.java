package com.linkmun.model;

import java.io.Serializable;

/**
 * linkmun_test
 * @author 
 */
public class LinkmunTest implements Serializable {
    private Integer testid;

    private String conference;

    private String content;

    private static final long serialVersionUID = 1L;

    public Integer getTestid() {
        return testid;
    }

    public void setTestid(Integer testid) {
        this.testid = testid;
    }

    public String getConference() {
        return conference;
    }

    public void setConference(String conference) {
        this.conference = conference;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        LinkmunTest other = (LinkmunTest) that;
        return (this.getTestid() == null ? other.getTestid() == null : this.getTestid().equals(other.getTestid()))
            && (this.getConference() == null ? other.getConference() == null : this.getConference().equals(other.getConference()))
            && (this.getContent() == null ? other.getContent() == null : this.getContent().equals(other.getContent()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getTestid() == null) ? 0 : getTestid().hashCode());
        result = prime * result + ((getConference() == null) ? 0 : getConference().hashCode());
        result = prime * result + ((getContent() == null) ? 0 : getContent().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", testid=").append(testid);
        sb.append(", conference=").append(conference);
        sb.append(", content=").append(content);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}