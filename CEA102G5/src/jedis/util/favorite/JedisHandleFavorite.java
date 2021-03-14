package jedis.util.favorite;

import java.util.List;
import java.util.Set;

import com.member.model.MemService;
import com.member.model.MemVO;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisHandleFavorite {
	
	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	
	public static Long saveFavoriteByMemID(Integer memID,String recID) {
		String favKey = new StringBuilder("RecFavorite:memID:").append(memID).toString();
		Jedis jedis = pool.getResource();
		jedis.auth("123456");
		jedis.select(1);
		
		Long count = jedis.sadd(favKey, recID);
		
		jedis.close();
		
		return count;
	}
	
	public static boolean checkFavoriteByMemID(Integer memID,Integer recID) {
		String favKey = new StringBuilder("RecFavorite:memID:").append(memID).toString();
		String recIDStr = String.valueOf(recID);
		Jedis jedis = pool.getResource();
		jedis.auth("123456");
		jedis.select(1);
		
		boolean isAdded = jedis.sismember(favKey, recIDStr);
		jedis.close();
		return isAdded;
	}
	
	public static Long deleteFavoriteByMemID(Integer memID,String rec) {
		String favKey = new StringBuilder("RecFavorite:memID:").append(memID).toString();
		Jedis jedis = pool.getResource();
		jedis.auth("123456");
		jedis.select(1);
		
		Long count = jedis.srem(favKey, rec);
		jedis.close();
		
		return count;
	
	}
	
	public static Set<String> getFavoriteByMemID(Integer memID){
		String favKey = new StringBuilder("RecFavorite:memID:").append(memID).toString();
		Jedis jedis = pool.getResource();
		jedis.auth("123456");
		jedis.select(1);
		
		Set<String> set = jedis.smembers(favKey);
		jedis.close();
		return set;
	}
	
	public String getHowManyFav(Integer recID) {
		MemService memSvc = new MemService();
		List<MemVO> list = memSvc.getAll();
		Integer count = 0;
		for(MemVO memVO : list) {
			if(checkFavoriteByMemID(memVO.getMemID(), recID)) {
				count++;
			}
		}
		return "¦@"+count+"¤H¦¬ÂÃ";
	}
}
