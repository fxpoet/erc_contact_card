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
