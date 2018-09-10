package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.product;
import entity.type;
import util.SearchInfo;

public interface type_dao {
	@Select("select a.*,b.`name` parentName from type a left join type b on a.parentid=b.id ;")
	public List<type> select();
}
