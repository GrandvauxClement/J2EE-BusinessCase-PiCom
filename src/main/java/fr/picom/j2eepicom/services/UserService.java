package fr.picom.j2eepicom.services;

import fr.picom.j2eepicom.dao.CityDAO;
import fr.picom.j2eepicom.dao.CountryDAO;
import fr.picom.j2eepicom.dao.RoleDAO;
import fr.picom.j2eepicom.dao.UserDAO;
import fr.picom.j2eepicom.exceptions.DbUniqueFieldThisValueExist;
import fr.picom.j2eepicom.models.*;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserService {

    private UserDAO userDAO;

    private CityDAO cityDAO;
    private CountryDAO countryDAO;
    private RoleDAO roleDAO;


    public UserService() {
        this.userDAO = new UserDAO();
        this.cityDAO = new CityDAO();
        this.countryDAO = new CountryDAO();
        this.roleDAO = new RoleDAO();
    }

    public List<User> findAll() {
        try {
            return this.userDAO.findAll();
        } catch (SQLException e){
            return null;
        }
    }

    public User register(String lastName, String firstName, String email, String password, String phoneNumber, String numSiret,
                       String companyName, String roadName, String postalCode, String cityName, String countryName) throws DbUniqueFieldThisValueExist {
        try {
            //Check if email already use
            if (userDAO.checkIfFieldExist("email", email)){
                throw new DbUniqueFieldThisValueExist("email");
            }
            //Check if num siret already use
            if (userDAO.checkIfFieldExist("num_siret", numSiret)){
                throw new DbUniqueFieldThisValueExist("num siret");
            }
            //Check if country exist in db and create if he doesn't
            Country checkCountryExist = countryDAO.findByName(countryName);
            if (checkCountryExist == null){
                checkCountryExist = countryDAO.create(countryName, "+52");
            }
            //Check if city exist in db and create if he doesn't
            City checkCityExist = cityDAO.findByName(cityName);
            if (checkCityExist == null){
                checkCityExist = cityDAO.create(cityName, checkCountryExist);
            }
            //By default all new User have role user
            Role role = roleDAO.findByName("User");

            password = BCrypt.hashpw(password, BCrypt.gensalt());

            return this.userDAO.create(lastName, firstName, email, password, phoneNumber, numSiret, companyName,
                    roadName, postalCode, checkCityExist, role);
        } catch (SQLException e){
            e.printStackTrace();
            return null;
        }

    }

    public User login(String email, String password) {
        try {
            User user = this.userDAO.findByField("email", email);
            if (user != null && BCrypt.checkpw(password, user.getPassword())){
                return user;

            }else {
                return null;
            }

        } catch (SQLException e){
            return null;
        }
    }

    public User findById(Long id){
        try{
            return this.userDAO.findById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    //TODO update this feature, not completely delete user, just set isActive at false
    public boolean deleteById(Long id){
        try {
            return this.userDAO.deleteById(id);
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

    public User findByField(String field, String value){
        try {
            return this.userDAO.findByField(field, value);
        }catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }

    public Integer update(Long id, String lastName, String firstName, String phoneNumber,
                       String companyName, String postalCode, String roadName, String cityName, String countryName) throws DbUniqueFieldThisValueExist{
        try{
            //Check if country exist in db and create if he doesn't
            Country checkCountryExist = countryDAO.findByName(countryName);
            if (checkCountryExist == null){
                checkCountryExist = countryDAO.create(countryName, "+52");
            }
            //Check if city exist in db and create if he doesn't
            City checkCityExist = cityDAO.findByName(cityName);
            if (checkCityExist == null){
                checkCityExist = cityDAO.create(cityName, checkCountryExist);
            }
        return this.userDAO.update(id, lastName, firstName, phoneNumber, companyName,
                postalCode, roadName, checkCityExist);

    } catch (SQLException e){
        e.printStackTrace();
        return null;
    }
    }
}
