

public class LoginDao {

	public static boolean validate(String id, String pass) {
		String userId = "root";
		String password = "abcd1234";
		
		if(userId.equals(id) && password.equals(pass))
			return true;
		else
			return false;
	}
}
