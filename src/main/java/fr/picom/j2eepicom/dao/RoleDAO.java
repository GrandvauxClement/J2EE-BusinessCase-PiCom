package fr.picom.j2eepicom.dao;

import fr.picom.j2eepicom.models.Role;
import fr.picom.j2eepicom.models.db.TableName;

public class RoleDAO extends AbstractGenericDAO<Role>{

    public RoleDAO() {
        super(TableName.ROLES);
    }
}
