@isTest
public class TestDataFactory {
  /* Generates a specific number of Accounts designed to be paired with
   * Job__c and Experience__c objects.
   * @param numAccounts the number of Accounts to generate
   * @return a list of Accounts
   */
  public static List<Account> createJobAccounts(Integer numAccounts) {
    List<Account> accts = new List<Account>();
    for (Integer i = 0; i < numAccounts; i++) {
      Account a = new Account(
        Name = generateName(10),
        Phone = generatePhoneNumber(),
        Site = generateWebsite()
      );
      accts.add(a);
    }

    insert accts;
    return accts;
  }

  /* Generates a string with an upper case letter at the beginning
   * and the rest of the string with a lower case letter
   * @param nameLength the length of the name to be generated
   * @return a string of the generated name
   */
  public static String generateName(Integer nameLength) {
    //we want to generate names with only one uppercase character
    final String ucChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    //lowercase characters for the rest of teh name
    final String chars = 'abcdefghijklmnopqrstuvwxyz';

    //start the name with an uppercase character
    String randStr = '' + ucChars.charAt(getRandomNumber(0, ucChars.length()));

    //create the rest of the name by running through the lowercase characters
    while (randStr.length() < nameLength - 1) {
      randStr += chars.charAt(getRandomNumber(0, chars.length()));
    }

    //return the created name
    return randStr;
  }

  /*Generates a string that is a legal US phone number
   *@return a string of the generated phone number
   */
  public static String generatePhoneNumber() {
    // Generate a random area code
    Integer areaCode = getRandomNumber(100, 999);

    // Generate a random prefix
    Integer prefix = getRandomNumber(100, 999);

    // Generate a random line number
    Integer lineNumber = getRandomNumber(1000, 9999);

    // Return the phone number as a string
    return (areaCode + '-' + prefix + '-' + lineNumber);
  }

  /*Generates passable URL
   *@return a string of the generated website
   */
  public static String generateWebsite() {
    String website = 'https://' + generateName(10) + '.com';
    return website;
  }

  /* Generates a random number betwewen two specified points
   * @param min the minimum number to be generated
   * @param max the maximum number to be generated
   * @return a random integer between min and max
   */
  public static Integer getRandomNumber(Integer min, Integer max) {
    return Math.round(Math.random() * (max - min) + min);
  }

  /* All methods found below this line were written for
   *the express use of completing salesforce trailheads
   */
  public static List<Account> createAccountsWithOpps(
    Integer numAccts,
    Integer numOppsPerAcct
  ) {
    List<Account> accts = new List<Account>();
    for (Integer i = 0; i < numAccts; i++) {
      Account a = new Account(Name = 'TestAccount' + i);
      accts.add(a);
    }
    insert accts;
    List<Opportunity> opps = new List<Opportunity>();
    for (Integer j = 0; j < numAccts; j++) {
      Account acct = accts[j];
      // For each account just inserted, add opportunities
      for (Integer k = 0; k < numOppsPerAcct; k++) {
        opps.add(
          new Opportunity(
            Name = acct.Name + ' Opportunity ' + k,
            StageName = 'Prospecting',
            CloseDate = System.today().addMonths(1),
            AccountId = acct.Id
          )
        );
      }
    }
    // Insert all opportunities for all accounts.
    insert opps;
    return accts;
  }
}
