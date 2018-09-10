package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import entity.product;
import util.SearchInfo;

public interface product_dao {        
	@Select("select a.*,b.`name` typename from product a inner JOIN  type b on a.type_id=b.id ${where} ${limit}")
	public List<product> select(SearchInfo info);
	
	@Select("select count(id) count from product a inner JOIN  type b on a.type_id=b.id ${where} ${limit}")
	public List<product> page(SearchInfo info);

	@Delete("delete from product where id =#{id}")
	public void delete(int id);

	@Delete("delete from product where id in (${ids})")
	public void allDelete(SearchInfo info);

	@Insert("insert into product (fullname,type_id,activity,tip,sale,info,price,nowprice,collectcount,priority,status,pics,comments)"
			+ " values(#{fullname},#{type_id},#{activity},#{tip},#{sale},#{info},#{price},#{nowprice},#{collectcount},#{priority},#{status},#{pics},#{comments})")
	public void insert(product op);

	@Update("update product set fullname=#{fullname},type_id=#{type_id},activity=#{activity},tip=#{tip},"
			+ "sale=#{sale},info=#{info},price=#{price},nowprice=#{nowprice},collectcount=#{collectcount},priority=#{priority},status=#{status},pics=#{pics},comments=#{comments} where id=#{id}")
	public void update(product op);
	
	@Update("update product set status=#{status} where id=#{id}")
	public void status(@Param("status") int status,@Param("id")int id);

	@Select("select a.*,b.`name` typename from product a inner JOIN  type b on a.type_id=b.id where a.id=#{id}")
	public product edit(int id);
}
