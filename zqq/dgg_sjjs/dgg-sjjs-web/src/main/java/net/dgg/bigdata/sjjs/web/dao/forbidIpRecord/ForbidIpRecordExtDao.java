package net.dgg.bigdata.sjjs.web.dao.forbidIpRecord;

import net.dgg.bigdata.sjjs.web.entity.ForbidIpRecord;

import java.util.List;
import java.util.Map;

/**
 * @author 刘阳
 * @ClassName <ForbidIpRecordExtDao>
 * @despriction
 * @create 2018/10/21 15:23
 **/
public interface ForbidIpRecordExtDao {
    List<ForbidIpRecord> query(Map map);

    List<Map> queryMap(Map map);

    Integer count(Map map);
}
