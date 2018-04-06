pragma solidity ^0.4.19;

/**
 * Data Structs
 */
library Data {

    /**
     * Contract Administrator
     * @field status Contract external service status.
     * @field platformName Current contract platform name.
     * @field account Current contract administrator.
     */
    struct Admin {
        bool status;
        bytes32 platformName;
        address account;
    }

    /**
     * Transaction Proposal
     * @field status Transaction proposal status(false:pending,true:complete).
     * @field fromAccount Account of form platform.
     * @field toAccount Account of to platform.
     * @field value Transfer amount.
     * @field voters Proposers.
     */
    struct Proposal {
        bool status;
        address fromAccount;
        address toAccount;
        uint value;
        address[] voters;
    }

    /**
     * Trusted Platform
     * @field status Trusted platform state(false:no trusted,true:trusted).
     * @field weight weight of platform.
     * @field publicKeys list of public key.
     * @field proposals list of proposal.
     */
    struct Platform {
        bool status;
        uint weight;
        address[] publicKeys;
        mapping(string => Proposal) proposals;
    }
}