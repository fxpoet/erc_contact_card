contract ContactCardInferface {
    
    struct basicContact {
        string name;
        string surname;
        string country;
        string company;
        string title;
        string email;
        string mobile;
    }
    
    enum Status { DISABLE, ENABLE, REDIRECT }

    string  public version = "ERC1xxx"; // schema version
    string  public encrypted;           // empty or "AES"    
    uint8   public status;              // 0 disable, 1 enable, 2 redirect
    string  public redirect;            // redirect address or URL
    uint256 public modified;            // last modified time

    string  public template;            // web page url for display 
    string  public imageURL;            // image url for display
    
    basicContact public contact;
    string public extKeys;              // extention keys, 
                                        // ex. "facebook,telegram"

    event Modified(string keyField, uint256 modified);

    function getValue(string key) public view returns (string);
}

