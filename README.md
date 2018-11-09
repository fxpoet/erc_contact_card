# erc_contact_card
the proposal about contact card specification for ERC

***

eip: <to be assigned>  
title: Contact Card  
author: Kiyoung Jung(@fxpoet)  
discussions-to: <URL>  
status: Draft  
type: Standards Track  
category : ERC  
created: 2018-11-08  

***

## Simple Summary 
A Smart Contract Based Digital Business Card that allows you to modify information after deployment.
This ERC defines a standard interface for reading information in any contact applications or wallets.

## Abstract 
This RPC proposes a specification about standard contact information interface in Ethereum contract.

## Motivation 
When you have networking at a conference, you should exchange lots of businees cards with each other.
After that, you have to  manually input them with finger typing into the contact application.

On the other hand, if the information is already in the blockchain and the interface is already defined,
you can import the information by just scanning the QR code drawn on the business card.

Somtimes, we need to change businees cards after deployment.
For various reasons, such as wanting to know that a job has changed, department changes, etc.
this Smart Contract can change the information simply without redistributing business card.

The existing QR-based contacts require to install their application and they used private schema.
Therefore, they were not popularized.

Why Smart Contract?
- Unique addresses without any duplication 
- They will store in the blockchain, so they dont depend on application or service provider.
- For QR code recognition, you do not need to multiple install an app for each service.
  You can install just one of your favorite apps that follow this specification.
- No online maintenance costs.
- You can control ownership of a contract directly.

It's really simple. I want to create a standard form for use as a digital business card.
We can think of two forms like the Bussiness Card.

1. Standard Bussiness Card 
    - It is a normal businees card that informs company and contact information to a person.
2. Commercial Contact Card 
    - It is a infomation card for a store which need reservation, order, delivery.

Especially in case 2, that smart contract can help you peer to peer deal without online shop.

## Specification 

1. Interface 
```
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

	function setValue(string key, string value) onlyOwner public;
    function getValue(string key) public view returns (string);
}
```

2. Usage 

It is very intuitive and easy to use and you can expand data fields.

```
.contact -> return basic struct (name, company...)

.setValue("github", "fxpoet")
.setValue("telegram", "fxpoet")

.extKeys -> "github,telegram"

.getValue("github") -> "fxpoet"
```

3. I18n

People sometimes use two names when live in another country.
country code uses ISO 3166-1 alpha-2.
<https://wikipedia.org/wiki/ISO_3166-1>

```
.contact.country -> "kr"   // Korea
.contact.name -> "Kiyoung" // name you use in your country.

.setValue("name_us", "Yodelay")
```

## Implementation
Interface Codes:  

<https://github.com/fxpoet/erc_contact_card/blob/master/ContactCardInterface.sol>

Contact Card Example:  

<https://github.com/fxpoet/erc_contact_card/blob/master/ContactCard.sol>
