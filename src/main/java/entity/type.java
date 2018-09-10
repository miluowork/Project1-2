package entity;

public class type {
int id;
int parentid;
String name;
String parentName;
public type() {
	super();
}
public type(int id, int parentid, String name) {
	super();
	this.id = id;
	this.parentid = parentid;
	this.name = name;
}

public String getParentName() {
	return parentName;
}
public void setParentName(String parentName) {
	this.parentName = parentName;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getParentid() {
	return parentid;
}
public void setParentid(int parentid) {
	this.parentid = parentid;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}


}
