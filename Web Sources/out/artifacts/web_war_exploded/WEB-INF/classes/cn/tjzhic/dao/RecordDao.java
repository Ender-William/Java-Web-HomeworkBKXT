package cn.tjzhic.dao;

import cn.tjzhic.entity.Record;
import cn.tjzhic.entity.Reginfo;
import cn.tjzhic.entity.SupGrade;
import cn.tjzhic.util.PageModel;

public interface RecordDao {
    public int add(Record record);

    public PageModel<Record> pageByLogname(String logname, String usergroup, int pageSize, int pageNo);

    public PageModel<SupGrade> pageByLogname(int pageSize, int pageNo);

    public PageModel<Reginfo> pageReginfo(int pageSize, int pageNo);

    public PageModel<Reginfo> pageReginfo(String mname, String isconfirm, int pageSize, int pageNo);

    public int total(String sql);
}
