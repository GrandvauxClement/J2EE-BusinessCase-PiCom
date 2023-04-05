package fr.picom.j2eepicom.models;

import fr.picom.j2eepicom.models.db.TableName;

public abstract class AbstractEntity {

    protected TableName tableName;

    public AbstractEntity(TableName tableName) {
        this.tableName = tableName;
    }
    public TableName getTableName() {
        return tableName;
    }
}
