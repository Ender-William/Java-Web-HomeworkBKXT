package cn.tjzhic.dao;

import cn.tjzhic.entity.Site;

import java.util.Map;

public interface SiteDao {

    // 根据id查找站点信息
    public Site findById(long id);

    // 根据id更新站点信息
    public int updateById(long id, Map<String, Object> entityFieldMap);

}
