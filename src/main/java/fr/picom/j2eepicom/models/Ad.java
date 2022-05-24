package fr.picom.j2eepicom.models;

import fr.picom.j2eepicom.models.db.TableName;
import static fr.picom.j2eepicom.utils.RoundNumber.roundDouble;
import java.time.LocalDate;
import java.util.List;

public class Ad extends AbstractEntity{

    private Long id;

    private String title;

    private String image;

    private String text;

    private LocalDate createdAt;

    private LocalDate startDate;

    private Integer numDaysOfDiffusion;

    private User user;

    private List<Area> areaList;

    public Ad(Long id, String title, String image, String text, LocalDate createdAt, LocalDate startDate, Integer numDaysOfDiffusion, User user,
              List<Area> areaList) {
        super(TableName.AD);
        this.id = id;
        this.title = title;
        this.image = image;
        this.text = text;
        this.createdAt = createdAt;
        this.startDate = startDate;
        this.numDaysOfDiffusion = numDaysOfDiffusion;
        this.user = user;
        this.areaList = areaList;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return startDate.plusDays(numDaysOfDiffusion);
    }

    public Integer getNumDaysOfDiffusion() {
        return numDaysOfDiffusion;
    }

    public void setNumDaysOfDiffusion(Integer numDaysOfDiffusion) {
        this.numDaysOfDiffusion = numDaysOfDiffusion;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Area> getAreaList() {
        return areaList;
    }

    public void setAreaList(List<Area> areaList) {
        this.areaList = areaList;
    }

    public String getTotalPriceOfAdForOneDay(){
        double stockValue = 0D;
        for (Area area : areaList){
            stockValue += Double.parseDouble(area.getTotalPriceOfAllTimeIntervalSelected());
        }
        return roundDouble(stockValue);
    }

    public String getTotalPriceForAllDay(){
        double stock = Double.parseDouble(getTotalPriceOfAdForOneDay()) * numDaysOfDiffusion;
        return roundDouble(stock);
    }
}
