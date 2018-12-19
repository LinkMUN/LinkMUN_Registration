package com.linkmun.model;

import java.io.Serializable;

/**
 * @author 
 */
public class LinkmunRodeNode implements Serializable {
    private Integer id;

    private Integer linkmunRoleLivel;

    private Integer linkmunNodeId;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLinkmunRoleLivel() {
        return linkmunRoleLivel;
    }

    public void setLinkmunRoleLivel(Integer linkmunRoleLivel) {
        this.linkmunRoleLivel = linkmunRoleLivel;
    }

    public Integer getLinkmunNodeId() {
        return linkmunNodeId;
    }

    public void setLinkmunNodeId(Integer linkmunNodeId) {
        this.linkmunNodeId = linkmunNodeId;
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
        LinkmunRodeNode other = (LinkmunRodeNode) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getLinkmunRoleLivel() == null ? other.getLinkmunRoleLivel() == null : this.getLinkmunRoleLivel().equals(other.getLinkmunRoleLivel()))
            && (this.getLinkmunNodeId() == null ? other.getLinkmunNodeId() == null : this.getLinkmunNodeId().equals(other.getLinkmunNodeId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getLinkmunRoleLivel() == null) ? 0 : getLinkmunRoleLivel().hashCode());
        result = prime * result + ((getLinkmunNodeId() == null) ? 0 : getLinkmunNodeId().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", linkmunRoleLivel=").append(linkmunRoleLivel);
        sb.append(", linkmunNodeId=").append(linkmunNodeId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}