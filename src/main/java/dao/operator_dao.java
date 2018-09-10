package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.operator;
import entity.psOperator;
import util.SearchInfo;

public interface operator_dao {        
	@Select("select * from operator ${where} ${limit}")
	public List<operator> select(SearchInfo info);
	
	@Select("select count(id) count from operator ${where} ${limit}")
	public List<operator> page(SearchInfo info);

	@Delete("delete from operator where id =#{id}")
	public void delete(int id);

	@Delete("delete from operator where id in (${ids})")
	public void allDelete(SearchInfo info);

	@Insert("insert into operator (nike,name,sex,tel,power,status,comments)"
			+ " values(#{nike},#{name},#{sex},#{tel},#{power},#{status},#{comments})")
	public void insert(operator op);

	@Update("update operator set nike=#{nike},name=#{name},sex=#{sex},"
			+ "tel=#{tel},power=#{power},status=#{status},comments=#{comments} where id=#{id}")
	public void update(operator op);
	
	@Update("update operator set password=#{password} where id=#{id}")
	public void pwdChange(@Param("password") String password,@Param("id")int id);
	
	@Update("update operator set password='123' where id=#{id}")
	public void reset(int id);
	
	@Update("update operator set nike=#{nike},sex=#{sex},"
			+ "tel=#{tel},comments=#{comments} where id=#{id}")
	public void psChange(psOperator po);
	
	
	
	@Update("update operator set status=#{status} where id=#{id}")
	public void status(@Param("status") int status,@Param("id")int id);

	@Select("select *  from operator where id=#{id}")
	public operator edit(int id);
	
	@Select("select * from operator where nike=#{nike}")
	public operator login(String nike);
	
	
	
	
}
