pragma solidity ^0.6.2;
// Time trigger mechanisms using multiple contracts

interface AlarmWakeUp {
    function callback(bytes _data) public;
}

contract AlarmService {
  struct TimeEvent {
    addres _addr;
    byte _data;
  }
  mapping(uint => TimeEvent[]) private _events;
  function setAlarm(uint _time) public returns(bool) {
    TimeEvent _timeEvent;
    _timeEvent._addr = msg.sender;
    _timeEvent._data = msg.data;
    _events[_time].push(_timeEvent);
  }

  function callAlarm(uint _time) public {
    // address[] addresses = _events[_time];
    TimeEvent[] timeEvents = _events[_time];
    for(uint i = 0; timeEvents.length < i; i++) {
      AlarmWakeUp(timeEvents[i].addr).callback(timeEvents[i].data);
    }
  }
}
contract AlarmTrigger {
  AlarmService private _alarmService;

  constructor() public {
    _alarmService = new AlarmService();
  }

  function callback(bytes _data) public {
    // Do something here with _data
  }
  function setAlarm() public {
    _alarmService.setAlarm(block.timestamp + 60);
  }
}