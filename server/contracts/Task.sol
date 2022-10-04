// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract TaskContract {
     uint public unlockTime;
    address payable public owner;

    constructor(uint _unlockTime) payable {
        require(
            block.timestamp < _unlockTime,
            "Unlock time should be in the future"
        );

        unlockTime = _unlockTime;
        owner = payable(msg.sender);
    }

    event AddTask(address recipient, uint taskId);
    event DeleteTask(uint taskId, bool isDeleted);

    struct Task { 
        uint id;
        address username;
        string taskText;
        bool isDeleted;
    }

    Task[] private tasks;

    // Mapping of Tweet id to the wallet address of the user
    //mapping(uint256 => address) taskToOwner;

    // Method to be called by our frontend when trying to add a new Tweet
    function addTask(string memory taskText, bool isDeleted) external {
        uint taskId = tasks.length;
        tasks.push(Task(taskId, msg.sender, taskText, isDeleted));
       
        emit AddTask(msg.sender, taskId);
    }

    // Method to get only your Tweets
    function getMyTasks() external view returns (Task[] memory) {
        
        return tasks;
    }

    // Method to Delete a Tweet
    function deleteTask(uint taskId, bool isDeleted) external {
       
        tasks[taskId].isDeleted = isDeleted;
        emit DeleteTask(taskId, isDeleted);

    }

}