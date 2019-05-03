public class AccountHandler {
    public static Account insertNewAccount(String accName) {
        
        if (!String.isBlank(accName)) {
            Account acct = new Account(Name = accName);
        	insert acct;
        	return acct;
        }
        return null;
    }

}