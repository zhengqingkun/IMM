package team.ruike.imm.dao;
import team.ruike.imm.entity.Client;
import team.ruike.imm.entity.User;

import java.util.List;
/**
 * @author 索志文
 * @version 1.0
 */
public interface ClientDao {
    /**
     * 指定条件查询客户信息
     * @param client 客户信息
     * @return
     */
    public List<Client> selecrClient(Client client);
    /**
     * 分页
     * @return
     */
    public List<Client> pagerClient(Client client);
    /**
     * 指定条件修改客户信息
     * @param client
     * @return
     */
    public int updateClient(Client client);

    /**
     * 添加客户信息
     * @param client
     * @return
     */
    public int insertClient(Client client);


    public int noncooperation(List client);
    public int cooperative(List client);
}
