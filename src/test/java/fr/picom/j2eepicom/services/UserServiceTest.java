package fr.picom.j2eepicom.services;

import fr.picom.j2eepicom.exceptions.DbUniqueFieldThisValueExist;
import fr.picom.j2eepicom.models.City;
import fr.picom.j2eepicom.models.User;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.hamcrest.CoreMatchers.*;
import static org.hamcrest.MatcherAssert.assertThat;

public class UserServiceTest {

    private UserService userService;
    private CityService cityService;

    @BeforeEach
    public void prepareTest() throws DbUniqueFieldThisValueExist {
        this.userService = new UserService();
        this.cityService = new CityService();
        this.userService.register("Grandvaux", "Clément", "clement.grandvaux@hotmail.com",
                "Admin123", "6 29 16 89 43","25487563256632", "Tesla",
                "14 boulevard Gambetta", "39000", "Lons-le-saunier", "France");
    }

    @AfterEach
    public void afterEach(){
        User userToDelete = this.userService.findByField("email", "clement.grandvaux@hotmail.com");
        if (userToDelete != null){
            this.userService.deleteById(userToDelete.getId());
        }

    }

    @Test
    @DisplayName("Test register work")
    public void testRegisterWork() throws DbUniqueFieldThisValueExist {
        List<User> users = userService.findAll();
        int nbUsers = users.size();

        User userCreate = this.userService.register("Dupond", "Antoine", "6nation@grandchelem.com",
                "BestPlayer9", "384253729","25487659846632", "Stade Toulousain",
                "9 rue de la gagne", "27000", "Toulouse", "France");

        users = userService.findAll();
        City city = cityService.findByName("Toulouse");
        assertThat(users, is(notNullValue()));
        //Check if he has user role
        Assertions.assertEquals("User", userCreate.getRole().getName());
        assertThat(nbUsers + 1, is(equalTo(users.size())));
        Assertions.assertEquals(users.get(users.size()-1).getEmail(),userCreate.getEmail());
    }

    @Test
    @DisplayName("Test register with email already exist")
   void testRegisterWithEmailAlreadyExist() throws DbUniqueFieldThisValueExist {

        Assertions.assertThrows(DbUniqueFieldThisValueExist.class, () -> {
            this.userService.register("Grandvaux", "Clément", "clement.grandvaux@hotmail.com",
                    "Admin123", "6 29 16 89 43","25487563255532", "Tesla",
                    "14 boulevard Gambetta", "39000", "Lons-le-saunier", "France");
        });
    }

    @Test
    @DisplayName("Test register with num siret already exist")
    void testRegisterWithNumSiretAlreadyExist() throws DbUniqueFieldThisValueExist {

        Assertions.assertThrows(DbUniqueFieldThisValueExist.class, () -> {
            this.userService.register("Grandvaux", "Clément", "clem.grandvaux@hotmail.com",
                    "Admin123", "6 29 16 89 43","25487563256632", "Tesla",
                    "14 boulevard Gambetta", "39000", "Lons-le-saunier", "France");
        });
    }

    @Test
    @DisplayName("Test find all user")
    public void testFindAll() {
        List<User> userList = userService.findAll();
        Assertions.assertEquals(3, userList.size());
        Assertions.assertEquals("Grandvaux", userList.get(userList.size()-1).getLastName());
        Assertions.assertEquals("Lons-le-saunier", userList.get(userList.size()-1).getCity().getName());
    }

    @Test
    @DisplayName("Test find user by his id")
    public void testFindById(){
        List<User> userList = userService.findAll();
        Long testid = userList.get(1).getId();
        User user = userService.findById(userList.get(userList.size()-1).getId());
        Assertions.assertEquals("Grandvaux", user.getLastName());
    }

    @Test
    @DisplayName("Test delete user work")
    public void testDeleteUser(){
        List<User> userList = userService.findAll();

        boolean response = userService.deleteById(userList.get(userList.size()-1).getId());
        Assertions.assertTrue(response);
    }

    @Test
    @DisplayName("Test delete user with inexist id")
    public void testDeleteUserWithInexistId(){

        boolean response = userService.deleteById(30L);
        Assertions.assertFalse(response);
    }

    @Test
    @DisplayName("Test login work")
    public void testLoginWork(){
        User user = userService.login("clement.grandvaux@hotmail.com", "Admin123");
        Assertions.assertEquals("Grandvaux", user.getLastName());
        Assertions.assertEquals("Clément", user.getFirstName());
    }

    @Test
    @DisplayName("Test login not work")
    public void testLoginDoesntWork() {
        User user = userService.login("test@dontwork.fr", "Password123");
        Assertions.assertNull(user);
    }

}
