package fr.picom.j2eepicom.models;

import fr.picom.j2eepicom.models.db.TableName;

import java.util.List;

public class TimeInterval extends AbstractEntity{

    private Long id;

    private Double timeSlot;

    private Integer nbreAd;

    private Double coefMulti;

    private List<Ad> adList;

    public TimeInterval(Long id, Double timeSlot, Integer nbreAd, Double coefMulti, List<Ad> adList) {
        super(TableName.TIME_INTERVAL);
        this.id = id;
        this.timeSlot = timeSlot;
        this.nbreAd = nbreAd;
        this.coefMulti = coefMulti;
        this.adList = adList;
    }

    public TimeInterval(Long id, Double timeSlot, Double coefMulti) {
        super(TableName.TIME_INTERVAL);
        this.id = id;
        this.timeSlot = timeSlot;
        this.coefMulti = coefMulti;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(Double timeSlot) {
        this.timeSlot = timeSlot;
    }

    public Integer getNbreAd() {
        return nbreAd;
    }

    public void setNbreAd(Integer nbreAd) {
        this.nbreAd = nbreAd;
    }

    public Double getCoefMulti() {
        return coefMulti;
    }

    public void setCoefMulti(Double coefMulti) {
        this.coefMulti = coefMulti;
    }

    public List<Ad> getAdList() {
        return adList;
    }

    public void setAdList(List<Ad> adList) {
        this.adList = adList;
    }
}
