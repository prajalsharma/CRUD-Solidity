// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Curd{

    struct employees{
        string name;
        string emailId;
        uint256 age;
        address walletAddress;
    }

    employees[] public employee;
    uint256 totalEmployees;

    constructor(){
        totalEmployees = 0 ;
    }
    function addEmployee(string memory _name,string memory _emailId,uint256 _age, address _walletAaddress) public returns(uint256){
        employees memory newEmployee = employees(_name,_emailId,_age,_walletAaddress);
        employee.push(newEmployee);
        totalEmployees++;
        return totalEmployees;
    }

    function updateEmployee(address _walletAddress, string memory newName, string memory newEmailId, uint256 newAge, address newAddress)public returns(bool){
        for(uint i=0 ; i < totalEmployees; i++){
            if(employee[i].walletAddress == _walletAddress){
                if(bytes(newName).length != 0){ 
                    employee[i].name = newName;
                        
                }else if( bytes(newEmailId).length != 0){
                    employee[i].emailId = newEmailId;
                }else if( newAge != 0){
                    employee[i].age = newAge;
                }else if (newAddress != 0x0000000000000000000000000000000000000000){
                    employee[i].walletAddress = newAddress;
                    return true;
                }else{
                    employee[i].name = employee[i].name;
                    employee[i].emailId = employee[i].emailId;
                    employee[i].age = employee[i].age;
                    employee[i].walletAddress = employee[i].walletAddress;
                }
                
            }
           
        }
        return false ;
    }

    function deleteEmployee(address _walletAddress) public {
        for(uint i=0 ; i < totalEmployees; i++){
            if(employee[i].walletAddress == _walletAddress){
               delete employee[i];
            }
        }
        
    }

    
}