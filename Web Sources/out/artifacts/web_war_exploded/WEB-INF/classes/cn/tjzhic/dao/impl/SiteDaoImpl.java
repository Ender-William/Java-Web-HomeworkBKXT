package cn.tjzhic.dao.impl;

import cn.tjzhic.dao.SiteDao;
import cn.tjzhic.entity.Site;
import cn.tjzhic.util.DBUtil;

import java.util.Map;

public class SiteDaoImpl implements SiteDao {

    @Override
    public Site findById(long id) {
        return DBUtil.queryOne(Site.class, "select * from site where id=?", id);
    }

    @Override
    public int updateById(long id, Map<String, Object> entityFieldMap) {
        return DBUtil.updateEntity(Site.class, id, entityFieldMap);
    }

}