pragma solidity ^0.4.24;

contract ContactCard {
    
    enum Status { DISABLE, ENABLE, REDIRECT }

    address public owner; // admin
 
    string public encrypted = "AES";
    string public version = "ERC1xxx";
	Status  public status;
    string  public redirect;
    uint256 public modified;
        
    string public template;
    string public imageURL;
        
    struct basicContact {
        string name;
        string surname;
        string country;
        string company;
        string title;
        string email;
        string mobile;
    }
    
    basicContact public contact;    
    string public extKeys;

    mapping (string => string) values;
    mapping (string => bool) existExtKey;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Permission Denied. Owner Only");
        _;
    }
    
    event Modified(string keyField, uint256 modified);
    //----------------------------------------------------
    
    constructor() public {
        
        contact = basicContact(
            "Kiyoung","Jung", 
            "ko",
            "Kimchi Powered", "Developer", 
            "im@fxpoet.com", "010-2030-xxxx"
        );

        status   = Status.ENABLE;
        owner    = msg.sender;        
        modified = block.timestamp;
    }
    
    function concat(string a, string b) internal pure returns (string) {
        return string(abi.encodePacked(a, ",", b));
    }
    
    function equals(string v1, string v2) internal pure returns (bool) {
        return(keccak256(abi.encodePacked(v1)) == keccak256(abi.encodePacked(v2)));
    }
    
    function setValue(string key, string value) onlyOwner public {
        
        if (equals(key, "name"))    { contact.name = value; } else 
        if (equals(key, "surname")) { contact.surname = value; } else 
        if (equals(key, "country")) { contact.country = value; } else 
        if (equals(key, "company")) { contact.company = value; } else 
        if (equals(key, "title"))   { contact.title = value; } else 
        if (equals(key, "email")) { contact.email = value; } else 
        if (equals(key, "mobile")) { contact.mobile = value; } else 
        if (equals(key, "template")) { template = value; } else 
        if (equals(key, "redirect")) { redirect = value; } else
        if (equals(key, "imageURL")) { imageURL = value; } 
        else {
            if (!existExtKey[key]) {
                if (bytes(extKeys).length == 0)
                    extKeys = key;
                else
                    extKeys = concat(extKeys, key);
                existExtKey[key] = true;
            }
            values[key] = value;
        }
        modified = block.timestamp;
        emit Modified(key, modified);
    }
    
    function getValue(string key) public view returns (string) {
        return values[key];
    }
    
    function setStatus(uint8 statusCode) public {
        status = Status(statusCode);
        modified = block.timestamp;
        emit Modified("status", modified);
    }
    
    function () external payable {
        // Any action you want.
    }
}

