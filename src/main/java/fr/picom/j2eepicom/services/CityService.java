package fr.picom.j2eepicom.services;

import fr.picom.j2eepicom.dao.CityDAO;
import fr.picom.j2eepicom.models.City;
import fr.picom.j2eepicom.models.Country;

import java.sql.SQLException;
import java.util.List;

public class CityService {


    private CityDAO cityDAO;

    public CityService() {
        this.cityDAO = new CityDAO();
    }

    public List<City> findAll() {
        try {
            return this.cityDAO.findAll();
        } catch (SQLException e){
            return null;
        }
    }

    public City findById(Long id){
        try{
            return this.cityDAO.findById(id);
        } catch (SQLException e) {
            return null;
        }
    }

    public City findByName(String name){
        try{
            return this.cityDAO.findByName(name);
        } catch (SQLException e) {
            return null;
        }
    }

    public boolean deleteById(Long id){
        try {
            return this.cityDAO.deleteById(id);
        }catch (SQLException e){
            return false;
        }
    }

    public City create(String name, Country country){
        try {
            return this.cityDAO.create(name, country);
        } catch (SQLException e){
            return null;
        }
    }
}
