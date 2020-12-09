package com.spring.biz.user;

import java.util.List;

import com.bit.bookstore.vo.UserVO;

public interface UserService {
	int ID_Check(String id);
	int UserSingup(UserVO vo);
	int Login(UserVO vo);
	int LoginUpdate(String id);
	int getCartIdxCnt (String user_id);
	UserVO getUser (String id);
	List<String> findId(UserVO vo);
	int findPwd(UserVO vo);
	int updatePwd(UserVO vo);
	UserVO getUserInfo(String id);
	int userUpdate(UserVO vo);
	int userLeave(String id);
}
