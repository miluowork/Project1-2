package dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import entity.orderDetail;
import entity.orders;

public interface orderDeatail_dao {
	@Select("select c.*,b.code code ,a.count count,a.nowprice nowprice,a.price price"
			+ " from orders_details a "
			+ "INNER JOIN orders b on a.orders_id=b.id "
			+ "INNER JOIN product c on a.product_id=c.id "
			+ "where b.id=#{id};")
	public List<orderDetail> orderDetail(int id);
}
