// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract MainContract {
  //structure of the Task
  struct Task {
    string task;
    bool isDone;
  }

  //create mapping to get quick access to Task set that an owner has
  mapping (address => Task[]) private ownerToTask;

  //function to create a task
  function addTask(string calldata _task) external {
    ownerToTask[msg.sender].push(Task({
      task:_task,
      isDone:false
      }));
  }

  //function to get a task from the blockchain
  function getTask(uint _taskIndex) external view returns (Task memory) {
    Task storage task = ownerToTask[msg.sender][_taskIndex];
    return task;
  }

  //function to update a task to be done/not done
  function updateStatus(uint256 _taskIndex, bool _status) external {
    ownerToTask[msg.sender][_taskIndex].isDone = _status;
  }

  //function to delete a task
  function deleteTask(uint256 _taskIndex) external{
    delete ownerToTask[msg.sender][_taskIndex];
  }

  // Defining a function to get task count.
  function getTaskCount() external view returns (uint256) {
    return ownerToTask[msg.sender].length;
  }
}



