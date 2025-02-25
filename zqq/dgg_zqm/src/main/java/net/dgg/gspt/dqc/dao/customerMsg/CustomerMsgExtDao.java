package net.dgg.gspt.dqc.dao.customerMsg;

import net.dgg.gspt.dqc.entity.customerMsg.CustomerMsg;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author
 * @ClassName <CustomerMsgDao>
 * @despriction
 * @create 2018-12-18 16:53:06+
 **/
@Repository
public interface CustomerMsgExtDao {


    List<CustomerMsg> query(Map map);

    List<Map> queryMap(Map map);

    Integer count(Map map);


}