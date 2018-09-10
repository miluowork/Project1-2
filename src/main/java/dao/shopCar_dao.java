package dao;

import java.util.List;
import org.apache.ibatis.annotations.Select;
import entity.carDetail;

public interface shopCar_dao {
	
	@Select("select b.*,a.count count,c.email email from shopcar a INNER JOIN product b ON a.product_id=b.id INNER JOIN `user` c ON c.id=a.user_id;")
	public List<carDetail> select();

}
