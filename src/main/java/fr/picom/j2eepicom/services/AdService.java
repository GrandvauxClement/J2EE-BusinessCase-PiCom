package fr.picom.j2eepicom.services;

import fr.picom.j2eepicom.dao.AdDAO;
import fr.picom.j2eepicom.models.Ad;
import fr.picom.j2eepicom.models.Area;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AdService {

    private AdDAO adDAO;

    public AdService() {
        this.adDAO = new AdDAO();
    }

    public Ad create(String title,String image, String text, LocalDate startDate, int numDaysOfDiffusion, Long userId,
                     List<Area> areaList) {
        try {
           return this.adDAO.createAd(title, image,text, startDate, numDaysOfDiffusion, userId, areaList);
        } catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }

    public List<Ad> findAll(){
        try {
            return this.adDAO.findAll();
        } catch (SQLException e){
            return null;
        }
    }

    public Ad findById(Long id){
        try {
            return this.adDAO.findById(id);
        } catch (SQLException e){
            return null;
        }
    }

    public List<Ad> findAllAdOfOneUser(Long idUser, String orderField, String orderMethod){
        try {
            return this.adDAO.findAllAdOfOneUser(idUser, orderField, orderMethod);
        }catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }

    public List<Ad> getListAdByActiveOrIncative(List<Ad> adList, boolean isActive){
        List<Ad> adListActive = new ArrayList<>();
        LocalDate dateNow = LocalDate.now();
        for (Ad ad : adList){
            if (ad.getStartDate().compareTo(dateNow) <= 0 && ad.getEndDate().compareTo(dateNow) > 0){
                if (isActive){
                    adListActive.add(ad);
                }
            } else if(!isActive){
                adListActive.add(ad);
            }
        }
        return adListActive;
    }


}
