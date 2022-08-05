// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

contract TodoList {
  
  struct TaskTodo {
    uint id;
    string text;
    bool isCompleted;
  }

  TaskTodo[] public todos;
  mapping(address => TaskTodo[]) public tasks;

  function createTask(uint _id, string memory _text) public {
    todos.push(TaskTodo(_id,_text,false));
    tasks[msg.sender] = todos;
  }

  function addTaskWithRespectToAddress(address _address) public {
    tasks[_address].push(TaskTodo(2,"Shehryar",false));
  }

  function getTaskWithRespectToAddress(address _address) public view returns(TaskTodo[] memory) {
    return tasks[_address];
  }

  function deleteTaskWithRespectToAddressId(address _address,uint _id) public {
    // Task[] memory getTask  = tasks[_address][_id];
    delete tasks[_address][_id];
  }


  
}
