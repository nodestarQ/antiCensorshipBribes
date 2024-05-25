// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {AntiCensorShipBriber} from "./AntiCensorShipBriber.sol";

import {IAntiCensorShipBriberFactory} from "./interfaces/IAntiCensorShipBriberFactory.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";


contract AntiCensorShipBriberFactory is IAntiCensorShipBriberFactory {
   address public implementation = address(new AntiCensorShipBriber());

   function createBribe(address _contractAddress, bytes4[] calldata _funcSelectors, address _rewardToken, uint256 _rewardPerCall) override public {
      address deployerAddress = msg.sender;

      address instance = Clones.clone(implementation);
      AntiCensorShipBriber(instance).initialize(_contractAddress, _funcSelectors, _rewardToken, _rewardPerCall);
      emit CreatBribe(deployerAddress, _contractAddress);
   }
}